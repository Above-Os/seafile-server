/* -*- Mode: C; tab-width: 4; indent-tabs-mode: nil; c-basic-offset: 4 -*- */

#include "common.h"

#include "utils.h"
#include "log.h"

#include "seafile-session.h"
#include "repo-mgr.h"

#include "seafile-error.h"
#include "seaf-utils.h"
/*
 * Permission priority: owner --> personal share --> group share --> public.
 * Permission with higher priority overwrites those with lower priority.
 */

static gboolean
check_repo_share_perm_cb (SeafDBRow *row, void *data)
{
    char **orig_perm = data;
    char *perm = g_strdup (seaf_db_row_get_column_text (row, 0));

    if (g_strcmp0(perm, "rw") == 0) {
        g_free (*orig_perm);
        *orig_perm = perm;
        return FALSE;
    } else if (g_strcmp0(perm, "r") == 0 && !(*orig_perm)) {
        *orig_perm = perm;
        return TRUE;
    }

    g_free (perm);
    return TRUE;
}

void rtrim(char* str) {
    int len = strlen(str);
    while (len > 0 && isspace(str[len - 1])) {
        str[len - 1] = '\0';
        len--;
    }
}

static char *
check_group_permission_by_user (SeafRepoManager *mgr,
                                const char *repo_id,
                                const char *user_name)
{
    char *permission = NULL;
    GList *groups = NULL, *p1;
    CcnetGroup *group;
    int group_id;
    GString *sql;

    /* Get the groups this user belongs to. */
    groups = ccnet_group_manager_get_groups_by_user (seaf->group_mgr, user_name,
                                                     1, NULL);
    if (!groups) {
        goto out;
    }

    sql = g_string_new ("");
    g_string_printf (sql, "SELECT permission FROM RepoGroup WHERE repo_id = ? AND group_id IN (");
    for (p1 = groups; p1 != NULL; p1 = p1->next) {
        group = p1->data;
        g_object_get (group, "id", &group_id, NULL);

        g_string_append_printf (sql, "%d", group_id);
        if (p1->next)
            g_string_append_printf (sql, ",");
    }
    g_string_append_printf (sql, ")");

    if (seaf_db_statement_foreach_row (mgr->seaf->db, sql->str,
                                       check_repo_share_perm_cb, &permission,
                                       1, "string", repo_id) < 0) {
        seaf_warning ("DB error when get repo share permission for repo %s.\n", repo_id);
    }

    g_string_free (sql, TRUE);

out:
    for (p1 = groups; p1 != NULL; p1 = p1->next)
        g_object_unref ((GObject *)p1->data);
    g_list_free (groups);
    return permission;
}

static char *
check_repo_share_permission (SeafRepoManager *mgr,
                             const char *repo_id,
                             const char *user_name)
{
    char *permission;

    permission = seaf_share_manager_check_permission (seaf->share_mgr,
                                                      repo_id,
                                                      user_name);
    if (permission != NULL) {
        rtrim(permission);
        return permission;
    }

    permission = check_group_permission_by_user (mgr, repo_id, user_name);
    if (permission != NULL) {
        rtrim(permission);
        return permission;
    }

    if (!mgr->seaf->cloud_mode) {
        permission = seaf_repo_manager_get_inner_pub_repo_perm(mgr, repo_id);
        if (permission != NULL)
            rtrim(permission);
        return permission;
    }

    return NULL;
}

// get dir perm from all dir perms in parent repo
// such as path /a/b, then check /a/b, /a in parent
static char *
get_dir_perm (GHashTable *perms, const char *path)
{
    char *tmp = g_strdup (path);
    char *slash;
    char *perm = NULL;

    while (g_strcmp0 (tmp, "") != 0) {
        perm = g_hash_table_lookup (perms, tmp);
        if (perm)
            break;
        slash = g_strrstr (tmp, "/");
        *slash = '\0';
    }

    g_free (tmp);

    return g_strdup (perm);
}

static char *
check_perm_on_parent_repo (const char *origin_repo_id,
                           const char *user,
                           const char *vpath)
{
    GHashTable *user_perms = NULL;
    GHashTable *group_perms = NULL;
    GList *groups = NULL;
    GList *iter;
    char *perm = NULL;

    user_perms = seaf_share_manager_get_shared_dirs_to_user (seaf->share_mgr,
                                                             origin_repo_id,
                                                             user);

    if (!user_perms) {
        return NULL;
    }

    if (g_hash_table_size (user_perms) > 0) {
        perm = get_dir_perm (user_perms, vpath);
        if (perm) {
            g_hash_table_destroy (user_perms);
            return perm;
        }
    }
    g_hash_table_destroy (user_perms);

    groups = ccnet_group_manager_get_groups_by_user (seaf->group_mgr, user,
                                                     1, NULL);
    if (!groups) {
        return NULL;
    }

    group_perms = seaf_share_manager_get_shared_dirs_to_group (seaf->share_mgr,
                                                               origin_repo_id,
                                                               groups);

    for (iter = groups; iter; iter = iter->next)
        g_object_unref ((GObject *)iter->data);
    g_list_free (groups);

    if (!group_perms) {
        return NULL;
    }
    if (g_hash_table_size (group_perms) > 0) {
        perm = get_dir_perm (group_perms, vpath);
    }
    g_hash_table_destroy (group_perms);

    return perm;
}

static char *
check_virtual_repo_permission (SeafRepoManager *mgr,
                               const char *repo_id,
                               const char *origin_repo_id,
                               const char *user,
                               const char *vpath)
{
    char *owner = NULL;
    char *permission = NULL;

    /* If I'm the owner of origin repo, I have full access to sub-repos. */
    owner = seaf_repo_manager_get_repo_owner (mgr, origin_repo_id);
    if (g_strcmp0 (user, owner) == 0) {
        g_free (owner);
        permission = g_strdup("rw");
        return permission;
    }
    g_free (owner);

    /* If I'm not the owner of origin repo, this sub-repo can be created
     * from a shared repo by me or directly shared by others to me.
     * The priority of shared sub-folder is higher than top-level repo.
     */
    permission = check_perm_on_parent_repo (origin_repo_id,
                                            user, vpath);
    if (permission) {
        return permission;
    }

    permission = check_repo_share_permission (mgr, origin_repo_id, user);

    return permission;
}

/*
 * Comprehensive repo access permission checker.
 *
 * Returns read/write permission.
 */
char *
seaf_repo_manager_check_permission (SeafRepoManager *mgr,
                                    const char *repo_id,
                                    const char *user,
                                    GError **error)
{
    SeafVirtRepo *vinfo;
    char *owner = NULL;
    char *permission = NULL;

    /* This is a virtual repo.*/
    vinfo = seaf_repo_manager_get_virtual_repo_info (mgr, repo_id);
    if (vinfo) {
        permission = check_virtual_repo_permission (mgr, repo_id,
                                                    vinfo->origin_repo_id,
                                                    user, vinfo->path);
        goto out;
    }

    owner = seaf_repo_manager_get_repo_owner (mgr, repo_id);
    if (owner != NULL) {
        if (strcmp (owner, user) == 0)
            permission = g_strdup("rw");
        else
            permission = check_repo_share_permission (mgr, repo_id, user);
    }

out:
    seaf_virtual_repo_info_free (vinfo);
    g_free (owner);
    return permission;
}

/*
 * Directories are always before files. Otherwise compare the names.
 */
static gint
comp_dirent_func (gconstpointer a, gconstpointer b)
{
    const SeafDirent *dent_a = a, *dent_b = b;

    if (S_ISDIR(dent_a->mode) && S_ISREG(dent_b->mode))
        return -1;

    if (S_ISREG(dent_a->mode) && S_ISDIR(dent_b->mode))
        return 1;

    return strcasecmp (dent_a->name, dent_b->name);
}

GList *
seaf_repo_manager_list_dir_with_perm (SeafRepoManager *mgr,
                                      const char *repo_id,
                                      const char *dir_path,
                                      const char *dir_id,
                                      const char *user,
                                      int offset,
                                      int limit,
                                      GError **error)
{
    SeafRepo *repo;
    char *perm = NULL;
    SeafDir *dir;
    SeafDirent *dent;
    SeafileDirent *d;
    GList *res = NULL;
    GList *p;

    perm = seaf_repo_manager_check_permission (mgr, repo_id, user, error);
    if (!perm) {
        if (*error == NULL)
            g_set_error (error, SEAFILE_DOMAIN, SEAF_ERR_BAD_ARGS, "Access denied");
        return NULL;
    }

    repo = seaf_repo_manager_get_repo (seaf->repo_mgr, repo_id);
    if (!repo) {
        g_set_error (error, SEAFILE_DOMAIN, SEAF_ERR_BAD_ARGS, "Bad repo id");
        g_free (perm);
        return NULL;
    }

    dir = seaf_fs_manager_get_seafdir (seaf->fs_mgr,
                                       repo->store_id, repo->version, dir_id);
    if (!dir) {
        g_set_error (error, SEAFILE_DOMAIN, SEAF_ERR_BAD_DIR_ID, "Bad dir id");
        seaf_repo_unref (repo);
        g_free (perm);
        return NULL;
    }

    dir->entries = g_list_sort (dir->entries, comp_dirent_func);

    if (offset < 0) {
        offset = 0;
    }

    int index = 0;
    gboolean is_shared;
    char *cur_path;
    GHashTable *shared_sub_dirs = NULL;

    if (!repo->virtual_info) {
        char *repo_owner = seaf_repo_manager_get_repo_owner (seaf->repo_mgr, repo_id);
        if (repo_owner && strcmp (user, repo_owner) == 0) {
            shared_sub_dirs = seaf_share_manager_get_shared_sub_dirs (seaf->share_mgr,
                                                                      repo->store_id,
                                                                      dir_path);
        }
        g_free (repo_owner);
    }

    for (p = dir->entries; p != NULL; p = p->next, index++) {
        if (index < offset) {
            continue;
        }

        if (limit > 0) {
            if (index >= offset + limit)
                break;
        }

        dent = p->data;

        if (!is_object_id_valid (dent->id))
            continue;

        d = g_object_new (SEAFILE_TYPE_DIRENT,
                          "obj_id", dent->id,
                          "obj_name", dent->name,
                          "mode", dent->mode,
                          "version", dent->version,
                          "mtime", dent->mtime,
                          "size", dent->size,
                          "permission", perm,
                          "modifier", dent->modifier,
                          NULL);

        if (shared_sub_dirs && S_ISDIR(dent->mode)) {
            if (strcmp (dir_path, "/") == 0) {
                cur_path = g_strconcat (dir_path, dent->name, NULL);
            } else {
                cur_path = g_strconcat (dir_path, "/", dent->name, NULL);
            }
            is_shared = g_hash_table_lookup (shared_sub_dirs, cur_path) ? TRUE : FALSE;
            g_free (cur_path);
            g_object_set (d, "is_shared", is_shared, NULL);
        }
        res = g_list_prepend (res, d);
    }

    if (shared_sub_dirs)
        g_hash_table_destroy (shared_sub_dirs);
    seaf_dir_free (dir);
    seaf_repo_unref (repo);
    g_free (perm);
    if (res)
        res = g_list_reverse (res);

    return res;
}

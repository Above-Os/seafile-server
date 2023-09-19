-- MySQL dump 10.13  Distrib 8.0.33, for macos13.3 (arm64)
--
-- Host: localhost    Database: ccnet
-- ------------------------------------------------------
-- Server version	8.0.33

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `ccnet`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `ccnet` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `ccnet`;

--
-- Table structure for table `Binding`
--

DROP TABLE IF EXISTS `Binding`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Binding` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `email` varchar(255) DEFAULT NULL,
  `peer_id` char(41) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `peer_id` (`peer_id`),
  KEY `email` (`email`(20))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Binding`
--

LOCK TABLES `Binding` WRITE;
/*!40000 ALTER TABLE `Binding` DISABLE KEYS */;
/*!40000 ALTER TABLE `Binding` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EmailUser`
--

DROP TABLE IF EXISTS `EmailUser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `EmailUser` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `email` varchar(255) DEFAULT NULL,
  `passwd` varchar(256) DEFAULT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `ctime` bigint DEFAULT NULL,
  `reference_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `reference_id` (`reference_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EmailUser`
--

LOCK TABLES `EmailUser` WRITE;
/*!40000 ALTER TABLE `EmailUser` DISABLE KEYS */;
-- INSERT INTO `EmailUser` VALUES (1,'8373ee7d41a448088c8da8bb9976dc4c@auth.local','PBKDF2SHA256$10000$6ee85f609cda7eda0524c2317b03d450612961c9411077ab61ed9ab59b857ab5$f9d8dd77c73ba7b9b5d164c27c4f59aaf3c27a6a1330c2e66b966bb39979d4e8',1,1,1690354251415236,NULL);
/*!40000 ALTER TABLE `EmailUser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Group`
--

DROP TABLE IF EXISTS `Group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Group` (
  `group_id` bigint NOT NULL AUTO_INCREMENT,
  `group_name` varchar(255) DEFAULT NULL,
  `creator_name` varchar(255) DEFAULT NULL,
  `timestamp` bigint DEFAULT NULL,
  `type` varchar(32) DEFAULT NULL,
  `parent_group_id` int DEFAULT NULL,
  PRIMARY KEY (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Group`
--

LOCK TABLES `Group` WRITE;
/*!40000 ALTER TABLE `Group` DISABLE KEYS */;
/*!40000 ALTER TABLE `Group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `GroupDNPair`
--

DROP TABLE IF EXISTS `GroupDNPair`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `GroupDNPair` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int DEFAULT NULL,
  `dn` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `GroupDNPair`
--

LOCK TABLES `GroupDNPair` WRITE;
/*!40000 ALTER TABLE `GroupDNPair` DISABLE KEYS */;
/*!40000 ALTER TABLE `GroupDNPair` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `GroupStructure`
--

DROP TABLE IF EXISTS `GroupStructure`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `GroupStructure` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int DEFAULT NULL,
  `path` varchar(1024) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `group_id` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `GroupStructure`
--

LOCK TABLES `GroupStructure` WRITE;
/*!40000 ALTER TABLE `GroupStructure` DISABLE KEYS */;
/*!40000 ALTER TABLE `GroupStructure` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `GroupUser`
--

DROP TABLE IF EXISTS `GroupUser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `GroupUser` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` bigint DEFAULT NULL,
  `user_name` varchar(255) DEFAULT NULL,
  `is_staff` tinyint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `group_id` (`group_id`,`user_name`),
  KEY `user_name` (`user_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `GroupUser`
--

LOCK TABLES `GroupUser` WRITE;
/*!40000 ALTER TABLE `GroupUser` DISABLE KEYS */;
/*!40000 ALTER TABLE `GroupUser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `LDAPConfig`
--

DROP TABLE IF EXISTS `LDAPConfig`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `LDAPConfig` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `cfg_group` varchar(255) NOT NULL,
  `cfg_key` varchar(255) NOT NULL,
  `value` varchar(255) DEFAULT NULL,
  `property` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `LDAPConfig`
--

LOCK TABLES `LDAPConfig` WRITE;
/*!40000 ALTER TABLE `LDAPConfig` DISABLE KEYS */;
/*!40000 ALTER TABLE `LDAPConfig` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `LDAPUsers`
--

DROP TABLE IF EXISTS `LDAPUsers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `LDAPUsers` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `extra_attrs` text,
  `reference_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `reference_id` (`reference_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `LDAPUsers`
--

LOCK TABLES `LDAPUsers` WRITE;
/*!40000 ALTER TABLE `LDAPUsers` DISABLE KEYS */;
/*!40000 ALTER TABLE `LDAPUsers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Organization`
--

DROP TABLE IF EXISTS `Organization`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Organization` (
  `org_id` bigint NOT NULL AUTO_INCREMENT,
  `org_name` varchar(255) DEFAULT NULL,
  `url_prefix` varchar(255) DEFAULT NULL,
  `creator` varchar(255) DEFAULT NULL,
  `ctime` bigint DEFAULT NULL,
  PRIMARY KEY (`org_id`),
  UNIQUE KEY `url_prefix` (`url_prefix`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Organization`
--

LOCK TABLES `Organization` WRITE;
/*!40000 ALTER TABLE `Organization` DISABLE KEYS */;
/*!40000 ALTER TABLE `Organization` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OrgGroup`
--

DROP TABLE IF EXISTS `OrgGroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `OrgGroup` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `org_id` int DEFAULT NULL,
  `group_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `org_id` (`org_id`,`group_id`),
  KEY `group_id` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OrgGroup`
--

LOCK TABLES `OrgGroup` WRITE;
/*!40000 ALTER TABLE `OrgGroup` DISABLE KEYS */;
/*!40000 ALTER TABLE `OrgGroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OrgUser`
--

DROP TABLE IF EXISTS `OrgUser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `OrgUser` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `org_id` int DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `is_staff` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `org_id` (`org_id`,`email`),
  KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OrgUser`
--

LOCK TABLES `OrgUser` WRITE;
/*!40000 ALTER TABLE `OrgUser` DISABLE KEYS */;
/*!40000 ALTER TABLE `OrgUser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `UserRole`
--

DROP TABLE IF EXISTS `UserRole`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `UserRole` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `email` varchar(255) DEFAULT NULL,
  `role` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `UserRole`
--

LOCK TABLES `UserRole` WRITE;
/*!40000 ALTER TABLE `UserRole` DISABLE KEYS */;
/*!40000 ALTER TABLE `UserRole` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Current Database: `seafile`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `seafile` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `seafile`;

--
-- Table structure for table `Branch`
--

DROP TABLE IF EXISTS `Branch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Branch` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(10) DEFAULT NULL,
  `repo_id` char(41) DEFAULT NULL,
  `commit_id` char(41) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `repo_id` (`repo_id`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Branch`
--

LOCK TABLES `Branch` WRITE;
/*!40000 ALTER TABLE `Branch` DISABLE KEYS */;
INSERT INTO `Branch` VALUES (1,'master','41dc2f97-1ab0-4e12-83f2-9fcb4cabb77c','f8e30a57ecb339890e50fec392184a73f9866ece'),(2,'master','22d69746-c8e9-40be-9598-90215e6adbdb','6d1dd48b72ce691eef71a1fa9ab8206d4f6c9efe');
/*!40000 ALTER TABLE `Branch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `GarbageRepos`
--

DROP TABLE IF EXISTS `GarbageRepos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `GarbageRepos` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `repo_id` char(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `repo_id` (`repo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `GarbageRepos`
--

LOCK TABLES `GarbageRepos` WRITE;
/*!40000 ALTER TABLE `GarbageRepos` DISABLE KEYS */;
/*!40000 ALTER TABLE `GarbageRepos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `InnerPubRepo`
--

DROP TABLE IF EXISTS `InnerPubRepo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `InnerPubRepo` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `repo_id` char(37) DEFAULT NULL,
  `permission` char(15) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `repo_id` (`repo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `InnerPubRepo`
--

LOCK TABLES `InnerPubRepo` WRITE;
/*!40000 ALTER TABLE `InnerPubRepo` DISABLE KEYS */;
/*!40000 ALTER TABLE `InnerPubRepo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OrgQuota`
--

DROP TABLE IF EXISTS `OrgQuota`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `OrgQuota` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `org_id` int DEFAULT NULL,
  `quota` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `org_id` (`org_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OrgQuota`
--

LOCK TABLES `OrgQuota` WRITE;
/*!40000 ALTER TABLE `OrgQuota` DISABLE KEYS */;
/*!40000 ALTER TABLE `OrgQuota` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OrgUserQuota`
--

DROP TABLE IF EXISTS `OrgUserQuota`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `OrgUserQuota` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `org_id` int DEFAULT NULL,
  `user` varchar(255) DEFAULT NULL,
  `quota` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `org_id` (`org_id`,`user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OrgUserQuota`
--

LOCK TABLES `OrgUserQuota` WRITE;
/*!40000 ALTER TABLE `OrgUserQuota` DISABLE KEYS */;
/*!40000 ALTER TABLE `OrgUserQuota` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Repo`
--

DROP TABLE IF EXISTS `Repo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Repo` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `repo_id` char(37) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `repo_id` (`repo_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Repo`
--

LOCK TABLES `Repo` WRITE;
/*!40000 ALTER TABLE `Repo` DISABLE KEYS */;
INSERT INTO `Repo` VALUES (1,'41dc2f97-1ab0-4e12-83f2-9fcb4cabb77c'); /*,(2,'22d69746-c8e9-40be-9598-90215e6adbdb');*/
/*!40000 ALTER TABLE `Repo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RepoFileCount`
--

DROP TABLE IF EXISTS `RepoFileCount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RepoFileCount` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `repo_id` char(36) DEFAULT NULL,
  `file_count` bigint unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `repo_id` (`repo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RepoFileCount`
--

LOCK TABLES `RepoFileCount` WRITE;
/*!40000 ALTER TABLE `RepoFileCount` DISABLE KEYS */;
/*!40000 ALTER TABLE `RepoFileCount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RepoGroup`
--

DROP TABLE IF EXISTS `RepoGroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RepoGroup` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `repo_id` char(37) DEFAULT NULL,
  `group_id` int DEFAULT NULL,
  `user_name` varchar(255) DEFAULT NULL,
  `permission` char(15) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `group_id` (`group_id`,`repo_id`),
  KEY `repo_id` (`repo_id`),
  KEY `user_name` (`user_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RepoGroup`
--

LOCK TABLES `RepoGroup` WRITE;
/*!40000 ALTER TABLE `RepoGroup` DISABLE KEYS */;
/*!40000 ALTER TABLE `RepoGroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RepoHead`
--

DROP TABLE IF EXISTS `RepoHead`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RepoHead` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `repo_id` char(37) DEFAULT NULL,
  `branch_name` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `repo_id` (`repo_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RepoHead`
--

LOCK TABLES `RepoHead` WRITE;
/*!40000 ALTER TABLE `RepoHead` DISABLE KEYS */;
INSERT INTO `RepoHead` VALUES (1,'41dc2f97-1ab0-4e12-83f2-9fcb4cabb77c','master'); /*,(2,'22d69746-c8e9-40be-9598-90215e6adbdb','master');*/
/*!40000 ALTER TABLE `RepoHead` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RepoHistoryLimit`
--

DROP TABLE IF EXISTS `RepoHistoryLimit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RepoHistoryLimit` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `repo_id` char(37) DEFAULT NULL,
  `days` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `repo_id` (`repo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RepoHistoryLimit`
--

LOCK TABLES `RepoHistoryLimit` WRITE;
/*!40000 ALTER TABLE `RepoHistoryLimit` DISABLE KEYS */;
/*!40000 ALTER TABLE `RepoHistoryLimit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RepoInfo`
--

DROP TABLE IF EXISTS `RepoInfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RepoInfo` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `repo_id` char(36) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `update_time` bigint DEFAULT NULL,
  `version` int DEFAULT NULL,
  `is_encrypted` int DEFAULT NULL,
  `last_modifier` varchar(255) DEFAULT NULL,
  `status` int DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `repo_id` (`repo_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RepoInfo`
--

LOCK TABLES `RepoInfo` WRITE;
/*!40000 ALTER TABLE `RepoInfo` DISABLE KEYS */;
INSERT INTO `RepoInfo` VALUES (1,'41dc2f97-1ab0-4e12-83f2-9fcb4cabb77c','My Library Template',1690354184,1,0,'system',0); /*,(2,'22d69746-c8e9-40be-9598-90215e6adbdb','My Library',1690354274,1,0,'8373ee7d41a448088c8da8bb9976dc4c@auth.local',0);*/
/*!40000 ALTER TABLE `RepoInfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RepoOwner`
--

DROP TABLE IF EXISTS `RepoOwner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RepoOwner` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `repo_id` char(37) DEFAULT NULL,
  `owner_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `repo_id` (`repo_id`),
  KEY `owner_id` (`owner_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RepoOwner`
--

LOCK TABLES `RepoOwner` WRITE;
/*!40000 ALTER TABLE `RepoOwner` DISABLE KEYS */;
INSERT INTO `RepoOwner` VALUES (1,'41dc2f97-1ab0-4e12-83f2-9fcb4cabb77c','System'); /*,(2,'22d69746-c8e9-40be-9598-90215e6adbdb','8373ee7d41a448088c8da8bb9976dc4c@auth.local');*/
/*!40000 ALTER TABLE `RepoOwner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RepoSize`
--

DROP TABLE IF EXISTS `RepoSize`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RepoSize` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `repo_id` char(37) DEFAULT NULL,
  `size` bigint unsigned DEFAULT NULL,
  `head_id` char(41) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `repo_id` (`repo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RepoSize`
--

LOCK TABLES `RepoSize` WRITE;
/*!40000 ALTER TABLE `RepoSize` DISABLE KEYS */;
/*!40000 ALTER TABLE `RepoSize` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RepoTokenPeerInfo`
--

DROP TABLE IF EXISTS `RepoTokenPeerInfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RepoTokenPeerInfo` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `token` char(41) DEFAULT NULL,
  `peer_id` char(41) DEFAULT NULL,
  `peer_ip` varchar(50) DEFAULT NULL,
  `peer_name` varchar(255) DEFAULT NULL,
  `sync_time` bigint DEFAULT NULL,
  `client_ver` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `token` (`token`),
  KEY `peer_id` (`peer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RepoTokenPeerInfo`
--

LOCK TABLES `RepoTokenPeerInfo` WRITE;
/*!40000 ALTER TABLE `RepoTokenPeerInfo` DISABLE KEYS */;
/*!40000 ALTER TABLE `RepoTokenPeerInfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RepoTrash`
--

DROP TABLE IF EXISTS `RepoTrash`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RepoTrash` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `repo_id` char(36) DEFAULT NULL,
  `repo_name` varchar(255) DEFAULT NULL,
  `head_id` char(40) DEFAULT NULL,
  `owner_id` varchar(255) DEFAULT NULL,
  `size` bigint DEFAULT NULL,
  `org_id` int DEFAULT NULL,
  `del_time` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `repo_id` (`repo_id`),
  KEY `owner_id` (`owner_id`),
  KEY `org_id` (`org_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RepoTrash`
--

LOCK TABLES `RepoTrash` WRITE;
/*!40000 ALTER TABLE `RepoTrash` DISABLE KEYS */;
/*!40000 ALTER TABLE `RepoTrash` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RepoUserToken`
--

DROP TABLE IF EXISTS `RepoUserToken`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RepoUserToken` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `repo_id` char(37) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `token` char(41) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `repo_id` (`repo_id`,`token`),
  KEY `token` (`token`),
  KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RepoUserToken`
--

LOCK TABLES `RepoUserToken` WRITE;
/*!40000 ALTER TABLE `RepoUserToken` DISABLE KEYS */;
/*!40000 ALTER TABLE `RepoUserToken` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RepoValidSince`
--

DROP TABLE IF EXISTS `RepoValidSince`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RepoValidSince` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `repo_id` char(37) DEFAULT NULL,
  `timestamp` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `repo_id` (`repo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RepoValidSince`
--

LOCK TABLES `RepoValidSince` WRITE;
/*!40000 ALTER TABLE `RepoValidSince` DISABLE KEYS */;
/*!40000 ALTER TABLE `RepoValidSince` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SeafileConf`
--

DROP TABLE IF EXISTS `SeafileConf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SeafileConf` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `cfg_group` varchar(255) NOT NULL,
  `cfg_key` varchar(255) NOT NULL,
  `value` varchar(255) DEFAULT NULL,
  `property` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SeafileConf`
--

LOCK TABLES `SeafileConf` WRITE;
/*!40000 ALTER TABLE `SeafileConf` DISABLE KEYS */;
/*!40000 ALTER TABLE `SeafileConf` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SharedRepo`
--

DROP TABLE IF EXISTS `SharedRepo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SharedRepo` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `repo_id` char(37) DEFAULT NULL,
  `from_email` varchar(255) DEFAULT NULL,
  `to_email` varchar(255) DEFAULT NULL,
  `permission` char(15) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `repo_id` (`repo_id`),
  KEY `from_email` (`from_email`),
  KEY `to_email` (`to_email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SharedRepo`
--

LOCK TABLES `SharedRepo` WRITE;
/*!40000 ALTER TABLE `SharedRepo` DISABLE KEYS */;
/*!40000 ALTER TABLE `SharedRepo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SystemInfo`
--

DROP TABLE IF EXISTS `SystemInfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SystemInfo` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `info_key` varchar(256) DEFAULT NULL,
  `info_value` varchar(1024) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SystemInfo`
--

LOCK TABLES `SystemInfo` WRITE;
/*!40000 ALTER TABLE `SystemInfo` DISABLE KEYS */;
INSERT INTO `SystemInfo` VALUES (1,'default_repo_id','41dc2f97-1ab0-4e12-83f2-9fcb4cabb77c');
/*!40000 ALTER TABLE `SystemInfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `UserQuota`
--

DROP TABLE IF EXISTS `UserQuota`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `UserQuota` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user` varchar(255) DEFAULT NULL,
  `quota` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user` (`user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `UserQuota`
--

LOCK TABLES `UserQuota` WRITE;
/*!40000 ALTER TABLE `UserQuota` DISABLE KEYS */;
/*!40000 ALTER TABLE `UserQuota` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `UserShareQuota`
--

DROP TABLE IF EXISTS `UserShareQuota`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `UserShareQuota` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user` varchar(255) DEFAULT NULL,
  `quota` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user` (`user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `UserShareQuota`
--

LOCK TABLES `UserShareQuota` WRITE;
/*!40000 ALTER TABLE `UserShareQuota` DISABLE KEYS */;
/*!40000 ALTER TABLE `UserShareQuota` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `VirtualRepo`
--

DROP TABLE IF EXISTS `VirtualRepo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `VirtualRepo` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `repo_id` char(36) DEFAULT NULL,
  `origin_repo` char(36) DEFAULT NULL,
  `path` text,
  `base_commit` char(40) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `repo_id` (`repo_id`),
  KEY `origin_repo` (`origin_repo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `VirtualRepo`
--

LOCK TABLES `VirtualRepo` WRITE;
/*!40000 ALTER TABLE `VirtualRepo` DISABLE KEYS */;
/*!40000 ALTER TABLE `VirtualRepo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `WebAP`
--

DROP TABLE IF EXISTS `WebAP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `WebAP` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `repo_id` char(37) DEFAULT NULL,
  `access_property` char(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `repo_id` (`repo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `WebAP`
--

LOCK TABLES `WebAP` WRITE;
/*!40000 ALTER TABLE `WebAP` DISABLE KEYS */;
/*!40000 ALTER TABLE `WebAP` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `WebUploadTempFiles`
--

DROP TABLE IF EXISTS `WebUploadTempFiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `WebUploadTempFiles` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `repo_id` char(40) NOT NULL,
  `file_path` text NOT NULL,
  `tmp_file_path` text NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `repo_id` (`repo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `WebUploadTempFiles`
--

LOCK TABLES `WebUploadTempFiles` WRITE;
/*!40000 ALTER TABLE `WebUploadTempFiles` DISABLE KEYS */;
/*!40000 ALTER TABLE `WebUploadTempFiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Current Database: `seahub`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `seahub` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `seahub`;

--
-- Table structure for table `abuse_reports_abusereport`
--

DROP TABLE IF EXISTS `abuse_reports_abusereport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `abuse_reports_abusereport` (
  `id` int NOT NULL AUTO_INCREMENT,
  `reporter` longtext,
  `repo_id` varchar(36) NOT NULL,
  `repo_name` varchar(255) NOT NULL,
  `file_path` longtext,
  `abuse_type` varchar(255) NOT NULL,
  `description` longtext,
  `handled` tinyint(1) NOT NULL,
  `time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `abuse_reports_abusereport_abuse_type_703d5335` (`abuse_type`),
  KEY `abuse_reports_abusereport_handled_94b8304c` (`handled`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `abuse_reports_abusereport`
--

LOCK TABLES `abuse_reports_abusereport` WRITE;
/*!40000 ALTER TABLE `abuse_reports_abusereport` DISABLE KEYS */;
/*!40000 ALTER TABLE `abuse_reports_abusereport` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_log_adminlog`
--

DROP TABLE IF EXISTS `admin_log_adminlog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin_log_adminlog` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(254) NOT NULL,
  `operation` varchar(255) NOT NULL,
  `detail` longtext NOT NULL,
  `datetime` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `admin_log_adminlog_email_7213c993` (`email`),
  KEY `admin_log_adminlog_operation_4bad7bd1` (`operation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_log_adminlog`
--

LOCK TABLES `admin_log_adminlog` WRITE;
/*!40000 ALTER TABLE `admin_log_adminlog` DISABLE KEYS */;
/*!40000 ALTER TABLE `admin_log_adminlog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api2_token`
--

DROP TABLE IF EXISTS `api2_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `api2_token` (
  `key` varchar(40) NOT NULL,
  `user` varchar(255) NOT NULL,
  `created` datetime(6) NOT NULL,
  PRIMARY KEY (`key`),
  UNIQUE KEY `user` (`user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api2_token`
--

LOCK TABLES `api2_token` WRITE;
/*!40000 ALTER TABLE `api2_token` DISABLE KEYS */;
/*!40000 ALTER TABLE `api2_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api2_tokenv2`
--

DROP TABLE IF EXISTS `api2_tokenv2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `api2_tokenv2` (
  `key` varchar(40) NOT NULL,
  `user` varchar(255) NOT NULL,
  `platform` varchar(32) NOT NULL,
  `device_id` varchar(40) NOT NULL,
  `device_name` varchar(40) NOT NULL,
  `platform_version` varchar(16) NOT NULL,
  `client_version` varchar(16) NOT NULL,
  `last_accessed` datetime(6) NOT NULL,
  `last_login_ip` char(39) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `wiped_at` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`key`),
  UNIQUE KEY `api2_tokenv2_user_platform_device_id_37005c24_uniq` (`user`,`platform`,`device_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api2_tokenv2`
--

LOCK TABLES `api2_tokenv2` WRITE;
/*!40000 ALTER TABLE `api2_tokenv2` DISABLE KEYS */;
/*!40000 ALTER TABLE `api2_tokenv2` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=318 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add content type',1,'add_contenttype'),(2,'Can change content type',1,'change_contenttype'),(3,'Can delete content type',1,'delete_contenttype'),(4,'Can view content type',1,'view_contenttype'),(5,'Can change config',2,'change_config'),(6,'Can add session',3,'add_session'),(7,'Can change session',3,'change_session'),(8,'Can delete session',3,'delete_session'),(9,'Can view session',3,'view_session'),(10,'Can add client login token',4,'add_clientlogintoken'),(11,'Can change client login token',4,'change_clientlogintoken'),(12,'Can delete client login token',4,'delete_clientlogintoken'),(13,'Can view client login token',4,'view_clientlogintoken'),(14,'Can add commands last check',5,'add_commandslastcheck'),(15,'Can change commands last check',5,'change_commandslastcheck'),(16,'Can delete commands last check',5,'delete_commandslastcheck'),(17,'Can view commands last check',5,'view_commandslastcheck'),(18,'Can add device token',6,'add_devicetoken'),(19,'Can change device token',6,'change_devicetoken'),(20,'Can delete device token',6,'delete_devicetoken'),(21,'Can view device token',6,'view_devicetoken'),(22,'Can add file comment',7,'add_filecomment'),(23,'Can change file comment',7,'change_filecomment'),(24,'Can delete file comment',7,'delete_filecomment'),(25,'Can view file comment',7,'view_filecomment'),(26,'Can add user last login',8,'add_userlastlogin'),(27,'Can change user last login',8,'change_userlastlogin'),(28,'Can delete user last login',8,'delete_userlastlogin'),(29,'Can view user last login',8,'view_userlastlogin'),(30,'Can add user starred files',9,'add_userstarredfiles'),(31,'Can change user starred files',9,'change_userstarredfiles'),(32,'Can delete user starred files',9,'delete_userstarredfiles'),(33,'Can view user starred files',9,'view_userstarredfiles'),(34,'Can add repo secret key',10,'add_reposecretkey'),(35,'Can change repo secret key',10,'change_reposecretkey'),(36,'Can delete repo secret key',10,'delete_reposecretkey'),(37,'Can view repo secret key',10,'view_reposecretkey'),(38,'Can add external department',11,'add_externaldepartment'),(39,'Can change external department',11,'change_externaldepartment'),(40,'Can delete external department',11,'delete_externaldepartment'),(41,'Can view external department',11,'view_externaldepartment'),(42,'Can add social auth user',12,'add_socialauthuser'),(43,'Can change social auth user',12,'change_socialauthuser'),(44,'Can delete social auth user',12,'delete_socialauthuser'),(45,'Can view social auth user',12,'view_socialauthuser'),(46,'Can add user monitored repos',13,'add_usermonitoredrepos'),(47,'Can change user monitored repos',13,'change_usermonitoredrepos'),(48,'Can delete user monitored repos',13,'delete_usermonitoredrepos'),(49,'Can view user monitored repos',13,'view_usermonitoredrepos'),(50,'Can add permission',14,'add_permission'),(51,'Can change permission',14,'change_permission'),(52,'Can delete permission',14,'delete_permission'),(53,'Can view permission',14,'view_permission'),(54,'Can add group',15,'add_group'),(55,'Can change group',15,'change_group'),(56,'Can delete group',15,'delete_group'),(57,'Can view group',15,'view_group'),(58,'Can add user',16,'add_user'),(59,'Can change user',16,'change_user'),(60,'Can delete user',16,'delete_user'),(61,'Can view user',16,'view_user'),(62,'Can add registration profile',17,'add_registrationprofile'),(63,'Can change registration profile',17,'change_registrationprofile'),(64,'Can delete registration profile',17,'delete_registrationprofile'),(65,'Can view registration profile',17,'view_registrationprofile'),(66,'Can add captcha store',18,'add_captchastore'),(67,'Can change captcha store',18,'change_captchastore'),(68,'Can delete captcha store',18,'delete_captchastore'),(69,'Can view captcha store',18,'view_captchastore'),(70,'Can add constance',19,'add_constance'),(71,'Can change constance',19,'change_constance'),(72,'Can delete constance',19,'delete_constance'),(73,'Can view constance',19,'view_constance'),(74,'Can add Terms and Conditions',20,'add_termsandconditions'),(75,'Can change Terms and Conditions',20,'change_termsandconditions'),(76,'Can delete Terms and Conditions',20,'delete_termsandconditions'),(77,'Can view Terms and Conditions',20,'view_termsandconditions'),(78,'Can add User Terms and Conditions',21,'add_usertermsandconditions'),(79,'Can change User Terms and Conditions',21,'change_usertermsandconditions'),(80,'Can delete User Terms and Conditions',21,'delete_usertermsandconditions'),(81,'Can view User Terms and Conditions',21,'view_usertermsandconditions'),(82,'Can add token',22,'add_token'),(83,'Can change token',22,'change_token'),(84,'Can delete token',22,'delete_token'),(85,'Can view token',22,'view_token'),(86,'Can add token v2',23,'add_tokenv2'),(87,'Can change token v2',23,'change_tokenv2'),(88,'Can delete token v2',23,'delete_tokenv2'),(89,'Can view token v2',23,'view_tokenv2'),(90,'Can add avatar',24,'add_avatar'),(91,'Can change avatar',24,'change_avatar'),(92,'Can delete avatar',24,'delete_avatar'),(93,'Can view avatar',24,'view_avatar'),(94,'Can add group avatar',25,'add_groupavatar'),(95,'Can change group avatar',25,'change_groupavatar'),(96,'Can delete group avatar',25,'delete_groupavatar'),(97,'Can view group avatar',25,'view_groupavatar'),(98,'Can add contact',26,'add_contact'),(99,'Can change contact',26,'change_contact'),(100,'Can delete contact',26,'delete_contact'),(101,'Can view contact',26,'view_contact'),(102,'Can add draft',27,'add_draft'),(103,'Can change draft',27,'change_draft'),(104,'Can delete draft',27,'delete_draft'),(105,'Can view draft',27,'view_draft'),(106,'Can add draft reviewer',28,'add_draftreviewer'),(107,'Can change draft reviewer',28,'change_draftreviewer'),(108,'Can delete draft reviewer',28,'delete_draftreviewer'),(109,'Can view draft reviewer',28,'view_draftreviewer'),(110,'Can add institution',29,'add_institution'),(111,'Can change institution',29,'change_institution'),(112,'Can delete institution',29,'delete_institution'),(113,'Can view institution',29,'view_institution'),(114,'Can add institution admin',30,'add_institutionadmin'),(115,'Can change institution admin',30,'change_institutionadmin'),(116,'Can delete institution admin',30,'delete_institutionadmin'),(117,'Can view institution admin',30,'view_institutionadmin'),(118,'Can add institution quota',31,'add_institutionquota'),(119,'Can change institution quota',31,'change_institutionquota'),(120,'Can delete institution quota',31,'delete_institutionquota'),(121,'Can view institution quota',31,'view_institutionquota'),(122,'Can add invitation',32,'add_invitation'),(123,'Can change invitation',32,'change_invitation'),(124,'Can delete invitation',32,'delete_invitation'),(125,'Can view invitation',32,'view_invitation'),(126,'Can add repo share invitation',33,'add_reposhareinvitation'),(127,'Can change repo share invitation',33,'change_reposhareinvitation'),(128,'Can delete repo share invitation',33,'delete_reposhareinvitation'),(129,'Can view repo share invitation',33,'view_reposhareinvitation'),(130,'Can add wiki',34,'add_wiki'),(131,'Can change wiki',34,'change_wiki'),(132,'Can delete wiki',34,'delete_wiki'),(133,'Can view wiki',34,'view_wiki'),(134,'Can add notification',35,'add_notification'),(135,'Can change notification',35,'change_notification'),(136,'Can delete notification',35,'delete_notification'),(137,'Can view notification',35,'view_notification'),(138,'Can add user notification',36,'add_usernotification'),(139,'Can change user notification',36,'change_usernotification'),(140,'Can delete user notification',36,'delete_usernotification'),(141,'Can view user notification',36,'view_usernotification'),(142,'Can add user options',37,'add_useroptions'),(143,'Can change user options',37,'change_useroptions'),(144,'Can delete user options',37,'delete_useroptions'),(145,'Can view user options',37,'view_useroptions'),(146,'Can add only office doc key',38,'add_onlyofficedockey'),(147,'Can change only office doc key',38,'change_onlyofficedockey'),(148,'Can delete only office doc key',38,'delete_onlyofficedockey'),(149,'Can view only office doc key',38,'view_onlyofficedockey'),(150,'Can add detailed profile',39,'add_detailedprofile'),(151,'Can change detailed profile',39,'change_detailedprofile'),(152,'Can delete detailed profile',39,'delete_detailedprofile'),(153,'Can view detailed profile',39,'view_detailedprofile'),(154,'Can add profile',40,'add_profile'),(155,'Can change profile',40,'change_profile'),(156,'Can delete profile',40,'delete_profile'),(157,'Can view profile',40,'view_profile'),(158,'Can add anonymous share',41,'add_anonymousshare'),(159,'Can change anonymous share',41,'change_anonymousshare'),(160,'Can delete anonymous share',41,'delete_anonymousshare'),(161,'Can view anonymous share',41,'view_anonymousshare'),(162,'Can add extra groups share permission',42,'add_extragroupssharepermission'),(163,'Can change extra groups share permission',42,'change_extragroupssharepermission'),(164,'Can delete extra groups share permission',42,'delete_extragroupssharepermission'),(165,'Can view extra groups share permission',42,'view_extragroupssharepermission'),(166,'Can add extra share permission',43,'add_extrasharepermission'),(167,'Can change extra share permission',43,'change_extrasharepermission'),(168,'Can delete extra share permission',43,'delete_extrasharepermission'),(169,'Can view extra share permission',43,'view_extrasharepermission'),(170,'Can add file share',44,'add_fileshare'),(171,'Can change file share',44,'change_fileshare'),(172,'Can delete file share',44,'delete_fileshare'),(173,'Can view file share',44,'view_fileshare'),(174,'Can add org file share',45,'add_orgfileshare'),(175,'Can change org file share',45,'change_orgfileshare'),(176,'Can delete org file share',45,'delete_orgfileshare'),(177,'Can view org file share',45,'view_orgfileshare'),(178,'Can add private file dir share',46,'add_privatefiledirshare'),(179,'Can change private file dir share',46,'change_privatefiledirshare'),(180,'Can delete private file dir share',46,'delete_privatefiledirshare'),(181,'Can view private file dir share',46,'view_privatefiledirshare'),(182,'Can add upload link share',47,'add_uploadlinkshare'),(183,'Can change upload link share',47,'change_uploadlinkshare'),(184,'Can delete upload link share',47,'delete_uploadlinkshare'),(185,'Can view upload link share',47,'view_uploadlinkshare'),(186,'Can add custom share permissions',48,'add_customsharepermissions'),(187,'Can change custom share permissions',48,'change_customsharepermissions'),(188,'Can delete custom share permissions',48,'delete_customsharepermissions'),(189,'Can view custom share permissions',48,'view_customsharepermissions'),(190,'Can add admin log',49,'add_adminlog'),(191,'Can change admin log',49,'change_adminlog'),(192,'Can delete admin log',49,'delete_adminlog'),(193,'Can view admin log',49,'view_adminlog'),(194,'Can add file tag',50,'add_filetag'),(195,'Can change file tag',50,'change_filetag'),(196,'Can delete file tag',50,'delete_filetag'),(197,'Can view file tag',50,'view_filetag'),(198,'Can add file uuid map',51,'add_fileuuidmap'),(199,'Can change file uuid map',51,'change_fileuuidmap'),(200,'Can delete file uuid map',51,'delete_fileuuidmap'),(201,'Can view file uuid map',51,'view_fileuuidmap'),(202,'Can add tags',52,'add_tags'),(203,'Can change tags',52,'change_tags'),(204,'Can delete tags',52,'delete_tags'),(205,'Can view tags',52,'view_tags'),(206,'Can add revision tags',53,'add_revisiontags'),(207,'Can change revision tags',53,'change_revisiontags'),(208,'Can delete revision tags',53,'delete_revisiontags'),(209,'Can view revision tags',53,'view_revisiontags'),(210,'Can add tags',54,'add_tags'),(211,'Can change tags',54,'change_tags'),(212,'Can delete tags',54,'delete_tags'),(213,'Can view tags',54,'view_tags'),(214,'Can add phone device',55,'add_phonedevice'),(215,'Can change phone device',55,'change_phonedevice'),(216,'Can delete phone device',55,'delete_phonedevice'),(217,'Can view phone device',55,'view_phonedevice'),(218,'Can add static device',56,'add_staticdevice'),(219,'Can change static device',56,'change_staticdevice'),(220,'Can delete static device',56,'delete_staticdevice'),(221,'Can view static device',56,'view_staticdevice'),(222,'Can add static token',57,'add_statictoken'),(223,'Can change static token',57,'change_statictoken'),(224,'Can delete static token',57,'delete_statictoken'),(225,'Can view static token',57,'view_statictoken'),(226,'Can add TOTP device',58,'add_totpdevice'),(227,'Can change TOTP device',58,'change_totpdevice'),(228,'Can delete TOTP device',58,'delete_totpdevice'),(229,'Can view TOTP device',58,'view_totpdevice'),(230,'Can add admin role',59,'add_adminrole'),(231,'Can change admin role',59,'change_adminrole'),(232,'Can delete admin role',59,'delete_adminrole'),(233,'Can view admin role',59,'view_adminrole'),(234,'Can add trusted ip',60,'add_trustedip'),(235,'Can change trusted ip',60,'change_trustedip'),(236,'Can delete trusted ip',60,'delete_trustedip'),(237,'Can view trusted ip',60,'view_trustedip'),(238,'Can add repo tags',61,'add_repotags'),(239,'Can change repo tags',61,'change_repotags'),(240,'Can delete repo tags',61,'delete_repotags'),(241,'Can view repo tags',61,'view_repotags'),(242,'Can add file tags',62,'add_filetags'),(243,'Can change file tags',62,'change_filetags'),(244,'Can delete file tags',62,'delete_filetags'),(245,'Can view file tags',62,'view_filetags'),(246,'Can add related files',63,'add_relatedfiles'),(247,'Can change related files',63,'change_relatedfiles'),(248,'Can delete related files',63,'delete_relatedfiles'),(249,'Can view related files',63,'view_relatedfiles'),(250,'Can add file participant',64,'add_fileparticipant'),(251,'Can change file participant',64,'change_fileparticipant'),(252,'Can delete file participant',64,'delete_fileparticipant'),(253,'Can view file participant',64,'view_fileparticipant'),(254,'Can add repo api tokens',65,'add_repoapitokens'),(255,'Can change repo api tokens',65,'change_repoapitokens'),(256,'Can delete repo api tokens',65,'delete_repoapitokens'),(257,'Can view repo api tokens',65,'view_repoapitokens'),(258,'Can add abuse report',66,'add_abusereport'),(259,'Can change abuse report',66,'change_abusereport'),(260,'Can delete abuse report',66,'delete_abusereport'),(261,'Can view abuse report',66,'view_abusereport'),(262,'Can add repo auto delete',67,'add_repoautodelete'),(263,'Can change repo auto delete',67,'change_repoautodelete'),(264,'Can delete repo auto delete',67,'delete_repoautodelete'),(265,'Can view repo auto delete',67,'view_repoautodelete'),(266,'Can add ocm share',68,'add_ocmshare'),(267,'Can change ocm share',68,'change_ocmshare'),(268,'Can delete ocm share',68,'delete_ocmshare'),(269,'Can view ocm share',68,'view_ocmshare'),(270,'Can add ocm share received',69,'add_ocmsharereceived'),(271,'Can change ocm share received',69,'change_ocmsharereceived'),(272,'Can delete ocm share received',69,'delete_ocmsharereceived'),(273,'Can view ocm share received',69,'view_ocmsharereceived'),(274,'Can add received shares',70,'add_receivedshares'),(275,'Can change received shares',70,'change_receivedshares'),(276,'Can delete received shares',70,'delete_receivedshares'),(277,'Can view received shares',70,'view_receivedshares'),(278,'Can add user login log',71,'add_userloginlog'),(279,'Can change user login log',71,'change_userloginlog'),(280,'Can delete user login log',71,'delete_userloginlog'),(281,'Can view user login log',71,'view_userloginlog'),(282,'Can add org member quota',72,'add_orgmemberquota'),(283,'Can change org member quota',72,'change_orgmemberquota'),(284,'Can delete org member quota',72,'delete_orgmemberquota'),(285,'Can view org member quota',72,'view_orgmemberquota'),(286,'Can add org settings',73,'add_orgsettings'),(287,'Can change org settings',73,'change_orgsettings'),(288,'Can delete org settings',73,'delete_orgsettings'),(289,'Can view org settings',73,'view_orgsettings'),(290,'Can add org saml config',74,'add_orgsamlconfig'),(291,'Can change org saml config',74,'change_orgsamlconfig'),(292,'Can delete org saml config',74,'delete_orgsamlconfig'),(293,'Can view org saml config',74,'view_orgsamlconfig'),(294,'Can add org admin settings',75,'add_orgadminsettings'),(295,'Can change org admin settings',75,'change_orgadminsettings'),(296,'Can delete org admin settings',75,'delete_orgadminsettings'),(297,'Can view org admin settings',75,'view_orgadminsettings'),(298,'Can add proxy granting ticket',76,'add_proxygrantingticket'),(299,'Can change proxy granting ticket',76,'change_proxygrantingticket'),(300,'Can delete proxy granting ticket',76,'delete_proxygrantingticket'),(301,'Can view proxy granting ticket',76,'view_proxygrantingticket'),(302,'Can add session ticket',77,'add_sessionticket'),(303,'Can change session ticket',77,'change_sessionticket'),(304,'Can delete session ticket',77,'delete_sessionticket'),(305,'Can view session ticket',77,'view_sessionticket'),(306,'Can add seadoc history name',78,'add_seadochistoryname'),(307,'Can change seadoc history name',78,'change_seadochistoryname'),(308,'Can delete seadoc history name',78,'delete_seadochistoryname'),(309,'Can view seadoc history name',78,'view_seadochistoryname'),(310,'Can add seadoc draft',79,'add_seadocdraft'),(311,'Can change seadoc draft',79,'change_seadocdraft'),(312,'Can delete seadoc draft',79,'delete_seadocdraft'),(313,'Can view seadoc draft',79,'view_seadocdraft'),(314,'Can add seadoc revision',80,'add_seadocrevision'),(315,'Can change seadoc revision',80,'change_seadocrevision'),(316,'Can delete seadoc revision',80,'delete_seadocrevision'),(317,'Can view seadoc revision',80,'view_seadocrevision');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `avatar_avatar`
--

DROP TABLE IF EXISTS `avatar_avatar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `avatar_avatar` (
  `id` int NOT NULL AUTO_INCREMENT,
  `emailuser` varchar(255) NOT NULL,
  `primary` tinyint(1) NOT NULL,
  `avatar` varchar(1024) NOT NULL,
  `date_uploaded` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `avatar_avatar`
--

LOCK TABLES `avatar_avatar` WRITE;
/*!40000 ALTER TABLE `avatar_avatar` DISABLE KEYS */;
/*!40000 ALTER TABLE `avatar_avatar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `avatar_groupavatar`
--

DROP TABLE IF EXISTS `avatar_groupavatar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `avatar_groupavatar` (
  `id` int NOT NULL AUTO_INCREMENT,
  `group_id` varchar(255) NOT NULL,
  `avatar` varchar(1024) NOT NULL,
  `date_uploaded` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `avatar_groupavatar`
--

LOCK TABLES `avatar_groupavatar` WRITE;
/*!40000 ALTER TABLE `avatar_groupavatar` DISABLE KEYS */;
/*!40000 ALTER TABLE `avatar_groupavatar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `base_clientlogintoken`
--

DROP TABLE IF EXISTS `base_clientlogintoken`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `base_clientlogintoken` (
  `token` varchar(32) NOT NULL,
  `username` varchar(255) NOT NULL,
  `timestamp` datetime(6) NOT NULL,
  PRIMARY KEY (`token`),
  KEY `base_clientlogintoken_username_4ad5d42c` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `base_clientlogintoken`
--

LOCK TABLES `base_clientlogintoken` WRITE;
/*!40000 ALTER TABLE `base_clientlogintoken` DISABLE KEYS */;
/*!40000 ALTER TABLE `base_clientlogintoken` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `base_commandslastcheck`
--

DROP TABLE IF EXISTS `base_commandslastcheck`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `base_commandslastcheck` (
  `id` int NOT NULL AUTO_INCREMENT,
  `command_type` varchar(100) NOT NULL,
  `last_check` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `base_commandslastcheck`
--

LOCK TABLES `base_commandslastcheck` WRITE;
/*!40000 ALTER TABLE `base_commandslastcheck` DISABLE KEYS */;
/*!40000 ALTER TABLE `base_commandslastcheck` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `base_devicetoken`
--

DROP TABLE IF EXISTS `base_devicetoken`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `base_devicetoken` (
  `id` int NOT NULL AUTO_INCREMENT,
  `token` varchar(80) NOT NULL,
  `user` varchar(255) NOT NULL,
  `platform` varchar(32) NOT NULL,
  `version` varchar(16) NOT NULL,
  `pversion` varchar(16) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `base_devicetoken_token_user_38535636_uniq` (`token`,`user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `base_devicetoken`
--

LOCK TABLES `base_devicetoken` WRITE;
/*!40000 ALTER TABLE `base_devicetoken` DISABLE KEYS */;
/*!40000 ALTER TABLE `base_devicetoken` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `base_filecomment`
--

DROP TABLE IF EXISTS `base_filecomment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `base_filecomment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `author` varchar(255) NOT NULL,
  `comment` longtext NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `uuid_id` char(32) NOT NULL,
  `detail` longtext NOT NULL DEFAULT (_utf8mb3'b\'\''),
  `resolved` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `base_filecomment_uuid_id_4f9a2ca2_fk_tags_fileuuidmap_uuid` (`uuid_id`),
  KEY `base_filecomment_author_8a4d7e91` (`author`),
  KEY `base_filecomment_resolved_e0717eca` (`resolved`),
  CONSTRAINT `base_filecomment_uuid_id_4f9a2ca2_fk_tags_fileuuidmap_uuid` FOREIGN KEY (`uuid_id`) REFERENCES `tags_fileuuidmap` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `base_filecomment`
--

LOCK TABLES `base_filecomment` WRITE;
/*!40000 ALTER TABLE `base_filecomment` DISABLE KEYS */;
/*!40000 ALTER TABLE `base_filecomment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `base_reposecretkey`
--

DROP TABLE IF EXISTS `base_reposecretkey`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `base_reposecretkey` (
  `id` int NOT NULL AUTO_INCREMENT,
  `repo_id` varchar(36) NOT NULL,
  `secret_key` varchar(44) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `repo_id` (`repo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `base_reposecretkey`
--

LOCK TABLES `base_reposecretkey` WRITE;
/*!40000 ALTER TABLE `base_reposecretkey` DISABLE KEYS */;
/*!40000 ALTER TABLE `base_reposecretkey` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `base_userlastlogin`
--

DROP TABLE IF EXISTS `base_userlastlogin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `base_userlastlogin` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `last_login` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `base_userlastlogin_username_270de06f` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `base_userlastlogin`
--

LOCK TABLES `base_userlastlogin` WRITE;
/*!40000 ALTER TABLE `base_userlastlogin` DISABLE KEYS */;
INSERT INTO `base_userlastlogin` VALUES (1,'8373ee7d41a448088c8da8bb9976dc4c@auth.local','2023-07-26 06:51:14.660247');
/*!40000 ALTER TABLE `base_userlastlogin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `base_usermonitoredrepos`
--

DROP TABLE IF EXISTS `base_usermonitoredrepos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `base_usermonitoredrepos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(254) NOT NULL,
  `repo_id` varchar(36) NOT NULL,
  `timestamp` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `base_usermonitoredrepos_email_repo_id_b4ab00e4_uniq` (`email`,`repo_id`),
  KEY `base_usermonitoredrepos_email_55ead1b9` (`email`),
  KEY `base_usermonitoredrepos_repo_id_00e624c3` (`repo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `base_usermonitoredrepos`
--

LOCK TABLES `base_usermonitoredrepos` WRITE;
/*!40000 ALTER TABLE `base_usermonitoredrepos` DISABLE KEYS */;
/*!40000 ALTER TABLE `base_usermonitoredrepos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `base_userstarredfiles`
--

DROP TABLE IF EXISTS `base_userstarredfiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `base_userstarredfiles` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(254) NOT NULL,
  `org_id` int NOT NULL,
  `repo_id` varchar(36) NOT NULL,
  `path` longtext NOT NULL,
  `is_dir` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `base_userstarredfiles_email_29e69053` (`email`),
  KEY `base_userstarredfiles_repo_id_f5ecc00a` (`repo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `base_userstarredfiles`
--

LOCK TABLES `base_userstarredfiles` WRITE;
/*!40000 ALTER TABLE `base_userstarredfiles` DISABLE KEYS */;
/*!40000 ALTER TABLE `base_userstarredfiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `captcha_captchastore`
--

DROP TABLE IF EXISTS `captcha_captchastore`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `captcha_captchastore` (
  `id` int NOT NULL AUTO_INCREMENT,
  `challenge` varchar(32) NOT NULL,
  `response` varchar(32) NOT NULL,
  `hashkey` varchar(40) NOT NULL,
  `expiration` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `hashkey` (`hashkey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `captcha_captchastore`
--

LOCK TABLES `captcha_captchastore` WRITE;
/*!40000 ALTER TABLE `captcha_captchastore` DISABLE KEYS */;
/*!40000 ALTER TABLE `captcha_captchastore` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `constance_config`
--

DROP TABLE IF EXISTS `constance_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `constance_config` (
  `id` int NOT NULL AUTO_INCREMENT,
  `constance_key` varchar(255) NOT NULL,
  `value` longtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `constance_key` (`constance_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `constance_config`
--

LOCK TABLES `constance_config` WRITE;
/*!40000 ALTER TABLE `constance_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `constance_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contacts_contact`
--

DROP TABLE IF EXISTS `contacts_contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contacts_contact` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_email` varchar(255) NOT NULL,
  `contact_email` varchar(255) NOT NULL,
  `contact_name` varchar(255) DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `contacts_contact_user_email_149035d4` (`user_email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contacts_contact`
--

LOCK TABLES `contacts_contact` WRITE;
/*!40000 ALTER TABLE `contacts_contact` DISABLE KEYS */;
/*!40000 ALTER TABLE `contacts_contact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `custom_share_permission`
--

DROP TABLE IF EXISTS `custom_share_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `custom_share_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `repo_id` varchar(36) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(500) NOT NULL,
  `permission` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `custom_share_permission_repo_id_578fe49f` (`repo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `custom_share_permission`
--

LOCK TABLES `custom_share_permission` WRITE;
/*!40000 ALTER TABLE `custom_share_permission` DISABLE KEYS */;
/*!40000 ALTER TABLE `custom_share_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_cas_ng_proxygrantingticket`
--

DROP TABLE IF EXISTS `django_cas_ng_proxygrantingticket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_cas_ng_proxygrantingticket` (
  `id` int NOT NULL AUTO_INCREMENT,
  `session_key` varchar(255) DEFAULT NULL,
  `pgtiou` varchar(255) DEFAULT NULL,
  `pgt` varchar(255) DEFAULT NULL,
  `date` datetime(6) NOT NULL,
  `user` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_cas_ng_proxygrant_session_key_user_id_4cd2ea19_uniq` (`session_key`,`user`),
  KEY `django_cas_ng_proxyg_user_id_f833edd2_fk_auth_user` (`user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_cas_ng_proxygrantingticket`
--

LOCK TABLES `django_cas_ng_proxygrantingticket` WRITE;
/*!40000 ALTER TABLE `django_cas_ng_proxygrantingticket` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_cas_ng_proxygrantingticket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_cas_ng_sessionticket`
--

DROP TABLE IF EXISTS `django_cas_ng_sessionticket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_cas_ng_sessionticket` (
  `id` int NOT NULL AUTO_INCREMENT,
  `session_key` varchar(255) NOT NULL,
  `ticket` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_cas_ng_sessionticket`
--

LOCK TABLES `django_cas_ng_sessionticket` WRITE;
/*!40000 ALTER TABLE `django_cas_ng_sessionticket` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_cas_ng_sessionticket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (66,'abuse_reports','abusereport'),(49,'admin_log','adminlog'),(22,'api2','token'),(23,'api2','tokenv2'),(15,'auth','group'),(14,'auth','permission'),(16,'auth','user'),(24,'avatar','avatar'),(25,'avatar','groupavatar'),(4,'base','clientlogintoken'),(5,'base','commandslastcheck'),(6,'base','devicetoken'),(11,'base','externaldepartment'),(7,'base','filecomment'),(10,'base','reposecretkey'),(12,'base','socialauthuser'),(8,'base','userlastlogin'),(13,'base','usermonitoredrepos'),(9,'base','userstarredfiles'),(18,'captcha','captchastore'),(2,'constance','config'),(26,'contacts','contact'),(1,'contenttypes','contenttype'),(19,'database','constance'),(76,'django_cas_ng','proxygrantingticket'),(77,'django_cas_ng','sessionticket'),(27,'drafts','draft'),(28,'drafts','draftreviewer'),(64,'file_participants','fileparticipant'),(62,'file_tags','filetags'),(29,'institutions','institution'),(30,'institutions','institutionadmin'),(31,'institutions','institutionquota'),(32,'invitations','invitation'),(33,'invitations','reposhareinvitation'),(35,'notifications','notification'),(36,'notifications','usernotification'),(68,'ocm','ocmshare'),(69,'ocm','ocmsharereceived'),(70,'ocm_via_webdav','receivedshares'),(38,'onlyoffice','onlyofficedockey'),(37,'options','useroptions'),(75,'organizations','orgadminsettings'),(72,'organizations','orgmemberquota'),(74,'organizations','orgsamlconfig'),(73,'organizations','orgsettings'),(39,'profile','detailedprofile'),(40,'profile','profile'),(17,'registration','registrationprofile'),(63,'related_files','relatedfiles'),(65,'repo_api_tokens','repoapitokens'),(67,'repo_auto_delete','repoautodelete'),(61,'repo_tags','repotags'),(53,'revision_tag','revisiontags'),(54,'revision_tag','tags'),(59,'role_permissions','adminrole'),(79,'seadoc','seadocdraft'),(78,'seadoc','seadochistoryname'),(80,'seadoc','seadocrevision'),(3,'sessions','session'),(41,'share','anonymousshare'),(48,'share','customsharepermissions'),(42,'share','extragroupssharepermission'),(43,'share','extrasharepermission'),(44,'share','fileshare'),(45,'share','orgfileshare'),(46,'share','privatefiledirshare'),(47,'share','uploadlinkshare'),(71,'sysadmin_extra','userloginlog'),(50,'tags','filetag'),(51,'tags','fileuuidmap'),(52,'tags','tags'),(20,'termsandconditions','termsandconditions'),(21,'termsandconditions','usertermsandconditions'),(60,'trusted_ip','trustedip'),(55,'two_factor','phonedevice'),(56,'two_factor','staticdevice'),(57,'two_factor','statictoken'),(58,'two_factor','totpdevice'),(34,'wiki','wiki');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=89 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'abuse_reports','0001_initial','2023-07-26 06:50:23.745983'),(2,'admin_log','0001_initial','2023-07-26 06:50:23.755688'),(3,'api2','0001_initial','2023-07-26 06:50:23.768130'),(4,'contenttypes','0001_initial','2023-07-26 06:50:23.775054'),(5,'contenttypes','0002_remove_content_type_name','2023-07-26 06:50:23.785499'),(6,'auth','0001_initial','2023-07-26 06:50:23.851446'),(7,'auth','0002_alter_permission_name_max_length','2023-07-26 06:50:23.859959'),(8,'auth','0003_alter_user_email_max_length','2023-07-26 06:50:23.868417'),(9,'auth','0004_alter_user_username_opts','2023-07-26 06:50:23.870668'),(10,'auth','0005_alter_user_last_login_null','2023-07-26 06:50:23.877947'),(11,'auth','0006_require_contenttypes_0002','2023-07-26 06:50:23.878607'),(12,'auth','0007_alter_validators_add_error_messages','2023-07-26 06:50:23.880764'),(13,'auth','0008_alter_user_username_max_length','2023-07-26 06:50:23.889334'),(14,'auth','0009_alter_user_last_name_max_length','2023-07-26 06:50:23.897708'),(15,'auth','0010_alter_group_name_max_length','2023-07-26 06:50:23.905732'),(16,'auth','0011_update_proxy_permissions','2023-07-26 06:50:23.910173'),(17,'auth','0012_alter_user_first_name_max_length','2023-07-26 06:50:23.918421'),(18,'avatar','0001_initial','2023-07-26 06:50:23.924842'),(19,'tags','0001_initial','2023-07-26 06:50:23.952245'),(20,'group','0001_initial','2023-07-26 06:50:23.976544'),(21,'base','0001_initial','2023-07-26 06:50:24.050687'),(22,'base','0002_reposecretkey','2023-07-26 06:50:24.056656'),(23,'base','0003_auto_20181016_1242','2023-07-26 06:50:24.075450'),(24,'base','0004_externaldepartment_socialauthuser_usermonitoredrepos_and_more','2023-07-26 06:50:24.144216'),(25,'captcha','0001_initial','2023-07-26 06:50:24.150606'),(26,'captcha','0002_alter_captchastore_id','2023-07-26 06:50:24.155902'),(27,'contacts','0001_initial','2023-07-26 06:50:24.162222'),(28,'contacts','0002_alter_contact_contact_name_alter_contact_note','2023-07-26 06:50:24.165772'),(29,'database','0001_initial','2023-07-26 06:50:24.169966'),(30,'database','0002_auto_20190129_2304','2023-07-26 06:50:24.175546'),(31,'django_cas_ng','0001_initial','2023-07-26 06:50:24.195216'),(32,'django_cas_ng','0002_auto_20180410_0948','2023-07-26 06:50:24.216531'),(33,'drafts','0001_initial','2023-07-26 06:50:24.296588'),(34,'drafts','0002_draftreview_author','2023-07-26 06:50:24.318382'),(35,'drafts','0003_auto_20190301_0648','2023-07-26 06:50:24.432975'),(36,'drafts','0004_auto_20190610_0628','2023-07-26 06:50:24.452419'),(37,'file_participants','0001_initial','2023-07-26 06:50:24.468928'),(38,'repo_tags','0001_initial','2023-07-26 06:50:24.485603'),(39,'file_tags','0001_initial','2023-07-26 06:50:24.510972'),(40,'file_tags','0002_remove_filetags_parent_folder_uuid','2023-07-26 06:50:24.526204'),(41,'group','0002_remove_messageattachment_group_message_and_more','2023-07-26 06:50:24.552146'),(42,'institutions','0001_initial','2023-07-26 06:50:24.566543'),(43,'institutions','0002_institutionquota','2023-07-26 06:50:24.577428'),(44,'institutions','0003_auto_20180426_0710','2023-07-26 06:50:24.584568'),(45,'invitations','0001_initial','2023-07-26 06:50:24.592492'),(46,'invitations','0002_invitation_invite_type','2023-07-26 06:50:24.604588'),(47,'invitations','0003_auto_20160510_1703','2023-07-26 06:50:24.613050'),(48,'invitations','0004_auto_20160629_1610','2023-07-26 06:50:24.619795'),(49,'invitations','0005_auto_20160629_1614','2023-07-26 06:50:24.623731'),(50,'invitations','0006_reposhareinvitation','2023-07-26 06:50:24.637688'),(51,'notifications','0001_initial','2023-07-26 06:50:24.650232'),(52,'notifications','0002_auto_20180426_0710','2023-07-26 06:50:24.655118'),(53,'notifications','0003_auto_20181115_0825','2023-07-26 06:50:24.660290'),(54,'notifications','0004_alter_usernotification_seen','2023-07-26 06:50:24.663247'),(55,'ocm','0001_initial','2023-07-26 06:50:24.699801'),(56,'ocm_via_webdav','0001_initial','2023-07-26 06:50:24.742497'),(57,'ocm_via_webdav','0002_auto_20210926_1503','2023-07-26 06:50:24.753286'),(58,'ocm_via_webdav','0003_auto_20210926_1505','2023-07-26 06:50:24.776980'),(59,'ocm_via_webdav','0004_receivedshares_is_dir','2023-07-26 06:50:24.785183'),(60,'onlyoffice','0001_initial','2023-07-26 06:50:24.791753'),(61,'options','0001_initial','2023-07-26 06:50:24.797873'),(62,'options','0002_auto_20181107_0811','2023-07-26 06:50:24.801247'),(63,'organizations','0001_initial','2023-07-26 06:50:24.806329'),(64,'organizations','0002_orgsettings','2023-07-26 06:50:24.811587'),(65,'organizations','0003_auto_20190116_0323','2023-07-26 06:50:24.818492'),(66,'organizations','0004_orgsamlconfig_orgadminsettings','2023-07-26 06:50:24.830177'),(67,'profile','0001_initial','2023-07-26 06:50:24.848458'),(68,'profile','0002_auto_20190122_0225','2023-07-26 06:50:24.860223'),(69,'profile','0003_alter_profile_institution','2023-07-26 06:50:24.863258'),(70,'registration','0001_initial','2023-07-26 06:50:24.866535'),(71,'related_files','0001_initial','2023-07-26 06:50:24.882678'),(72,'repo_api_tokens','0001_initial','2023-07-26 06:50:24.893046'),(73,'repo_auto_delete','0001_initial','2023-07-26 06:50:24.897204'),(74,'revision_tag','0001_initial','2023-07-26 06:50:24.919885'),(75,'revision_tag','0002_alter_revisiontags_path','2023-07-26 06:50:24.921934'),(76,'role_permissions','0001_initial','2023-07-26 06:50:24.925394'),(77,'sessions','0001_initial','2023-07-26 06:50:24.930857'),(78,'share','0001_initial','2023-07-26 06:50:24.996284'),(79,'share','0002_customsharepermissions_alter_fileshare_permission_and_more','2023-07-26 06:50:25.011599'),(80,'sysadmin_extra','0001_initial','2023-07-26 06:50:25.019804'),(81,'termsandconditions','0001_initial','2023-07-26 06:50:25.040231'),(82,'termsandconditions','0002_alter_termsandconditions_date_active_and_more','2023-07-26 06:50:25.046799'),(83,'trusted_ip','0001_initial','2023-07-26 06:50:25.052687'),(84,'two_factor','0001_initial','2023-07-26 06:50:25.070826'),(85,'wiki','0001_initial','2023-07-26 06:50:25.076836'),(86,'wiki','0002_auto_20180326_0548','2023-07-26 06:50:25.087790'),(87,'wiki','0003_auto_20180428_0619','2023-07-26 06:50:25.091846'),(88,'wiki','0004_delete_groupwiki_delete_personalwiki','2023-07-26 06:50:25.095334');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('jv720ov255fl3qne9bp1stlj7pw8c9ju','.eJxVjMtqwzAQAP9F5yJkaa1HTk1_RKxWGxziR_BaNKH036tQKPQ6zMyX2nnhpfCeF1anC87CbypjO6bcpNMVX1xFFxxzqDAgQDQxUqwYS0kp-EpA769CzxvhrP71BenGa822T4RxakUXFNZItLX1EH3u6sev1Ms7inxue83CItdtzX9gQpnyjZ_9M0IiNIYogRtcNbVYC-PFjBAqJ0f9I61umR_36875EHUafDLODxBAe2_taL9_AOfmUvo:1qOYMc:rTp1fBiXYfqLx7jCYsxdY-QVVf-xbKENN63xtQC8Kyk','2023-07-27 06:51:14.662963');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `drafts_draft`
--

DROP TABLE IF EXISTS `drafts_draft`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `drafts_draft` (
  `id` int NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `username` varchar(255) NOT NULL,
  `origin_repo_id` varchar(36) NOT NULL,
  `origin_file_version` varchar(100) NOT NULL,
  `draft_file_path` varchar(1024) NOT NULL,
  `origin_file_uuid` char(32) NOT NULL,
  `publish_file_version` varchar(100) DEFAULT NULL,
  `status` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `drafts_draft_origin_file_uuid_7c003c98_uniq` (`origin_file_uuid`),
  KEY `drafts_draft_created_at_e9f4523f` (`created_at`),
  KEY `drafts_draft_updated_at_0a144b05` (`updated_at`),
  KEY `drafts_draft_username_73e6738b` (`username`),
  KEY `drafts_draft_origin_repo_id_8978ca2c` (`origin_repo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `drafts_draft`
--

LOCK TABLES `drafts_draft` WRITE;
/*!40000 ALTER TABLE `drafts_draft` DISABLE KEYS */;
/*!40000 ALTER TABLE `drafts_draft` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `drafts_draftreviewer`
--

DROP TABLE IF EXISTS `drafts_draftreviewer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `drafts_draftreviewer` (
  `id` int NOT NULL AUTO_INCREMENT,
  `reviewer` varchar(255) NOT NULL,
  `draft_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `drafts_draftreviewer_draft_id_4ea59775_fk_drafts_draft_id` (`draft_id`),
  KEY `drafts_draftreviewer_reviewer_e4c777ac` (`reviewer`),
  CONSTRAINT `drafts_draftreviewer_draft_id_4ea59775_fk_drafts_draft_id` FOREIGN KEY (`draft_id`) REFERENCES `drafts_draft` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `drafts_draftreviewer`
--

LOCK TABLES `drafts_draftreviewer` WRITE;
/*!40000 ALTER TABLE `drafts_draftreviewer` DISABLE KEYS */;
/*!40000 ALTER TABLE `drafts_draftreviewer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `external_department`
--

DROP TABLE IF EXISTS `external_department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `external_department` (
  `id` int NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `provider` varchar(32) NOT NULL,
  `outer_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `group_id` (`group_id`),
  UNIQUE KEY `external_department_provider_outer_id_32f31347_uniq` (`provider`,`outer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `external_department`
--

LOCK TABLES `external_department` WRITE;
/*!40000 ALTER TABLE `external_department` DISABLE KEYS */;
/*!40000 ALTER TABLE `external_department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `file_participants_fileparticipant`
--

DROP TABLE IF EXISTS `file_participants_fileparticipant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `file_participants_fileparticipant` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `uuid_id` char(32) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `file_participants_fileparticipant_uuid_id_username_c747dd36_uniq` (`uuid_id`,`username`),
  CONSTRAINT `file_participants_fi_uuid_id_861b7339_fk_tags_file` FOREIGN KEY (`uuid_id`) REFERENCES `tags_fileuuidmap` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `file_participants_fileparticipant`
--

LOCK TABLES `file_participants_fileparticipant` WRITE;
/*!40000 ALTER TABLE `file_participants_fileparticipant` DISABLE KEYS */;
/*!40000 ALTER TABLE `file_participants_fileparticipant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `file_tags_filetags`
--

DROP TABLE IF EXISTS `file_tags_filetags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `file_tags_filetags` (
  `id` int NOT NULL AUTO_INCREMENT,
  `file_uuid_id` char(32) NOT NULL,
  `repo_tag_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `file_tags_filetags_file_uuid_id_e30f0ec8_fk_tags_file` (`file_uuid_id`),
  KEY `file_tags_filetags_repo_tag_id_c39660cb_fk_repo_tags_repotags_id` (`repo_tag_id`),
  CONSTRAINT `file_tags_filetags_file_uuid_id_e30f0ec8_fk_tags_file` FOREIGN KEY (`file_uuid_id`) REFERENCES `tags_fileuuidmap` (`uuid`),
  CONSTRAINT `file_tags_filetags_repo_tag_id_c39660cb_fk_repo_tags_repotags_id` FOREIGN KEY (`repo_tag_id`) REFERENCES `repo_tags_repotags` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `file_tags_filetags`
--

LOCK TABLES `file_tags_filetags` WRITE;
/*!40000 ALTER TABLE `file_tags_filetags` DISABLE KEYS */;
/*!40000 ALTER TABLE `file_tags_filetags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `institutions_institution`
--

DROP TABLE IF EXISTS `institutions_institution`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `institutions_institution` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `create_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `institutions_institution`
--

LOCK TABLES `institutions_institution` WRITE;
/*!40000 ALTER TABLE `institutions_institution` DISABLE KEYS */;
/*!40000 ALTER TABLE `institutions_institution` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `institutions_institutionadmin`
--

DROP TABLE IF EXISTS `institutions_institutionadmin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `institutions_institutionadmin` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user` varchar(255) NOT NULL,
  `institution_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `institutions_institu_institution_id_1e9bb58b_fk_instituti` (`institution_id`),
  KEY `institutions_institutionadmin_user_c71d766d` (`user`),
  CONSTRAINT `institutions_institu_institution_id_1e9bb58b_fk_instituti` FOREIGN KEY (`institution_id`) REFERENCES `institutions_institution` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `institutions_institutionadmin`
--

LOCK TABLES `institutions_institutionadmin` WRITE;
/*!40000 ALTER TABLE `institutions_institutionadmin` DISABLE KEYS */;
/*!40000 ALTER TABLE `institutions_institutionadmin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `institutions_institutionquota`
--

DROP TABLE IF EXISTS `institutions_institutionquota`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `institutions_institutionquota` (
  `id` int NOT NULL AUTO_INCREMENT,
  `quota` bigint NOT NULL,
  `institution_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `institutions_institu_institution_id_d23201d9_fk_instituti` (`institution_id`),
  CONSTRAINT `institutions_institu_institution_id_d23201d9_fk_instituti` FOREIGN KEY (`institution_id`) REFERENCES `institutions_institution` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `institutions_institutionquota`
--

LOCK TABLES `institutions_institutionquota` WRITE;
/*!40000 ALTER TABLE `institutions_institutionquota` DISABLE KEYS */;
/*!40000 ALTER TABLE `institutions_institutionquota` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invitations_invitation`
--

DROP TABLE IF EXISTS `invitations_invitation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `invitations_invitation` (
  `id` int NOT NULL AUTO_INCREMENT,
  `token` varchar(40) NOT NULL,
  `inviter` varchar(255) NOT NULL,
  `accepter` varchar(255) NOT NULL,
  `invite_time` datetime(6) NOT NULL,
  `accept_time` datetime(6) DEFAULT NULL,
  `invite_type` varchar(20) NOT NULL,
  `expire_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `invitations_invitation_inviter_b0a7b855` (`inviter`),
  KEY `invitations_invitation_token_25a92a38` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invitations_invitation`
--

LOCK TABLES `invitations_invitation` WRITE;
/*!40000 ALTER TABLE `invitations_invitation` DISABLE KEYS */;
/*!40000 ALTER TABLE `invitations_invitation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notifications_notification`
--

DROP TABLE IF EXISTS `notifications_notification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notifications_notification` (
  `id` int NOT NULL AUTO_INCREMENT,
  `message` varchar(512) NOT NULL,
  `primary` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `notifications_notification_primary_4f95ec21` (`primary`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notifications_notification`
--

LOCK TABLES `notifications_notification` WRITE;
/*!40000 ALTER TABLE `notifications_notification` DISABLE KEYS */;
/*!40000 ALTER TABLE `notifications_notification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notifications_usernotification`
--

DROP TABLE IF EXISTS `notifications_usernotification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notifications_usernotification` (
  `id` int NOT NULL AUTO_INCREMENT,
  `to_user` varchar(255) NOT NULL,
  `msg_type` varchar(30) NOT NULL,
  `detail` longtext NOT NULL,
  `timestamp` datetime(6) NOT NULL,
  `seen` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `notifications_usernotification_to_user_6cadafa1` (`to_user`),
  KEY `notifications_usernotification_msg_type_985afd02` (`msg_type`),
  KEY `notifications_usernotification_timestamp_125067e8` (`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notifications_usernotification`
--

LOCK TABLES `notifications_usernotification` WRITE;
/*!40000 ALTER TABLE `notifications_usernotification` DISABLE KEYS */;
/*!40000 ALTER TABLE `notifications_usernotification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ocm_share`
--

DROP TABLE IF EXISTS `ocm_share`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ocm_share` (
  `id` int NOT NULL AUTO_INCREMENT,
  `shared_secret` varchar(36) NOT NULL,
  `from_user` varchar(255) NOT NULL,
  `to_user` varchar(255) NOT NULL,
  `to_server_url` varchar(200) NOT NULL,
  `repo_id` varchar(36) NOT NULL,
  `repo_name` varchar(255) NOT NULL,
  `permission` varchar(50) NOT NULL,
  `path` longtext NOT NULL,
  `ctime` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `shared_secret` (`shared_secret`),
  KEY `ocm_share_from_user_7fbb7bb6` (`from_user`),
  KEY `ocm_share_to_user_4e255523` (`to_user`),
  KEY `ocm_share_to_server_url_43f0e89b` (`to_server_url`),
  KEY `ocm_share_repo_id_51937581` (`repo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ocm_share`
--

LOCK TABLES `ocm_share` WRITE;
/*!40000 ALTER TABLE `ocm_share` DISABLE KEYS */;
/*!40000 ALTER TABLE `ocm_share` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ocm_share_received`
--

DROP TABLE IF EXISTS `ocm_share_received`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ocm_share_received` (
  `id` int NOT NULL AUTO_INCREMENT,
  `shared_secret` varchar(36) NOT NULL,
  `from_user` varchar(255) NOT NULL,
  `to_user` varchar(255) NOT NULL,
  `from_server_url` varchar(200) NOT NULL,
  `repo_id` varchar(36) NOT NULL,
  `repo_name` varchar(255) NOT NULL,
  `permission` varchar(50) NOT NULL,
  `path` longtext NOT NULL,
  `provider_id` varchar(40) NOT NULL,
  `ctime` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `shared_secret` (`shared_secret`),
  KEY `ocm_share_received_from_user_8137d8eb` (`from_user`),
  KEY `ocm_share_received_to_user_0921d09a` (`to_user`),
  KEY `ocm_share_received_from_server_url_10527b80` (`from_server_url`),
  KEY `ocm_share_received_repo_id_9e77a1b9` (`repo_id`),
  KEY `ocm_share_received_provider_id_60c873e0` (`provider_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ocm_share_received`
--

LOCK TABLES `ocm_share_received` WRITE;
/*!40000 ALTER TABLE `ocm_share_received` DISABLE KEYS */;
/*!40000 ALTER TABLE `ocm_share_received` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ocm_via_webdav_received_shares`
--

DROP TABLE IF EXISTS `ocm_via_webdav_received_shares`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ocm_via_webdav_received_shares` (
  `id` int NOT NULL AUTO_INCREMENT,
  `description` varchar(255) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `owner_display_name` varchar(255) DEFAULT NULL,
  `protocol_name` varchar(255) NOT NULL,
  `shared_secret` varchar(255) NOT NULL,
  `permissions` varchar(255) NOT NULL,
  `provider_id` varchar(255) NOT NULL,
  `resource_type` varchar(255) NOT NULL,
  `share_type` varchar(255) NOT NULL,
  `share_with` varchar(255) NOT NULL,
  `shared_by` varchar(255) NOT NULL,
  `shared_by_display_name` varchar(255) DEFAULT NULL,
  `ctime` datetime(6) NOT NULL,
  `is_dir` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ocm_via_webdav_share_received_owner_261eaa70` (`owner`),
  KEY `ocm_via_webdav_share_received_shared_secret_fbb6be5a` (`shared_secret`),
  KEY `ocm_via_webdav_share_received_provider_id_a55680e9` (`provider_id`),
  KEY `ocm_via_webdav_share_received_resource_type_a3c71b57` (`resource_type`),
  KEY `ocm_via_webdav_share_received_share_type_7615aaab` (`share_type`),
  KEY `ocm_via_webdav_share_received_share_with_5a23eb17` (`share_with`),
  KEY `ocm_via_webdav_share_received_shared_by_1786d580` (`shared_by`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ocm_via_webdav_received_shares`
--

LOCK TABLES `ocm_via_webdav_received_shares` WRITE;
/*!40000 ALTER TABLE `ocm_via_webdav_received_shares` DISABLE KEYS */;
/*!40000 ALTER TABLE `ocm_via_webdav_received_shares` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `onlyoffice_onlyofficedockey`
--

DROP TABLE IF EXISTS `onlyoffice_onlyofficedockey`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `onlyoffice_onlyofficedockey` (
  `id` int NOT NULL AUTO_INCREMENT,
  `doc_key` varchar(36) NOT NULL,
  `username` varchar(255) NOT NULL,
  `repo_id` varchar(36) NOT NULL,
  `file_path` longtext NOT NULL,
  `repo_id_file_path_md5` varchar(100) NOT NULL,
  `created_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `repo_id_file_path_md5` (`repo_id_file_path_md5`),
  KEY `onlyoffice_onlyofficedockey_doc_key_edba1352` (`doc_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `onlyoffice_onlyofficedockey`
--

LOCK TABLES `onlyoffice_onlyofficedockey` WRITE;
/*!40000 ALTER TABLE `onlyoffice_onlyofficedockey` DISABLE KEYS */;
/*!40000 ALTER TABLE `onlyoffice_onlyofficedockey` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `options_useroptions`
--

DROP TABLE IF EXISTS `options_useroptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `options_useroptions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `option_key` varchar(50) NOT NULL,
  `option_val` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `options_useroptions_email_77d5726a` (`email`),
  KEY `options_useroptions_option_key_7bf7ae4b` (`option_key`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `options_useroptions`
--

LOCK TABLES `options_useroptions` WRITE;
/*!40000 ALTER TABLE `options_useroptions` DISABLE KEYS */;
INSERT INTO `options_useroptions` VALUES (1,'8373ee7d41a448088c8da8bb9976dc4c@auth.local','user_guide','0'),(2,'8373ee7d41a448088c8da8bb9976dc4c@auth.local','default_repo','22d69746-c8e9-40be-9598-90215e6adbdb');
/*!40000 ALTER TABLE `options_useroptions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `org_saml_config`
--

DROP TABLE IF EXISTS `org_saml_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `org_saml_config` (
  `id` int NOT NULL AUTO_INCREMENT,
  `org_id` int NOT NULL,
  `metadata_url` longtext NOT NULL,
  `domain` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `org_id` (`org_id`),
  UNIQUE KEY `domain` (`domain`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `org_saml_config`
--

LOCK TABLES `org_saml_config` WRITE;
/*!40000 ALTER TABLE `org_saml_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `org_saml_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `organizations_orgadminsettings`
--

DROP TABLE IF EXISTS `organizations_orgadminsettings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `organizations_orgadminsettings` (
  `id` int NOT NULL AUTO_INCREMENT,
  `org_id` int NOT NULL,
  `key` varchar(255) NOT NULL,
  `value` longtext NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `organizations_orgadminsettings_org_id_key_a01cc7de_uniq` (`org_id`,`key`),
  KEY `organizations_orgadminsettings_org_id_4f70d186` (`org_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `organizations_orgadminsettings`
--

LOCK TABLES `organizations_orgadminsettings` WRITE;
/*!40000 ALTER TABLE `organizations_orgadminsettings` DISABLE KEYS */;
/*!40000 ALTER TABLE `organizations_orgadminsettings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `organizations_orgmemberquota`
--

DROP TABLE IF EXISTS `organizations_orgmemberquota`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `organizations_orgmemberquota` (
  `id` int NOT NULL AUTO_INCREMENT,
  `org_id` int NOT NULL,
  `quota` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `organizations_orgmemberquota_org_id_93dde51d` (`org_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `organizations_orgmemberquota`
--

LOCK TABLES `organizations_orgmemberquota` WRITE;
/*!40000 ALTER TABLE `organizations_orgmemberquota` DISABLE KEYS */;
/*!40000 ALTER TABLE `organizations_orgmemberquota` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `organizations_orgsettings`
--

DROP TABLE IF EXISTS `organizations_orgsettings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `organizations_orgsettings` (
  `id` int NOT NULL AUTO_INCREMENT,
  `org_id` int NOT NULL,
  `role` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `organizations_orgsettings_org_id_630f6843_uniq` (`org_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `organizations_orgsettings`
--

LOCK TABLES `organizations_orgsettings` WRITE;
/*!40000 ALTER TABLE `organizations_orgsettings` DISABLE KEYS */;
/*!40000 ALTER TABLE `organizations_orgsettings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profile_detailedprofile`
--

DROP TABLE IF EXISTS `profile_detailedprofile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `profile_detailedprofile` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user` varchar(255) NOT NULL,
  `department` varchar(512) NOT NULL,
  `telephone` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `profile_detailedprofile_user_612c11ba` (`user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profile_detailedprofile`
--

LOCK TABLES `profile_detailedprofile` WRITE;
/*!40000 ALTER TABLE `profile_detailedprofile` DISABLE KEYS */;
/*!40000 ALTER TABLE `profile_detailedprofile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profile_profile`
--

DROP TABLE IF EXISTS `profile_profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `profile_profile` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user` varchar(254) NOT NULL,
  `nickname` varchar(64) NOT NULL,
  `intro` longtext NOT NULL,
  `lang_code` longtext,
  `login_id` varchar(225) DEFAULT NULL,
  `contact_email` varchar(225) DEFAULT NULL,
  `institution` varchar(225) DEFAULT NULL,
  `list_in_address_book` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user` (`user`),
  UNIQUE KEY `login_id` (`login_id`),
  UNIQUE KEY `profile_profile_contact_email_0975e4bf_uniq` (`contact_email`),
  KEY `profile_profile_institution_c0286bd1` (`institution`),
  KEY `profile_profile_list_in_address_book_b1009a78` (`list_in_address_book`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profile_profile`
--

LOCK TABLES `profile_profile` WRITE;
/*!40000 ALTER TABLE `profile_profile` DISABLE KEYS */;
INSERT INTO `profile_profile` VALUES (1,'8373ee7d41a448088c8da8bb9976dc4c@auth.local','','',NULL,NULL,'admin@bytetrade.io','',0);
/*!40000 ALTER TABLE `profile_profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registration_registrationprofile`
--

DROP TABLE IF EXISTS `registration_registrationprofile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `registration_registrationprofile` (
  `id` int NOT NULL AUTO_INCREMENT,
  `emailuser_id` int NOT NULL,
  `activation_key` varchar(40) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registration_registrationprofile`
--

LOCK TABLES `registration_registrationprofile` WRITE;
/*!40000 ALTER TABLE `registration_registrationprofile` DISABLE KEYS */;
/*!40000 ALTER TABLE `registration_registrationprofile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `related_files_relatedfiles`
--

DROP TABLE IF EXISTS `related_files_relatedfiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `related_files_relatedfiles` (
  `id` int NOT NULL AUTO_INCREMENT,
  `o_uuid_id` char(32) NOT NULL,
  `r_uuid_id` char(32) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `related_files_relate_o_uuid_id_aaa8e613_fk_tags_file` (`o_uuid_id`),
  KEY `related_files_relate_r_uuid_id_031751df_fk_tags_file` (`r_uuid_id`),
  CONSTRAINT `related_files_relate_o_uuid_id_aaa8e613_fk_tags_file` FOREIGN KEY (`o_uuid_id`) REFERENCES `tags_fileuuidmap` (`uuid`),
  CONSTRAINT `related_files_relate_r_uuid_id_031751df_fk_tags_file` FOREIGN KEY (`r_uuid_id`) REFERENCES `tags_fileuuidmap` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `related_files_relatedfiles`
--

LOCK TABLES `related_files_relatedfiles` WRITE;
/*!40000 ALTER TABLE `related_files_relatedfiles` DISABLE KEYS */;
/*!40000 ALTER TABLE `related_files_relatedfiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `repo_api_tokens`
--

DROP TABLE IF EXISTS `repo_api_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `repo_api_tokens` (
  `id` int NOT NULL AUTO_INCREMENT,
  `repo_id` varchar(36) NOT NULL,
  `app_name` varchar(255) NOT NULL,
  `token` varchar(40) NOT NULL,
  `generated_at` datetime(6) NOT NULL,
  `generated_by` varchar(255) NOT NULL,
  `last_access` datetime(6) NOT NULL,
  `permission` varchar(15) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `token` (`token`),
  KEY `repo_api_tokens_repo_id_47a50fef` (`repo_id`),
  KEY `repo_api_tokens_app_name_7c395c31` (`app_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `repo_api_tokens`
--

LOCK TABLES `repo_api_tokens` WRITE;
/*!40000 ALTER TABLE `repo_api_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `repo_api_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `repo_auto_delete`
--

DROP TABLE IF EXISTS `repo_auto_delete`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `repo_auto_delete` (
  `id` int NOT NULL AUTO_INCREMENT,
  `repo_id` varchar(36) NOT NULL,
  `days` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `repo_id` (`repo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `repo_auto_delete`
--

LOCK TABLES `repo_auto_delete` WRITE;
/*!40000 ALTER TABLE `repo_auto_delete` DISABLE KEYS */;
/*!40000 ALTER TABLE `repo_auto_delete` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `repo_share_invitation`
--

DROP TABLE IF EXISTS `repo_share_invitation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `repo_share_invitation` (
  `id` int NOT NULL AUTO_INCREMENT,
  `repo_id` varchar(36) NOT NULL,
  `path` longtext NOT NULL,
  `permission` varchar(50) NOT NULL,
  `invitation_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `repo_share_invitatio_invitation_id_b71effd2_fk_invitatio` (`invitation_id`),
  KEY `repo_share_invitation_repo_id_7bcf84fa` (`repo_id`),
  CONSTRAINT `repo_share_invitatio_invitation_id_b71effd2_fk_invitatio` FOREIGN KEY (`invitation_id`) REFERENCES `invitations_invitation` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `repo_share_invitation`
--

LOCK TABLES `repo_share_invitation` WRITE;
/*!40000 ALTER TABLE `repo_share_invitation` DISABLE KEYS */;
/*!40000 ALTER TABLE `repo_share_invitation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `repo_tags_repotags`
--

DROP TABLE IF EXISTS `repo_tags_repotags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `repo_tags_repotags` (
  `id` int NOT NULL AUTO_INCREMENT,
  `repo_id` varchar(36) NOT NULL,
  `name` varchar(255) NOT NULL,
  `color` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `repo_tags_repotags_repo_id_1163a48f` (`repo_id`),
  KEY `repo_tags_repotags_name_3f4c9027` (`name`),
  KEY `repo_tags_repotags_color_1292b6c1` (`color`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `repo_tags_repotags`
--

LOCK TABLES `repo_tags_repotags` WRITE;
/*!40000 ALTER TABLE `repo_tags_repotags` DISABLE KEYS */;
/*!40000 ALTER TABLE `repo_tags_repotags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `revision_tag_revisiontags`
--

DROP TABLE IF EXISTS `revision_tag_revisiontags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `revision_tag_revisiontags` (
  `id` int NOT NULL AUTO_INCREMENT,
  `repo_id` varchar(36) NOT NULL,
  `path` longtext NOT NULL,
  `revision_id` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `tag_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `revision_tag_revisio_tag_id_ee4e9b00_fk_revision_` (`tag_id`),
  KEY `revision_tag_revisiontags_repo_id_212c0c69` (`repo_id`),
  KEY `revision_tag_revisiontags_revision_id_fd9fe0f9` (`revision_id`),
  KEY `revision_tag_revisiontags_username_3007d29e` (`username`),
  CONSTRAINT `revision_tag_revisio_tag_id_ee4e9b00_fk_revision_` FOREIGN KEY (`tag_id`) REFERENCES `revision_tag_tags` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `revision_tag_revisiontags`
--

LOCK TABLES `revision_tag_revisiontags` WRITE;
/*!40000 ALTER TABLE `revision_tag_revisiontags` DISABLE KEYS */;
/*!40000 ALTER TABLE `revision_tag_revisiontags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `revision_tag_tags`
--

DROP TABLE IF EXISTS `revision_tag_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `revision_tag_tags` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `revision_tag_tags`
--

LOCK TABLES `revision_tag_tags` WRITE;
/*!40000 ALTER TABLE `revision_tag_tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `revision_tag_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_permissions_adminrole`
--

DROP TABLE IF EXISTS `role_permissions_adminrole`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role_permissions_adminrole` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(254) NOT NULL,
  `role` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_permissions_adminrole`
--

LOCK TABLES `role_permissions_adminrole` WRITE;
/*!40000 ALTER TABLE `role_permissions_adminrole` DISABLE KEYS */;
/*!40000 ALTER TABLE `role_permissions_adminrole` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `share_anonymousshare`
--

DROP TABLE IF EXISTS `share_anonymousshare`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `share_anonymousshare` (
  `id` int NOT NULL AUTO_INCREMENT,
  `repo_owner` varchar(255) NOT NULL,
  `repo_id` varchar(36) NOT NULL,
  `anonymous_email` varchar(255) NOT NULL,
  `token` varchar(25) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `token` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `share_anonymousshare`
--

LOCK TABLES `share_anonymousshare` WRITE;
/*!40000 ALTER TABLE `share_anonymousshare` DISABLE KEYS */;
/*!40000 ALTER TABLE `share_anonymousshare` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `share_extragroupssharepermission`
--

DROP TABLE IF EXISTS `share_extragroupssharepermission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `share_extragroupssharepermission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `repo_id` varchar(36) NOT NULL,
  `group_id` int NOT NULL,
  `permission` varchar(30) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `share_extragroupssharepermission_repo_id_38dbaea1` (`repo_id`),
  KEY `share_extragroupssharepermission_group_id_6ca34bb2` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `share_extragroupssharepermission`
--

LOCK TABLES `share_extragroupssharepermission` WRITE;
/*!40000 ALTER TABLE `share_extragroupssharepermission` DISABLE KEYS */;
/*!40000 ALTER TABLE `share_extragroupssharepermission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `share_extrasharepermission`
--

DROP TABLE IF EXISTS `share_extrasharepermission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `share_extrasharepermission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `repo_id` varchar(36) NOT NULL,
  `share_to` varchar(255) NOT NULL,
  `permission` varchar(30) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `share_extrasharepermission_repo_id_23cc10fc` (`repo_id`),
  KEY `share_extrasharepermission_share_to_823c16cb` (`share_to`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `share_extrasharepermission`
--

LOCK TABLES `share_extrasharepermission` WRITE;
/*!40000 ALTER TABLE `share_extrasharepermission` DISABLE KEYS */;
/*!40000 ALTER TABLE `share_extrasharepermission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `share_fileshare`
--

DROP TABLE IF EXISTS `share_fileshare`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `share_fileshare` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `repo_id` varchar(36) NOT NULL,
  `path` longtext NOT NULL,
  `token` varchar(100) NOT NULL,
  `ctime` datetime(6) NOT NULL,
  `view_cnt` int NOT NULL,
  `s_type` varchar(2) NOT NULL,
  `password` varchar(128) DEFAULT NULL,
  `expire_date` datetime(6) DEFAULT NULL,
  `permission` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `token` (`token`),
  KEY `share_fileshare_username_5cb6de75` (`username`),
  KEY `share_fileshare_repo_id_9b5ae27a` (`repo_id`),
  KEY `share_fileshare_s_type_724eb6c1` (`s_type`),
  KEY `share_fileshare_permission_d12c353f` (`permission`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `share_fileshare`
--

LOCK TABLES `share_fileshare` WRITE;
/*!40000 ALTER TABLE `share_fileshare` DISABLE KEYS */;
/*!40000 ALTER TABLE `share_fileshare` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `share_orgfileshare`
--

DROP TABLE IF EXISTS `share_orgfileshare`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `share_orgfileshare` (
  `id` int NOT NULL AUTO_INCREMENT,
  `org_id` int NOT NULL,
  `file_share_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `file_share_id` (`file_share_id`),
  KEY `share_orgfileshare_org_id_8d17998c` (`org_id`),
  CONSTRAINT `share_orgfileshare_file_share_id_7890388b_fk_share_fileshare_id` FOREIGN KEY (`file_share_id`) REFERENCES `share_fileshare` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `share_orgfileshare`
--

LOCK TABLES `share_orgfileshare` WRITE;
/*!40000 ALTER TABLE `share_orgfileshare` DISABLE KEYS */;
/*!40000 ALTER TABLE `share_orgfileshare` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `share_privatefiledirshare`
--

DROP TABLE IF EXISTS `share_privatefiledirshare`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `share_privatefiledirshare` (
  `id` int NOT NULL AUTO_INCREMENT,
  `from_user` varchar(255) NOT NULL,
  `to_user` varchar(255) NOT NULL,
  `repo_id` varchar(36) NOT NULL,
  `path` longtext NOT NULL,
  `token` varchar(10) NOT NULL,
  `permission` varchar(5) NOT NULL,
  `s_type` varchar(5) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `token` (`token`),
  KEY `share_privatefiledirshare_from_user_d568d535` (`from_user`),
  KEY `share_privatefiledirshare_to_user_2a92a044` (`to_user`),
  KEY `share_privatefiledirshare_repo_id_97c5cb6f` (`repo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `share_privatefiledirshare`
--

LOCK TABLES `share_privatefiledirshare` WRITE;
/*!40000 ALTER TABLE `share_privatefiledirshare` DISABLE KEYS */;
/*!40000 ALTER TABLE `share_privatefiledirshare` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `share_uploadlinkshare`
--

DROP TABLE IF EXISTS `share_uploadlinkshare`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `share_uploadlinkshare` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `repo_id` varchar(36) NOT NULL,
  `path` longtext NOT NULL,
  `token` varchar(100) NOT NULL,
  `ctime` datetime(6) NOT NULL,
  `view_cnt` int NOT NULL,
  `password` varchar(128) DEFAULT NULL,
  `expire_date` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `token` (`token`),
  KEY `share_uploadlinkshare_username_3203c243` (`username`),
  KEY `share_uploadlinkshare_repo_id_c519f857` (`repo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `share_uploadlinkshare`
--

LOCK TABLES `share_uploadlinkshare` WRITE;
/*!40000 ALTER TABLE `share_uploadlinkshare` DISABLE KEYS */;
/*!40000 ALTER TABLE `share_uploadlinkshare` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `social_auth_usersocialauth`
--

DROP TABLE IF EXISTS `social_auth_usersocialauth`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `social_auth_usersocialauth` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `provider` varchar(32) NOT NULL,
  `uid` varchar(255) NOT NULL,
  `extra_data` longtext NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `social_auth_usersocialauth_provider_uid_e6b5e668_uniq` (`provider`,`uid`),
  KEY `social_auth_usersocialauth_username_3f06b5cf` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `social_auth_usersocialauth`
--

LOCK TABLES `social_auth_usersocialauth` WRITE;
/*!40000 ALTER TABLE `social_auth_usersocialauth` DISABLE KEYS */;
/*!40000 ALTER TABLE `social_auth_usersocialauth` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sysadmin_extra_userloginlog`
--

DROP TABLE IF EXISTS `sysadmin_extra_userloginlog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sysadmin_extra_userloginlog` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `login_date` datetime(6) NOT NULL,
  `login_ip` varchar(128) NOT NULL,
  `login_success` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sysadmin_extra_userloginlog_username_5748b9e3` (`username`),
  KEY `sysadmin_extra_userloginlog_login_date_c171d790` (`login_date`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sysadmin_extra_userloginlog`
--

LOCK TABLES `sysadmin_extra_userloginlog` WRITE;
/*!40000 ALTER TABLE `sysadmin_extra_userloginlog` DISABLE KEYS */;
INSERT INTO `sysadmin_extra_userloginlog` VALUES (1,'admin@bytetrade.io','2023-07-26 06:51:09.183206','127.0.0.1',0),(2,'8373ee7d41a448088c8da8bb9976dc4c@auth.local','2023-07-26 06:51:14.661009','127.0.0.1',1);
/*!40000 ALTER TABLE `sysadmin_extra_userloginlog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags_filetag`
--

DROP TABLE IF EXISTS `tags_filetag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tags_filetag` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `tag_id` int NOT NULL,
  `uuid_id` char(32) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `tags_filetag_tag_id_0f264fc9_fk_tags_tags_id` (`tag_id`),
  KEY `tags_filetag_uuid_id_2aa2266c_fk_tags_fileuuidmap_uuid` (`uuid_id`),
  CONSTRAINT `tags_filetag_tag_id_0f264fc9_fk_tags_tags_id` FOREIGN KEY (`tag_id`) REFERENCES `tags_tags` (`id`),
  CONSTRAINT `tags_filetag_uuid_id_2aa2266c_fk_tags_fileuuidmap_uuid` FOREIGN KEY (`uuid_id`) REFERENCES `tags_fileuuidmap` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags_filetag`
--

LOCK TABLES `tags_filetag` WRITE;
/*!40000 ALTER TABLE `tags_filetag` DISABLE KEYS */;
/*!40000 ALTER TABLE `tags_filetag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags_fileuuidmap`
--

DROP TABLE IF EXISTS `tags_fileuuidmap`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tags_fileuuidmap` (
  `uuid` char(32) NOT NULL,
  `repo_id` varchar(36) NOT NULL,
  `repo_id_parent_path_md5` varchar(100) NOT NULL,
  `parent_path` longtext NOT NULL,
  `filename` varchar(1024) NOT NULL,
  `is_dir` tinyint(1) NOT NULL,
  PRIMARY KEY (`uuid`),
  KEY `tags_fileuuidmap_repo_id_ac67aa33` (`repo_id`),
  KEY `tags_fileuuidmap_repo_id_parent_path_md5_c8bb0860` (`repo_id_parent_path_md5`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags_fileuuidmap`
--

LOCK TABLES `tags_fileuuidmap` WRITE;
/*!40000 ALTER TABLE `tags_fileuuidmap` DISABLE KEYS */;
/*!40000 ALTER TABLE `tags_fileuuidmap` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags_tags`
--

DROP TABLE IF EXISTS `tags_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tags_tags` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags_tags`
--

LOCK TABLES `tags_tags` WRITE;
/*!40000 ALTER TABLE `tags_tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `tags_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `termsandconditions_termsandconditions`
--

DROP TABLE IF EXISTS `termsandconditions_termsandconditions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `termsandconditions_termsandconditions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `slug` varchar(50) NOT NULL,
  `name` longtext NOT NULL,
  `version_number` decimal(6,2) NOT NULL,
  `text` longtext,
  `info` longtext,
  `date_active` datetime(6) DEFAULT NULL,
  `date_created` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `termsandconditions_termsandconditions_slug_489d1e9d` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `termsandconditions_termsandconditions`
--

LOCK TABLES `termsandconditions_termsandconditions` WRITE;
/*!40000 ALTER TABLE `termsandconditions_termsandconditions` DISABLE KEYS */;
/*!40000 ALTER TABLE `termsandconditions_termsandconditions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `termsandconditions_usertermsandconditions`
--

DROP TABLE IF EXISTS `termsandconditions_usertermsandconditions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `termsandconditions_usertermsandconditions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `ip_address` char(39) DEFAULT NULL,
  `date_accepted` datetime(6) NOT NULL,
  `terms_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `termsandconditions_usert_username_terms_id_a7dabb70_uniq` (`username`,`terms_id`),
  KEY `termsandconditions_u_terms_id_eacdbcc7_fk_termsandc` (`terms_id`),
  CONSTRAINT `termsandconditions_u_terms_id_eacdbcc7_fk_termsandc` FOREIGN KEY (`terms_id`) REFERENCES `termsandconditions_termsandconditions` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `termsandconditions_usertermsandconditions`
--

LOCK TABLES `termsandconditions_usertermsandconditions` WRITE;
/*!40000 ALTER TABLE `termsandconditions_usertermsandconditions` DISABLE KEYS */;
/*!40000 ALTER TABLE `termsandconditions_usertermsandconditions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trusted_ip_trustedip`
--

DROP TABLE IF EXISTS `trusted_ip_trustedip`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trusted_ip_trustedip` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ip` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `trusted_ip_trustedip_ip_e898970c` (`ip`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trusted_ip_trustedip`
--

LOCK TABLES `trusted_ip_trustedip` WRITE;
/*!40000 ALTER TABLE `trusted_ip_trustedip` DISABLE KEYS */;
/*!40000 ALTER TABLE `trusted_ip_trustedip` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `two_factor_phonedevice`
--

DROP TABLE IF EXISTS `two_factor_phonedevice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `two_factor_phonedevice` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user` varchar(255) NOT NULL,
  `name` varchar(64) NOT NULL,
  `confirmed` tinyint(1) NOT NULL,
  `number` varchar(40) NOT NULL,
  `key` varchar(40) NOT NULL,
  `method` varchar(4) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user` (`user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `two_factor_phonedevice`
--

LOCK TABLES `two_factor_phonedevice` WRITE;
/*!40000 ALTER TABLE `two_factor_phonedevice` DISABLE KEYS */;
/*!40000 ALTER TABLE `two_factor_phonedevice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `two_factor_staticdevice`
--

DROP TABLE IF EXISTS `two_factor_staticdevice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `two_factor_staticdevice` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user` varchar(255) NOT NULL,
  `name` varchar(64) NOT NULL,
  `confirmed` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user` (`user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `two_factor_staticdevice`
--

LOCK TABLES `two_factor_staticdevice` WRITE;
/*!40000 ALTER TABLE `two_factor_staticdevice` DISABLE KEYS */;
/*!40000 ALTER TABLE `two_factor_staticdevice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `two_factor_statictoken`
--

DROP TABLE IF EXISTS `two_factor_statictoken`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `two_factor_statictoken` (
  `id` int NOT NULL AUTO_INCREMENT,
  `token` varchar(16) NOT NULL,
  `device_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `two_factor_statictok_device_id_93095b45_fk_two_facto` (`device_id`),
  KEY `two_factor_statictoken_token_2ade1084` (`token`),
  CONSTRAINT `two_factor_statictok_device_id_93095b45_fk_two_facto` FOREIGN KEY (`device_id`) REFERENCES `two_factor_staticdevice` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `two_factor_statictoken`
--

LOCK TABLES `two_factor_statictoken` WRITE;
/*!40000 ALTER TABLE `two_factor_statictoken` DISABLE KEYS */;
/*!40000 ALTER TABLE `two_factor_statictoken` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `two_factor_totpdevice`
--

DROP TABLE IF EXISTS `two_factor_totpdevice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `two_factor_totpdevice` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user` varchar(255) NOT NULL,
  `name` varchar(64) NOT NULL,
  `confirmed` tinyint(1) NOT NULL,
  `key` varchar(80) NOT NULL,
  `step` smallint unsigned NOT NULL,
  `t0` bigint NOT NULL,
  `digits` smallint unsigned NOT NULL,
  `tolerance` smallint unsigned NOT NULL,
  `drift` smallint NOT NULL,
  `last_t` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user` (`user`),
  CONSTRAINT `two_factor_totpdevice_chk_1` CHECK ((`step` >= 0)),
  CONSTRAINT `two_factor_totpdevice_chk_2` CHECK ((`digits` >= 0)),
  CONSTRAINT `two_factor_totpdevice_chk_3` CHECK ((`tolerance` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `two_factor_totpdevice`
--

LOCK TABLES `two_factor_totpdevice` WRITE;
/*!40000 ALTER TABLE `two_factor_totpdevice` DISABLE KEYS */;
/*!40000 ALTER TABLE `two_factor_totpdevice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wiki_wiki`
--

DROP TABLE IF EXISTS `wiki_wiki`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wiki_wiki` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `repo_id` varchar(36) NOT NULL,
  `permission` varchar(50) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`),
  UNIQUE KEY `wiki_wiki_username_repo_id_4c8925af_uniq` (`username`,`repo_id`),
  KEY `wiki_wiki_created_at_54930e39` (`created_at`),
  KEY `wiki_wiki_repo_id_2ee93c37` (`repo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wiki_wiki`
--

LOCK TABLES `wiki_wiki` WRITE;
/*!40000 ALTER TABLE `wiki_wiki` DISABLE KEYS */;
/*!40000 ALTER TABLE `wiki_wiki` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-07-26 14:54:44

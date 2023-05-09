-- MariaDB dump 10.19  Distrib 10.4.24-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: pc
-- ------------------------------------------------------
-- Server version	10.4.24-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `pc`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `pc` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `pc`;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clients`
--

DROP TABLE IF EXISTS `clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clients` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `company_name` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tin_number` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Phone_number` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clients`
--

LOCK TABLES `clients` WRITE;
/*!40000 ALTER TABLE `clients` DISABLE KEYS */;
INSERT INTO `clients` VALUES (1,'gakenke district','rtytry','1234567890','1234567890','123456789','gakenke@mail.com','2022-12-31 13:10:33','2022-12-31 13:10:33',NULL);
/*!40000 ALTER TABLE `clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `devices`
--

DROP TABLE IF EXISTS `devices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `devices` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `serial_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner_id` bigint(20) unsigned NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `devices_owner_id_foreign` (`owner_id`),
  CONSTRAINT `devices_owner_id_foreign` FOREIGN KEY (`owner_id`) REFERENCES `owners` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `devices`
--

LOCK TABLES `devices` WRITE;
/*!40000 ALTER TABLE `devices` DISABLE KEYS */;
INSERT INTO `devices` VALUES (1,'printer','qwertyjujk',1,'pending','2022-12-31 13:08:57','2022-12-31 13:08:57');
/*!40000 ALTER TABLE `devices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `diagnoses`
--

DROP TABLE IF EXISTS `diagnoses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `diagnoses` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `notes` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `device_id` bigint(20) unsigned NOT NULL,
  `owner_id` bigint(20) unsigned NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `diagnoses_device_id_foreign` (`device_id`),
  KEY `diagnoses_owner_id_foreign` (`owner_id`),
  KEY `diagnoses_user_id_foreign` (`user_id`),
  CONSTRAINT `diagnoses_device_id_foreign` FOREIGN KEY (`device_id`) REFERENCES `devices` (`id`) ON DELETE CASCADE,
  CONSTRAINT `diagnoses_owner_id_foreign` FOREIGN KEY (`owner_id`) REFERENCES `owners` (`id`) ON DELETE CASCADE,
  CONSTRAINT `diagnoses_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `diagnoses`
--

LOCK TABLES `diagnoses` WRITE;
/*!40000 ALTER TABLE `diagnoses` DISABLE KEYS */;
/*!40000 ALTER TABLE `diagnoses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_resets_table',1),(3,'2014_10_12_200000_add_two_factor_columns_to_users_table',1),(4,'2019_08_19_000000_create_failed_jobs_table',1),(5,'2019_12_14_000001_create_personal_access_tokens_table',1),(6,'2020_05_21_100000_create_teams_table',1),(7,'2020_05_21_200000_create_team_user_table',1),(8,'2020_05_21_300000_create_team_invitations_table',1),(9,'2022_11_21_070654_create_sessions_table',1),(10,'2022_11_21_071513_create_permission_tables',1),(11,'2022_11_21_151946_add_is_admin_to_users_table',1),(12,'2022_11_29_162557_add_soft_deletes_to_users_table',1),(13,'2022_11_30_141739_create_tinnumbers_table',1),(14,'2022_11_30_154610_create_clients_table',1),(15,'2022_11_30_155533_add_soft_deletes_to_clients_table',1),(16,'2022_12_20_092215_create_owners_table',1),(17,'2022_12_20_092234_create_devices_table',1),(18,'2022_12_20_092309_create_diagnoses_table',1),(19,'2022_12_23_145444_create_categories_table',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `model_has_permissions`
--

DROP TABLE IF EXISTS `model_has_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) unsigned NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `model_has_permissions`
--

LOCK TABLES `model_has_permissions` WRITE;
/*!40000 ALTER TABLE `model_has_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `model_has_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `model_has_roles`
--

DROP TABLE IF EXISTS `model_has_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) unsigned NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `model_has_roles`
--

LOCK TABLES `model_has_roles` WRITE;
/*!40000 ALTER TABLE `model_has_roles` DISABLE KEYS */;
INSERT INTO `model_has_roles` VALUES (1,'App\\Models\\User',5),(1,'App\\Models\\User',6),(1,'App\\Models\\User',7),(1,'App\\Models\\User',8),(1,'App\\Models\\User',9),(1,'App\\Models\\User',10),(1,'App\\Models\\User',11),(1,'App\\Models\\User',12),(1,'App\\Models\\User',13),(2,'App\\Models\\User',1),(3,'App\\Models\\User',2),(4,'App\\Models\\User',3),(5,'App\\Models\\User',4);
/*!40000 ALTER TABLE `model_has_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `owners`
--

DROP TABLE IF EXISTS `owners`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `owners` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `owners_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `owners`
--

LOCK TABLES `owners` WRITE;
/*!40000 ALTER TABLE `owners` DISABLE KEYS */;
INSERT INTO `owners` VALUES (1,'gakenke district','gakenke@mail.com','078555555555','2022-12-31 13:07:23','2022-12-31 13:07:23');
/*!40000 ALTER TABLE `owners` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permissions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissions`
--

LOCK TABLES `permissions` WRITE;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
INSERT INTO `permissions` VALUES (1,'N/A','web','2022-12-29 15:04:47','2022-12-29 15:04:47'),(2,'create: user','web','2022-12-29 15:04:48','2022-12-29 15:04:48'),(3,'read: user','web','2022-12-29 15:04:48','2022-12-29 15:04:48'),(4,'update: user','web','2022-12-29 15:04:48','2022-12-29 15:04:48'),(5,'delete: user','web','2022-12-29 15:04:48','2022-12-29 15:04:48'),(6,'create: role','web','2022-12-29 15:04:48','2022-12-29 15:04:48'),(7,'read: role','web','2022-12-29 15:04:48','2022-12-29 15:04:48'),(8,'update: role','web','2022-12-29 15:04:48','2022-12-29 15:04:48'),(9,'delete: role','web','2022-12-29 15:04:49','2022-12-29 15:04:49'),(10,'create: permission','web','2022-12-29 15:04:49','2022-12-29 15:04:49'),(11,'read: permission','web','2022-12-29 15:04:49','2022-12-29 15:04:49'),(12,'update: permission','web','2022-12-29 15:04:49','2022-12-29 15:04:49'),(13,'delete: permission','web','2022-12-29 15:04:49','2022-12-29 15:04:49'),(14,'create: device','web','2022-12-29 15:04:49','2022-12-29 15:04:49'),(15,'read: device','web','2022-12-29 15:04:49','2022-12-29 15:04:49'),(16,'update: device','web','2022-12-29 15:04:49','2022-12-29 15:04:49'),(17,'delete: device','web','2022-12-29 15:04:49','2022-12-29 15:04:49'),(18,'create: client','web','2022-12-29 15:04:49','2022-12-29 15:04:49'),(19,'read: client','web','2022-12-29 15:04:49','2022-12-29 15:04:49'),(20,'update: client','web','2022-12-29 15:04:49','2022-12-29 15:04:49'),(21,'delete: client','web','2022-12-29 15:04:49','2022-12-29 15:04:49'),(22,'create: owner','web','2022-12-29 15:04:50','2022-12-29 15:04:50'),(23,'read: owner','web','2022-12-29 15:04:50','2022-12-29 15:04:50'),(24,'update: owner','web','2022-12-29 15:04:50','2022-12-29 15:04:50'),(25,'delete: owner','web','2022-12-29 15:04:50','2022-12-29 15:04:50'),(26,'create: diagnosis','web','2022-12-29 15:04:50','2022-12-29 15:04:50'),(27,'read: diagnosis','web','2022-12-29 15:04:50','2022-12-29 15:04:50'),(28,'update: diagnosis','web','2022-12-29 15:04:50','2022-12-29 15:04:50'),(29,'delete: diagnosis','web','2022-12-29 15:04:50','2022-12-29 15:04:50'),(30,'read: admin','web','2022-12-29 15:04:50','2022-12-29 15:04:50'),(31,'update: admin','web','2022-12-29 15:04:50','2022-12-29 15:04:50');
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_access_tokens`
--

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_has_permissions`
--

DROP TABLE IF EXISTS `role_has_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) unsigned NOT NULL,
  `role_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `role_has_permissions_role_id_foreign` (`role_id`),
  CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_has_permissions`
--

LOCK TABLES `role_has_permissions` WRITE;
/*!40000 ALTER TABLE `role_has_permissions` DISABLE KEYS */;
INSERT INTO `role_has_permissions` VALUES (1,1),(2,2),(2,3),(3,2),(3,3),(3,4),(4,2),(4,3),(5,2),(5,3),(6,2),(6,3),(7,2),(7,3),(7,4),(8,2),(8,3),(9,2),(9,3),(10,2),(10,3),(11,2),(11,3),(11,4),(12,2),(12,3),(13,2),(13,3),(14,2),(14,3),(15,2),(15,3),(15,4),(16,2),(16,3),(17,2),(17,3),(18,2),(18,3),(19,2),(19,3),(19,4),(20,2),(20,3),(21,2),(21,3),(22,2),(22,3),(23,2),(23,3),(23,4),(24,2),(24,3),(25,2),(25,3),(26,2),(26,3),(27,2),(27,3),(27,4),(28,2),(28,3),(29,2),(29,3),(30,2),(30,3),(30,4),(30,5),(31,2),(31,3);
/*!40000 ALTER TABLE `role_has_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'user','web','2022-12-29 15:04:51','2022-12-29 15:04:51'),(2,'super-admin','web','2022-12-29 15:04:51','2022-12-29 15:04:51'),(3,'admin','web','2022-12-29 15:04:53','2022-12-29 15:04:53'),(4,'moderator','web','2022-12-29 15:04:56','2022-12-29 15:04:56'),(5,'developer','web','2022-12-29 15:04:57','2022-12-29 15:04:57');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` VALUES ('dWcCcpXtSP4jEZQLHRqLmtqoF3FZOF3YlZqIuBC2',1,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36','YTo2OntzOjY6Il90b2tlbiI7czo0MDoiNmVFTGh5amluUWljTFhIaXBzTHVDc2xLRElEbWpPb0NYTzZlSm4wYiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9kYXNoYm9hcmQiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToxO3M6MjE6InBhc3N3b3JkX2hhc2hfc2FuY3R1bSI7czo2MDoiJDJ5JDEwJGhjcWQvUERIeUJqUDVNZzkuYnd6Zi5PdVAvcG54MFphTzFXVnlJeWppMFlTV2R4ZkZYd3NlIjtzOjE3OiJwYXNzd29yZF9oYXNoX3dlYiI7czo2MDoiJDJ5JDEwJGhjcWQvUERIeUJqUDVNZzkuYnd6Zi5PdVAvcG54MFphTzFXVnlJeWppMFlTV2R4ZkZYd3NlIjt9',1682939844),('rp14mXpa0olydQbsybkgK2F3WN8WCir5x71BEUvY',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoialA5T3czbVQ4R3E4SFU2NXB5NzdnNXY0c1ZIWHFTNXJ6MFhjMlN1VSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzM6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hZG1pbi9sb2dpbiI7fX0=',1672499861),('X4YzUAtw2XPJDGHw9H7Z54znSF5ffY4zaov8RzTk',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36','YTo0OntzOjY6Il90b2tlbiI7czo0MDoiSE56aGhUMk1hMHc2TExaT29WWUJXUTdyejJOUmk2Wmd1cjMxRWNXQyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czoyNzoiaHR0cDovLzEyNy4wLjAuMTo4MDAwL2FkbWluIjt9czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fX0=',1672500060);
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `team_invitations`
--

DROP TABLE IF EXISTS `team_invitations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `team_invitations` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `team_id` bigint(20) unsigned NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `team_invitations_team_id_email_unique` (`team_id`,`email`),
  CONSTRAINT `team_invitations_team_id_foreign` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `team_invitations`
--

LOCK TABLES `team_invitations` WRITE;
/*!40000 ALTER TABLE `team_invitations` DISABLE KEYS */;
/*!40000 ALTER TABLE `team_invitations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `team_user`
--

DROP TABLE IF EXISTS `team_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `team_user` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `team_id` bigint(20) unsigned NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `role` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `team_user_team_id_user_id_unique` (`team_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `team_user`
--

LOCK TABLES `team_user` WRITE;
/*!40000 ALTER TABLE `team_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `team_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teams`
--

DROP TABLE IF EXISTS `teams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `teams` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_team` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `teams_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teams`
--

LOCK TABLES `teams` WRITE;
/*!40000 ALTER TABLE `teams` DISABLE KEYS */;
/*!40000 ALTER TABLE `teams` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tinnumbers`
--

DROP TABLE IF EXISTS `tinnumbers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tinnumbers` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `company_name` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tin_number` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Phone_number` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tinnumbers`
--

LOCK TABLES `tinnumbers` WRITE;
/*!40000 ALTER TABLE `tinnumbers` DISABLE KEYS */;
/*!40000 ALTER TABLE `tinnumbers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_admin` tinyint(1) NOT NULL DEFAULT 0,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `two_factor_secret` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `two_factor_recovery_codes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `two_factor_confirmed_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `current_team_id` bigint(20) unsigned DEFAULT NULL,
  `profile_photo_path` varchar(2048) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'super admin',1,'super@admin.com','2022-12-29 15:04:58','$2y$10$hcqd/PDHyBjP5Mg9.bwzf.OuP/pnx0ZaO1WVyIyji0YSWdxfFXwse',NULL,NULL,NULL,'9I0ZDCl7McdWqATiDhoRQ19lGOloJ5rcexom2c8FdfDH8GeiVij4FyPDSXBM',NULL,NULL,NULL,'2022-12-29 15:04:58','2022-12-29 15:04:58'),(2,'admin',1,'admin@admin.com','2022-12-29 15:04:59','$2y$10$ULamHttWNLGwVtm/onUkH.1ce5kB3q5YrVj7iy570dp5TCXqGMIXK',NULL,NULL,NULL,'bUWBPP2CGE',NULL,NULL,NULL,'2022-12-29 15:04:59','2022-12-29 15:04:59'),(3,'moderator',1,'moderator@admin.com','2022-12-29 15:04:59','$2y$10$qfCvJmPft5CNNLGX54kyqO6WUlPxMpuUS/IwgFn.iTsEKX00Vr8fi',NULL,NULL,NULL,'kE3zI53Bql',NULL,NULL,NULL,'2022-12-29 15:04:59','2022-12-29 15:04:59'),(4,'developer',1,'developer@admin.com','2022-12-29 15:05:00','$2y$10$Yv36QCibCTQEPyiHB9AZouA.dlSj/8ZaEYuAE9l32FOxJ3o9B0z2.',NULL,NULL,NULL,'79bKUOyPCL4HjMbAL3i6LSHXmp1HVxOnpNCO9l1ssGySF24EesAcSxW9FrfD',NULL,NULL,NULL,'2022-12-29 15:05:00','2022-12-29 15:05:00'),(5,'Test 1',0,'test1@test.com','2022-12-29 15:05:00','$2y$10$f4nb3sTAx34rEaj7NZEkL.45LOwhw0o.UxytwgGJIB7ZDXwtMhddO',NULL,NULL,NULL,'q7T89Mvyjm',NULL,NULL,NULL,'2022-12-29 15:05:00','2022-12-29 15:05:00'),(6,'Test 2',0,'test2@test.com','2022-12-29 15:05:00','$2y$10$olGDxnW0CCwbRA6IGN8GuulnEPHzDpMDVC8TB6jgLGLE21ZMsMssS',NULL,NULL,NULL,'fPOx3EoqiD',NULL,NULL,NULL,'2022-12-29 15:05:01','2022-12-29 15:05:01'),(7,'Test 3',0,'test3@test.com','2022-12-29 15:05:01','$2y$10$tX1s18PyAq1TBl8P3TYu0eLjHj8pZq5TomII8LSgWahGFYWnleQnq',NULL,NULL,NULL,'9NFaooNf4k',NULL,NULL,NULL,'2022-12-29 15:05:01','2022-12-29 15:05:01'),(8,'Test 4',0,'test4@test.com','2022-12-29 15:05:01','$2y$10$S/XN5/0YQ7buqZtgp2zJkuFe415qZV4mO1/mqoIErfOKhQdEyKN.e',NULL,NULL,NULL,'ueAF363SGx',NULL,NULL,NULL,'2022-12-29 15:05:02','2022-12-29 15:05:02'),(9,'Test 5',0,'test5@test.com','2022-12-29 15:05:02','$2y$10$uUULHMpHRISwuF3mc.8Rge5YsmjJ/KYdOx/HrqQiEkCVQJUAQ9NVu',NULL,NULL,NULL,'k630Lc8nZl',NULL,NULL,NULL,'2022-12-29 15:05:02','2022-12-29 15:05:02'),(10,'Test 6',0,'test6@test.com','2022-12-29 15:05:02','$2y$10$HvqZZkOiWf2jHUpiy9lh2uNI4NmF5x.vIHH7mC8lwNjuVb.pXtXJ.',NULL,NULL,NULL,'comaIW1lS9',NULL,NULL,NULL,'2022-12-29 15:05:02','2022-12-29 15:05:02'),(11,'Test 7',0,'test7@test.com','2022-12-29 15:05:03','$2y$10$h6MdG39C6Cyk9yF4TyTvXeoRSD4qdWsP7yILwZtz.c67Y11qfQVqS',NULL,NULL,NULL,'RUMCXYPPWQ',NULL,NULL,NULL,'2022-12-29 15:05:03','2022-12-29 15:05:03'),(12,'Test 8',0,'test8@test.com','2022-12-29 15:05:03','$2y$10$DZ/1gelOff2KptOov0kuluVdi9YKJ4O/KNnEhhe4BMv3QI4YOyJhi',NULL,NULL,NULL,'IvpNpV66Tq',NULL,NULL,NULL,'2022-12-29 15:05:03','2022-12-29 15:05:03'),(13,'Test 9',0,'test9@test.com','2022-12-29 15:05:03','$2y$10$Mzi0M.G7GKJOrM4Pm9cASeV4R2Lj4agrgNjU1EYRgiUf1AJDc4fp.',NULL,NULL,NULL,'eXhlWNz08f',NULL,NULL,NULL,'2022-12-29 15:05:03','2022-12-29 15:05:03');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-05-01 14:48:43

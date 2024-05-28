-- MySQL dump 10.13  Distrib 8.0.36, for Linux (x86_64)
--
-- Host: localhost    Database: stage002_dan2
-- ------------------------------------------------------
-- Server version	8.0.36-0ubuntu0.22.04.1

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
-- Table structure for table `cache`
--

DROP TABLE IF EXISTS `cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cache` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache`
--

LOCK TABLES `cache` WRITE;
/*!40000 ALTER TABLE `cache` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache_locks`
--

DROP TABLE IF EXISTS `cache_locks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cache_locks` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_locks`
--

LOCK TABLES `cache_locks` WRITE;
/*!40000 ALTER TABLE `cache_locks` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache_locks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client_deal`
--

DROP TABLE IF EXISTS `client_deal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `client_deal` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `client_id` bigint unsigned NOT NULL,
  `deal_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `client_deal_client_id_foreign` (`client_id`),
  KEY `client_deal_deal_id_foreign` (`deal_id`),
  CONSTRAINT `client_deal_client_id_foreign` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`),
  CONSTRAINT `client_deal_deal_id_foreign` FOREIGN KEY (`deal_id`) REFERENCES `deals` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client_deal`
--

LOCK TABLES `client_deal` WRITE;
/*!40000 ALTER TABLE `client_deal` DISABLE KEYS */;
INSERT INTO `client_deal` VALUES (1,10,1),(2,9,2),(3,10,2),(4,1,3),(5,19,3),(6,7,4),(7,16,4),(8,1,5),(9,17,5),(10,4,6),(11,14,6),(12,11,7),(13,16,7),(14,12,8),(15,4,9),(16,15,9),(17,10,10),(18,13,10),(19,1,11),(20,12,11),(21,11,12),(22,12,12),(23,1,13),(24,19,13),(25,2,14),(26,1,15),(27,9,15);
/*!40000 ALTER TABLE `client_deal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client_statuses`
--

DROP TABLE IF EXISTS `client_statuses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `client_statuses` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client_statuses`
--

LOCK TABLES `client_statuses` WRITE;
/*!40000 ALTER TABLE `client_statuses` DISABLE KEYS */;
INSERT INTO `client_statuses` VALUES (1,'porro','2024-05-19 15:39:52','2024-05-19 15:39:52'),(2,'nobis','2024-05-19 15:39:52','2024-05-19 15:39:52'),(3,'quidem','2024-05-19 15:39:52','2024-05-19 15:39:52'),(4,'sed','2024-05-19 15:39:52','2024-05-19 15:39:52'),(5,'voluptas','2024-05-19 15:39:52','2024-05-19 15:39:52');
/*!40000 ALTER TABLE `client_statuses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clients`
--

DROP TABLE IF EXISTS `clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clients` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `patronymic` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone_number` int unsigned NOT NULL,
  `status_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `clients_status_id_foreign` (`status_id`),
  CONSTRAINT `clients_status_id_foreign` FOREIGN KEY (`status_id`) REFERENCES `client_statuses` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clients`
--

LOCK TABLES `clients` WRITE;
/*!40000 ALTER TABLE `clients` DISABLE KEYS */;
INSERT INTO `clients` VALUES (1,'Belle','Orn','Julien',737392826,1,'2024-05-19 15:39:52','2024-05-19 15:39:52'),(2,'Maximilian','Dickinson','German',366924676,5,'2024-05-19 15:39:52','2024-05-19 15:39:52'),(3,'Malinda','Bode','Fletcher',654812004,4,'2024-05-19 15:39:52','2024-05-19 15:39:52'),(4,'Jace','Waters','Howell',874638476,5,'2024-05-19 15:39:52','2024-05-19 15:39:52'),(5,'Sigurd','Rempel','Alan',703687156,5,'2024-05-19 15:39:52','2024-05-19 15:39:52'),(6,'Ryley','McLaughlin','Hermann',471635669,5,'2024-05-19 15:39:52','2024-05-19 15:39:52'),(7,'Bell','Huel','Christ',183106869,2,'2024-05-19 15:39:52','2024-05-19 15:39:52'),(8,'Viviane','Klein','Arely',254343412,1,'2024-05-19 15:39:52','2024-05-19 15:39:52'),(9,'Randi','Thompson','Arely',604342210,5,'2024-05-19 15:39:52','2024-05-19 15:39:52'),(10,'Matilda','Kiehn','Nicklaus',210635985,1,'2024-05-19 15:39:52','2024-05-19 15:39:52'),(11,'Zachariah','Johns','Nestor',204503066,1,'2024-05-19 15:39:52','2024-05-19 15:39:52'),(12,'Emmitt','Abbott','Reginald',867765956,5,'2024-05-19 15:39:52','2024-05-19 15:39:52'),(13,'Bonita','Ebert','Tito',907638078,2,'2024-05-19 15:39:52','2024-05-19 15:39:52'),(14,'Sigrid','Hegmann','Freddy',399916613,1,'2024-05-19 15:39:52','2024-05-19 15:39:52'),(15,'Asa','Gleichner','Julien',607567122,2,'2024-05-19 15:39:52','2024-05-19 15:39:52'),(16,'Opal','Gottlieb','Maxime',259163506,1,'2024-05-19 15:39:52','2024-05-19 15:39:52'),(17,'Jonas','Ankunding','Dominic',273772460,3,'2024-05-19 15:39:52','2024-05-19 15:39:52'),(18,'Sheila','Kshlerin','Reyes',460195879,5,'2024-05-19 15:39:52','2024-05-19 15:39:52'),(19,'Sherwood','Funk','Kenyon',725904443,3,'2024-05-19 15:39:52','2024-05-19 15:39:52'),(20,'Kamron','Ortiz','Kayley',595428408,3,'2024-05-19 15:39:52','2024-05-19 15:39:52'),(21,'Vasay','Pypkin','Petrov',996660011,2,'2024-05-19 18:17:21','2024-05-19 18:17:21');
/*!40000 ALTER TABLE `clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deal_real_estate_object`
--

DROP TABLE IF EXISTS `deal_real_estate_object`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `deal_real_estate_object` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `real_estate_object_id` bigint unsigned NOT NULL,
  `deal_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `deal_real_estate_object_real_estate_object_id_foreign` (`real_estate_object_id`),
  KEY `deal_real_estate_object_deal_id_foreign` (`deal_id`),
  CONSTRAINT `deal_real_estate_object_deal_id_foreign` FOREIGN KEY (`deal_id`) REFERENCES `deals` (`id`),
  CONSTRAINT `deal_real_estate_object_real_estate_object_id_foreign` FOREIGN KEY (`real_estate_object_id`) REFERENCES `real_estate_objects` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deal_real_estate_object`
--

LOCK TABLES `deal_real_estate_object` WRITE;
/*!40000 ALTER TABLE `deal_real_estate_object` DISABLE KEYS */;
INSERT INTO `deal_real_estate_object` VALUES (1,14,1),(2,23,1),(3,2,2),(4,8,2),(5,4,3),(6,13,3),(7,3,4),(8,4,4),(9,6,5),(10,14,5),(11,19,6),(12,24,6),(13,7,7),(14,19,7),(15,7,8),(16,14,8),(17,2,9),(18,27,9),(19,21,10),(20,30,10),(21,7,11),(22,15,12),(23,23,12),(24,17,13),(25,28,13),(26,3,14),(27,28,14),(28,1,15),(29,26,15);
/*!40000 ALTER TABLE `deal_real_estate_object` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deal_statuses`
--

DROP TABLE IF EXISTS `deal_statuses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `deal_statuses` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deal_statuses`
--

LOCK TABLES `deal_statuses` WRITE;
/*!40000 ALTER TABLE `deal_statuses` DISABLE KEYS */;
INSERT INTO `deal_statuses` VALUES (1,'vero','2024-05-19 15:39:52','2024-05-19 15:39:52'),(2,'autem','2024-05-19 15:39:52','2024-05-19 15:39:52'),(3,'ut','2024-05-19 15:39:52','2024-05-19 15:39:52'),(4,'sed','2024-05-19 15:39:52','2024-05-19 15:39:52'),(5,'nulla','2024-05-19 15:39:52','2024-05-19 15:39:52');
/*!40000 ALTER TABLE `deal_statuses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deals`
--

DROP TABLE IF EXISTS `deals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `deals` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `number` int NOT NULL,
  `status_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `deals_status_id_foreign` (`status_id`),
  CONSTRAINT `deals_status_id_foreign` FOREIGN KEY (`status_id`) REFERENCES `deal_statuses` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deals`
--

LOCK TABLES `deals` WRITE;
/*!40000 ALTER TABLE `deals` DISABLE KEYS */;
INSERT INTO `deals` VALUES (1,180558314,4,'2024-05-19 15:39:52','2024-05-19 15:39:52'),(2,712810859,5,'2024-05-19 15:39:52','2024-05-19 15:39:52'),(3,153123368,4,'2024-05-19 15:39:52','2024-05-19 15:39:52'),(4,665219606,1,'2024-05-19 15:39:52','2024-05-19 15:39:52'),(5,636909493,2,'2024-05-19 15:39:52','2024-05-19 15:39:52'),(6,452520191,1,'2024-05-19 15:39:52','2024-05-19 15:39:52'),(7,509511239,2,'2024-05-19 15:39:52','2024-05-19 15:39:52'),(8,867476785,4,'2024-05-19 15:39:52','2024-05-19 15:39:52'),(9,359103029,3,'2024-05-19 15:39:52','2024-05-19 15:39:52'),(10,506934494,4,'2024-05-19 15:39:52','2024-05-19 15:39:52'),(11,404391586,3,'2024-05-19 15:39:52','2024-05-19 15:39:52'),(12,386738160,5,'2024-05-19 15:39:52','2024-05-19 15:39:52'),(13,472381659,2,'2024-05-19 15:39:52','2024-05-19 15:39:52'),(14,937015658,1,'2024-05-19 15:39:52','2024-05-19 15:39:52'),(15,650825583,2,'2024-05-19 15:39:52','2024-05-19 15:39:52'),(16,123456789,2,'2024-05-19 18:23:58','2024-05-19 18:23:58');
/*!40000 ALTER TABLE `deals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
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
-- Table structure for table `job_batches`
--

DROP TABLE IF EXISTS `job_batches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `job_batches` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_batches`
--

LOCK TABLES `job_batches` WRITE;
/*!40000 ALTER TABLE `job_batches` DISABLE KEYS */;
/*!40000 ALTER TABLE `job_batches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint unsigned NOT NULL,
  `reserved_at` int unsigned DEFAULT NULL,
  `available_at` int unsigned NOT NULL,
  `created_at` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs`
--

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'0001_01_01_000000_create_users_table',1),(2,'0001_01_01_000001_create_cache_table',1),(3,'0001_01_01_000002_create_jobs_table',1),(4,'2024_05_18_141105_create_personal_access_tokens_table',1),(5,'2024_05_19_110309_create_real_estate_object_types_table',1),(6,'2024_05_19_110402_create_real_estate_object_statuses_table',1),(7,'2024_05_19_110447_create_real_estate_objects_table',1),(8,'2024_05_19_110520_create_deal_statuses_table',1),(9,'2024_05_19_110531_create_deals_table',1),(10,'2024_05_19_110555_create_client_statuses_table',1),(11,'2024_05_19_110611_create_clients_table',1),(12,'2024_05_19_110712_create_object_deal_table',1),(13,'2024_05_19_110805_create_client_deal_table',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_reset_tokens`
--

LOCK TABLES `password_reset_tokens` WRITE;
/*!40000 ALTER TABLE `password_reset_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_reset_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_access_tokens`
--

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
INSERT INTO `personal_access_tokens` VALUES (1,'App\\Models\\User',1,'auth_token','0266280ccb5eaf79b44c4e58fbb66bad539a4cfc436bec97e657aa64b50529bb','[\"*\"]',NULL,NULL,'2024-05-19 15:57:33','2024-05-19 15:57:33'),(2,'App\\Models\\User',1,'auth_token','29dcbee2fb35523e9f1f2ef13798a607bb7d9ce1faa3652dd9e1dfc5472efbdb','[\"*\"]','2024-05-19 17:05:35',NULL,'2024-05-19 15:57:47','2024-05-19 17:05:35'),(3,'App\\Models\\User',1,'auth_token','9d4dfc304a79499bfcc3ab9bde3431fff317f107af68b68ba99f8c9e1b159dd2','[\"*\"]','2024-05-19 18:24:07',NULL,'2024-05-19 17:07:21','2024-05-19 18:24:07'),(4,'App\\Models\\User',1,'auth_token','c4e36f01256b6005a88f69933f01d3257f3d74a5aef02a7f66c19e47a035a505','[\"*\"]',NULL,NULL,'2024-05-19 20:57:19','2024-05-19 20:57:19');
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `real_estate_object_statuses`
--

DROP TABLE IF EXISTS `real_estate_object_statuses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `real_estate_object_statuses` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `real_estate_object_statuses`
--

LOCK TABLES `real_estate_object_statuses` WRITE;
/*!40000 ALTER TABLE `real_estate_object_statuses` DISABLE KEYS */;
INSERT INTO `real_estate_object_statuses` VALUES (1,'dolore','2024-05-19 15:39:52','2024-05-19 15:39:52'),(2,'atque','2024-05-19 15:39:52','2024-05-19 15:39:52'),(3,'reiciendis','2024-05-19 15:39:52','2024-05-19 15:39:52'),(4,'exercitationem','2024-05-19 15:39:52','2024-05-19 15:39:52'),(5,'modi','2024-05-19 15:39:52','2024-05-19 15:39:52');
/*!40000 ALTER TABLE `real_estate_object_statuses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `real_estate_object_types`
--

DROP TABLE IF EXISTS `real_estate_object_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `real_estate_object_types` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `real_estate_object_types`
--

LOCK TABLES `real_estate_object_types` WRITE;
/*!40000 ALTER TABLE `real_estate_object_types` DISABLE KEYS */;
INSERT INTO `real_estate_object_types` VALUES (1,'omnis','2024-05-19 15:39:52','2024-05-19 15:39:52'),(2,'sit','2024-05-19 15:39:52','2024-05-19 15:39:52'),(3,'occaecati','2024-05-19 15:39:52','2024-05-19 15:39:52'),(4,'molestiae','2024-05-19 15:39:52','2024-05-19 15:39:52'),(5,'ullam','2024-05-19 15:39:52','2024-05-19 15:39:52'),(6,'doloremque','2024-05-19 15:39:52','2024-05-19 15:39:52'),(7,'nesciunt','2024-05-19 15:39:52','2024-05-19 15:39:52'),(8,'a','2024-05-19 15:39:52','2024-05-19 15:39:52'),(9,'repellat','2024-05-19 15:39:52','2024-05-19 15:39:52'),(10,'eveniet','2024-05-19 15:39:52','2024-05-19 15:39:52'),(11,'ea','2024-05-19 15:39:52','2024-05-19 15:39:52'),(12,'asperiores','2024-05-19 15:39:52','2024-05-19 15:39:52'),(13,'consectetur','2024-05-19 15:39:52','2024-05-19 15:39:52'),(14,'dolores','2024-05-19 15:39:52','2024-05-19 15:39:52'),(15,'labore','2024-05-19 15:39:52','2024-05-19 15:39:52');
/*!40000 ALTER TABLE `real_estate_object_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `real_estate_objects`
--

DROP TABLE IF EXISTS `real_estate_objects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `real_estate_objects` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `type_id` bigint unsigned NOT NULL,
  `status_id` bigint unsigned NOT NULL,
  `number_of_rooms` int unsigned NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `area` int unsigned NOT NULL,
  `floor` int unsigned NOT NULL,
  `apartament_number` int unsigned NOT NULL,
  `price` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `real_estate_objects_type_id_foreign` (`type_id`),
  KEY `real_estate_objects_status_id_foreign` (`status_id`),
  CONSTRAINT `real_estate_objects_status_id_foreign` FOREIGN KEY (`status_id`) REFERENCES `real_estate_object_statuses` (`id`),
  CONSTRAINT `real_estate_objects_type_id_foreign` FOREIGN KEY (`type_id`) REFERENCES `real_estate_object_types` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `real_estate_objects`
--

LOCK TABLES `real_estate_objects` WRITE;
/*!40000 ALTER TABLE `real_estate_objects` DISABLE KEYS */;
INSERT INTO `real_estate_objects` VALUES (1,1,3,1,'7267 Hollis Track\nLake Leola, NC 84687',182,19,583,2365867,'2024-05-19 15:39:52','2024-05-19 15:39:52'),(2,5,3,2,'94091 Clyde Throughway\nSouth Cary, ND 27207-8090',108,6,446,8410209,'2024-05-19 15:39:52','2024-05-19 15:39:52'),(3,3,3,3,'277 Homenick Vista Apt. 533\nNorth Sheafurt, MS 56158',24,9,799,3382518,'2024-05-19 15:39:52','2024-05-19 15:39:52'),(4,14,3,4,'4055 Lenna Street Suite 158\nMedhurstborough, NM 80394',35,15,719,7526927,'2024-05-19 15:39:52','2024-05-19 15:39:52'),(5,1,5,4,'538 O\'Kon Streets Suite 001\nSouth Braulio, AK 00210',117,10,152,6940086,'2024-05-19 15:39:52','2024-05-19 15:39:52'),(6,4,2,3,'34803 Bonnie Mission\nLittleside, KY 97773',197,8,412,3751073,'2024-05-19 15:39:52','2024-05-19 15:39:52'),(7,13,2,3,'861 Littel Extension Apt. 628\nSouth Kenny, MI 65031-1857',186,6,430,4864569,'2024-05-19 15:39:52','2024-05-19 15:39:52'),(8,15,2,2,'629 Diego Overpass Apt. 109\nRosinamouth, OR 23921-5350',34,2,662,2681027,'2024-05-19 15:39:52','2024-05-19 15:39:52'),(9,10,5,2,'65366 Tremaine Hills\nSarahmouth, PA 51682-1961',33,5,45,6198032,'2024-05-19 15:39:52','2024-05-19 15:39:52'),(10,3,1,1,'61214 Jamal Mountain Suite 581\nCristhaven, PA 39701-6574',121,14,491,7264077,'2024-05-19 15:39:52','2024-05-19 15:39:52'),(11,5,3,4,'23093 Jenkins Ports Apt. 813\nMyrticestad, NM 54360',179,19,184,3714578,'2024-05-19 15:39:52','2024-05-19 15:39:52'),(12,2,2,1,'8635 Connelly Bridge Suite 772\nLake Mateo, NY 17125-4512',79,14,475,7777588,'2024-05-19 15:39:52','2024-05-19 15:39:52'),(13,14,2,2,'367 Brendon Throughway Suite 819\nAhmedborough, NE 26298-8484',164,11,479,9665624,'2024-05-19 15:39:52','2024-05-19 15:39:52'),(14,7,3,2,'48462 Wiegand Key Apt. 207\nNorth Alessandrofurt, NH 16690',199,13,519,7994101,'2024-05-19 15:39:52','2024-05-19 15:39:52'),(15,7,1,2,'86011 Keeling Plaza\nZulaburgh, NJ 83809-2677',86,13,803,1108104,'2024-05-19 15:39:52','2024-05-19 15:39:52'),(16,8,5,2,'4606 Tremblay Circle\nJazmynchester, MO 75715',38,5,429,5814835,'2024-05-19 15:39:52','2024-05-19 15:39:52'),(17,4,1,1,'925 Pacocha Freeway\nEast Alexandrine, ME 27923-6462',23,20,324,7575822,'2024-05-19 15:39:52','2024-05-19 15:39:52'),(18,2,4,3,'273 Koepp Rue Apt. 825\nFayeville, OH 16928-7197',70,10,574,7639938,'2024-05-19 15:39:52','2024-05-19 15:39:52'),(19,6,2,3,'83189 Cecilia Cape Apt. 793\nWest Eleonore, MN 05065-9130',151,11,738,1048265,'2024-05-19 15:39:52','2024-05-19 15:39:52'),(20,9,2,3,'408 Brielle Plaza Suite 687\nNew Avafurt, CT 93648',117,1,717,1460018,'2024-05-19 15:39:52','2024-05-19 15:39:52'),(21,4,2,2,'1935 Talia Parkway\nConnellyshire, RI 62890-6762',152,4,34,1081902,'2024-05-19 15:39:52','2024-05-19 15:39:52'),(22,2,5,2,'28294 Waters Landing Suite 783\nWest Roxanne, AK 28385',108,13,688,2251196,'2024-05-19 15:39:52','2024-05-19 15:39:52'),(23,5,5,2,'8197 Prohaska Corners\nDeltafurt, AZ 08156',58,4,677,3008373,'2024-05-19 15:39:52','2024-05-19 15:39:52'),(24,2,4,4,'1696 Sporer Roads\nMurazikstad, TX 16690',30,2,184,9053240,'2024-05-19 15:39:52','2024-05-19 15:39:52'),(25,4,4,3,'2896 Padberg Corner Suite 785\nEinochester, WA 01964',154,12,100,5889098,'2024-05-19 15:39:52','2024-05-19 15:39:52'),(26,5,3,1,'215 Powlowski Hills Suite 311\nOberbrunnerside, ME 44975-9921',133,13,549,9474808,'2024-05-19 15:39:52','2024-05-19 15:39:52'),(27,7,5,1,'9745 Kaylie Hills\nEleazarbury, TX 20516',86,14,1000,1659133,'2024-05-19 15:39:52','2024-05-19 15:39:52'),(28,12,1,3,'3821 Williamson Land\nEffertzberg, NJ 77321-1674',34,12,330,3523472,'2024-05-19 15:39:52','2024-05-19 15:39:52'),(29,5,1,4,'7403 Robel Overpass Suite 903\nReynoldsview, DE 29954',178,8,207,6521086,'2024-05-19 15:39:52','2024-05-19 15:39:52'),(30,3,3,3,'8391 Parker Green Apt. 426\nIbrahimville, CT 11122-9433',116,19,717,6569791,'2024-05-19 15:39:52','2024-05-19 15:39:52');
/*!40000 ALTER TABLE `real_estate_objects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL,
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
INSERT INTO `sessions` VALUES ('21jmpzqgum7iNygc0cuyOGeyX7kAO1cM0KxFRnOD',NULL,'213.139.210.177','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.157 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiZGVxcU5UbUZjNEloaWl5ZW5nenByMTJ6STRjWnB3TE42MWdxVUY4aCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHBzOi8vc3RhZ2UwMDIuZGFuaWlsLXRhdGFyZW5rby5ydSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1716149641),('2H2ghJEB2JcfmIAJaEnofe3fQ30Yz3IkngxZhUJ7',NULL,'213.139.210.177','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.157 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiT0RYWUhFRXZCbGNhREFzZjZ0YjdqaHp5bzRkYThnRHdHdEdaM0JwNiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHBzOi8vc3RhZ2UwMDIuZGFuaWlsLXRhdGFyZW5rby5ydSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1716144961),('3lcVbpBgBl7aw9lEwSufX33dERvc8WA3HYCgMepS',NULL,'213.139.210.177','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.157 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiaFNodk42S085dzl1UFdTQ2g0c1VmcVZHZ0lWVGJLUWVBeVp3WDFHcyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHBzOi8vc3RhZ2UwMDIuZGFuaWlsLXRhdGFyZW5rby5ydSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1716150481),('3MUiMMyLo7qXakAX5VpnxVHo4rgNxlvngm9vwsiQ',NULL,'213.139.210.177','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.157 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoibEI5akNFOXN6Z3FhNkZraVIzeWRRMEszakl6dWxBMVBHTTBmdmVIMCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHBzOi8vc3RhZ2UwMDIuZGFuaWlsLXRhdGFyZW5rby5ydSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1716148802),('bgOYsmVIGZ3sNOVgBfsHWtXoYDGrSlXWWuGfwRYs',NULL,'213.139.210.177','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.157 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiOXpnUW8zTnNZWTZncVJiZllrVmo0M1VORjVQWGFqYXZEVGhwMG5hcCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHBzOi8vc3RhZ2UwMDIuZGFuaWlsLXRhdGFyZW5rby5ydSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1716152161),('cH7K66dnCVwaq7DbPMO618tHSQ7N5MLlnGmhgOie',NULL,'185.4.72.146','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/109.0.5414.119 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiRWlvZkR2Z1UzQzVuQ01kcTR1WTlST1g4a1hDNWJ1UXhsc3MydTNEYyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHBzOi8vc3RhZ2UwMDIuZGFuaWlsLXRhdGFyZW5rby5ydSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1716152385),('CU0K1opoSQQJCzAmkcAaw7ndAsHwXR08FdGYMxQh',NULL,'213.139.210.177','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.157 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiYTd6Uk1iWVlmNUdFU1V1V2NQRTNJNFhXaVRGbHBBOXJMUkxmaUZFbSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHBzOi8vc3RhZ2UwMDIuZGFuaWlsLXRhdGFyZW5rby5ydSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1716151322),('I2xtR7O6iteLWzgnlMcWEtZoLnUAnLC6hnLap8Ag',NULL,'213.139.210.177','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.157 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoib3hhRTRHY2cydmlidXdvVGYzcHVuUHprUVVJdmVGUk1rRFZSN1lNaCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHBzOi8vc3RhZ2UwMDIuZGFuaWlsLXRhdGFyZW5rby5ydSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1716146881),('j9GAxrc9bbGApYGHlm4XojA4LtgDbmocErIC3ZV5',NULL,'213.139.210.177','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.157 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiNFB5UFlSOVNaemZMMGwyOUMwSzRFOWJUcmFVNEtWS2tZWU9lTFNURSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHBzOi8vc3RhZ2UwMDIuZGFuaWlsLXRhdGFyZW5rby5ydSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1716152402),('kDPrqo1iopyd5Rykhy7fkfroWyhClvZWjCm0apAk',NULL,'213.139.210.177','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.157 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiZDdlVmZHZUxVZmRMQ0pPcGYzWmJ1RzZMZFVzZFJBaFYzd0tEV0lLeCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHBzOi8vc3RhZ2UwMDIuZGFuaWlsLXRhdGFyZW5rby5ydSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1716146041),('l0H76AfzeLDRynm8WPSbv8xUBulMUIgOZB4BeXuu',NULL,'37.112.149.137','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoieW5oU0V1ejRqa1BMSkhtZEs4ZFFJUE9SQTl0ZUhyeEFGZnBDSEhVdCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHBzOi8vc3RhZ2UwMDIuZGFuaWlsLXRhdGFyZW5rby5ydSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1716151826),('mXKhzKxJDnrAoGSdmniIiyE2pdZ9JxQlSJVsngOS',NULL,'213.139.210.177','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.157 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoid1ZPQlVhVnY1UWVhQllxekJJb2Rrb2JrNlhvQ3BuQVdZaVhrVUNIUyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHBzOi8vc3RhZ2UwMDIuZGFuaWlsLXRhdGFyZW5rby5ydSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1716148561),('Uwqw88ihqPkbeKQXERC792nqfnT4RMLrx2X6TS17',NULL,'213.139.210.177','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.157 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiVkZmZFYwMmJTQlNYOUxOaFgwQ1duQVNmekpPZGNTSUlrb0tiVzhDaCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHBzOi8vc3RhZ2UwMDIuZGFuaWlsLXRhdGFyZW5rby5ydSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1716144122),('wQmb9ZzZhbE3PRcWMZWbnPYIrRbhOgygLQhY3R6g',NULL,'213.139.210.177','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.157 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiTEc2QjNMQlN5Y0lKb2xBbWszS1BGdDBQTVRUMWZoTDdhdlBLUFVMUCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHBzOi8vc3RhZ2UwMDIuZGFuaWlsLXRhdGFyZW5rby5ydSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1716147722),('xy5bD9cQu8JE8sL9oRvEJcvUpO4pu92Mc4BXCZzo',NULL,'213.139.210.177','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.157 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiUE1ibVJmQjBtYmNyaHJ3djY5N1huckVoRFBxejUwRldqcGFmS3R1RSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHBzOi8vc3RhZ2UwMDIuZGFuaWlsLXRhdGFyZW5rby5ydSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1716145202),('xyvrVUy3sNlaPlfJ3gkaun6Q4vU8AIC8Wor9sGSm',NULL,'37.112.149.137','PostmanRuntime/7.38.0','YTozOntzOjY6Il90b2tlbiI7czo0MDoiTzhLVWg5OU5tZmJtb285RkYwUVUycFA2cnZRb3NwaEpRekoweVBNTCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTY6Imh0dHBzOi8vc3RhZ2UwMDIuZGFuaWlsLXRhdGFyZW5rby5ydS9zYW5jdHVtL2NzcmYtY29va2llIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1716152238);
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Daniil','eldanto00871@gmail.com',NULL,'$2y$12$KXUoDTR.E4uCPcTe63uxduvBCGxR9YilTfag2JGVS0EWHulsRYEkm',NULL,'2024-05-19 15:57:33','2024-05-19 15:57:33');
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

-- Dump completed on 2024-05-19 21:00:04

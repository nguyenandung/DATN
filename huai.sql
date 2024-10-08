-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: localhost    Database: haui
-- ------------------------------------------------------
-- Server version	8.0.33

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `address` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `phone` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `address_user_id_foreign` (`user_id`),
  CONSTRAINT `address_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address`
--

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
INSERT INTO `address` VALUES (5,7,'0867372693','Dũng','Hà Nội'),(6,7,'0867372693','Dũng','Hà Nội'),(7,7,'0867372693','Dũng','Hà Nội'),(8,8,'0867372693','Dũng','Hà Nội'),(9,8,'0867372693','Nam','Nam Định');
/*!40000 ALTER TABLE `address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `product_id` bigint unsigned NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `quantity` int NOT NULL,
  `size` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `color` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cart_product_id_foreign` (`product_id`),
  KEY `cart_user_id_foreign` (`user_id`),
  CONSTRAINT `cart_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `cart_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` VALUES (18,3,8,2,'M','Xanh');
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Quần áo nam','<p>Quần áo nam đẹp</p>',1,'2024-07-27 14:52:24','2024-07-30 14:08:06'),(2,'Quần áo nữ','Quần áo nữ đẹp',1,'2024-07-27 14:52:24',NULL),(3,'Áo khoác','Áo khoác đẹp',1,'2024-07-27 14:52:24',NULL),(4,'Phụ kiện','Phụ kiện',1,'2024-07-27 14:52:24',NULL),(5,'Giày dép','Giày dép',1,'2024-07-27 14:52:24',NULL);
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comment` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `product_id` bigint unsigned NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `body` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `point` int NOT NULL,
  `images` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `comment_product_id_foreign` (`product_id`),
  KEY `comment_user_id_foreign` (`user_id`),
  CONSTRAINT `comment_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `comment_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` VALUES (1,1,8,NULL,5,NULL,'2024-09-02 02:24:17',NULL),(2,1,8,NULL,5,NULL,'2024-09-02 02:24:28',NULL),(3,1,8,'áo không đúng size',4,NULL,'2024-09-19 03:10:30',NULL);
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
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
-- Table structure for table `images`
--

DROP TABLE IF EXISTS `images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `images` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `product_id` bigint unsigned NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `images_product_id_foreign` (`product_id`),
  CONSTRAINT `images_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `images`
--

LOCK TABLES `images` WRITE;
/*!40000 ALTER TABLE `images` DISABLE KEYS */;
INSERT INTO `images` VALUES (1,1,'vn-11134207-7r98o-ltg8aw6z7xmyfa.jpg','2024-07-27 14:52:24',NULL),(2,1,'vn-11134207-7r98o-ltg8aw6zdjwq49.jpg','2024-07-27 14:52:24',NULL),(3,1,'vn-11134207-7r98o-ltg8aw6z9c7e3a.jpg','2024-07-27 14:52:24',NULL),(4,2,'vn-11134207-7qukw-lk0onee5bmb8cc.jpg','2024-07-27 14:52:24',NULL),(5,2,'vn-11134207-7qukw-lk0onedvetxe4e.jpg','2024-07-27 14:52:24',NULL),(6,3,'vn-11134207-7r98o-lpj8po1wn60lae.jpg','2024-07-27 14:52:24',NULL),(7,3,'vn-11134207-7qukw-lh39bhv08w6r99.jpg','2024-07-27 14:52:24',NULL),(8,4,'vn-11134207-7r98o-lrd3820aga10d5.jpg','2024-07-27 14:52:24',NULL),(9,4,'vn-11134207-7r98o-lrd3820akhqc82.jpg','2024-07-27 14:52:24',NULL),(10,6,'1725682784_66dbd46079975.jpg',NULL,NULL),(11,5,'1725683957_66dbd8f5cac43.jpg',NULL,NULL);
/*!40000 ALTER TABLE `images` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_reset_tokens_table',1),(3,'2019_08_19_000000_create_failed_jobs_table',1),(4,'2019_12_14_000001_create_personal_access_tokens_table',1),(5,'2024_03_18_134308_categories',1),(6,'2024_03_18_135854_product',1),(7,'2024_03_21_020412_create_status',1),(8,'2024_04_05_081707_create_product_detail',1),(9,'2024_04_08_151133_create_images',1),(10,'2024_04_10_092441_create_slide',1),(11,'2024_04_13_035735_create_cart',1),(12,'2024_04_16_125006_create_adress',1),(13,'2024_04_17_025210_create__order',1),(14,'2024_04_19_092728_create_order_detail',1),(15,'2024_05_05_025127_create_comment',1),(16,'2024_05_05_071619_update_table_order',1),(17,'2024_05_06_090549_create_post',1),(18,'2024_05_06_144104_update_user',1),(19,'2024_05_07_143342_create_voucher',1),(20,'2024_05_11_183216_update_order_detail',1),(21,'2024_05_25_142952_update_table_slide',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `code` int NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `totalMoney` double NOT NULL,
  `customerName` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `paymentMethod` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `orderDate` datetime NOT NULL,
  `recivedDate` datetime DEFAULT NULL,
  `cancelReson` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `isCancel` tinyint(1) NOT NULL DEFAULT '0',
  `voucher_id` bigint unsigned DEFAULT NULL,
  `isComment` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `order_user_id_foreign` (`user_id`),
  CONSTRAINT `order_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
INSERT INTO `order` VALUES (1,8041,7,'Đã hủy',138000,'Dũng','0867372693','Hà Nội','Thanh toán khi nhận hàng','2024-07-30 22:17:44',NULL,'ko thích',1,NULL,0),(3,1240,7,'Đã nhận hàng',69000,'Dũng','0867372693','Hà Nội','Thanh toán khi nhận hàng','2024-07-31 09:26:33',NULL,NULL,0,NULL,0),(4,6849,8,'Đã hủy',283000,'Dũng','0867372693','Hà Nội','Thanh toán khi nhận hàng','2024-08-30 14:45:39',NULL,'ko thích',1,NULL,0),(5,3825,8,'Đã nhận hàng',69000,'Dũng','0867372693','Hà Nội','Thanh toán khi nhận hàng','2024-08-30 14:49:41',NULL,NULL,0,NULL,1),(9,3839,8,'Đã nhận hàng',69000,'Dũng','0867372693','Hà Nội','Thanh toán khi nhận hàng','2024-09-02 09:10:07',NULL,NULL,0,NULL,1),(10,714,8,'Đã nhận hàng',69000,'Dũng','0867372693','Hà Nội','Thanh toán khi nhận hàng','2024-09-07 10:31:50',NULL,NULL,0,NULL,1),(12,8581,8,'Đã giao hàng',168000,'Dũng','0867372693','Hà Nội','Thanh toán khi nhận hàng','2024-09-19 10:23:14',NULL,NULL,0,NULL,0),(13,2268,8,'Chờ xác nhận',69000,'Dũng','0867372693','Hà Nội','Thanh toán khi nhận hàng','2024-09-19 11:03:24',NULL,NULL,0,NULL,0);
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orderdetail`
--

DROP TABLE IF EXISTS `orderdetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orderdetail` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `product_id` bigint unsigned NOT NULL,
  `order_id` bigint unsigned NOT NULL,
  `size` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `color` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantity` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double NOT NULL,
  PRIMARY KEY (`id`),
  KEY `orderdetail_order_id_foreign` (`order_id`),
  KEY `orderdetail_product_id_foreign` (`product_id`),
  CONSTRAINT `orderdetail_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `order` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `orderdetail_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderdetail`
--

LOCK TABLES `orderdetail` WRITE;
/*!40000 ALTER TABLE `orderdetail` DISABLE KEYS */;
INSERT INTO `orderdetail` VALUES (1,1,1,'M','Đen','2',69000),(2,1,3,'M','Đỏ','1',69000),(3,2,4,'L','Nâu nhung tăm','1',76000),(4,1,4,'L','Đỏ','3',69000),(5,1,5,'M','Đỏ','1',69000),(6,1,9,'M','Đỏ','1',69000),(7,1,10,'M','Đen','1',69000),(8,3,12,'XL','Xanh','2',89000),(9,1,13,'M','Đỏ','1',69000);
/*!40000 ALTER TABLE `orderdetail` ENABLE KEYS */;
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
-- Table structure for table `post`
--

DROP TABLE IF EXISTS `post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `post` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post`
--

LOCK TABLES `post` WRITE;
/*!40000 ALTER TABLE `post` DISABLE KEYS */;
INSERT INTO `post` VALUES (1,'Quần áo polo mới','<p><i>Hàng rẻ chất lượng</i></p>',1,'1722348876.jpg','quan-ao-polo-moi','2024-07-30 14:14:36','2024-08-30 06:59:14'),(2,'Áo mới 2024','<p>Hàng hàn quốc siêu xịn</p>',1,'1725006239.jpg','ao-moi-2024','2024-08-30 08:23:59',NULL);
/*!40000 ALTER TABLE `post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_detail`
--

DROP TABLE IF EXISTS `product_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_detail` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `product_id` bigint unsigned NOT NULL,
  `color` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `size` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantity` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_detail_product_id_foreign` (`product_id`),
  CONSTRAINT `product_detail_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_detail`
--

LOCK TABLES `product_detail` WRITE;
/*!40000 ALTER TABLE `product_detail` DISABLE KEYS */;
INSERT INTO `product_detail` VALUES (1,1,'Đỏ','M',6,'2024-07-27 14:52:24',NULL),(2,1,'Đỏ','L',10,'2024-07-27 14:52:24',NULL),(3,1,'Đỏ','XL',10,'2024-07-27 14:52:24',NULL),(4,1,'Đen','XL',10,'2024-07-27 14:52:24',NULL),(5,1,'Đen','L',10,'2024-07-27 14:52:24',NULL),(6,1,'Đen','M',11,'2024-07-27 14:52:24',NULL),(7,1,'Trắng','XL',10,'2024-07-27 14:52:24',NULL),(8,1,'Trắng','L',10,'2024-07-27 14:52:24',NULL),(9,1,'Trắng','M',20,'2024-07-27 14:52:24',NULL),(10,1,'Trắng','M',20,'2024-07-27 14:52:24',NULL),(11,2,'Be nhung tăm','M',10,'2024-07-27 14:52:24',NULL),(12,2,'Be nhung tăm','L',10,'2024-07-27 14:52:24',NULL),(13,2,'Be nhung tăm','XL',10,'2024-07-27 14:52:24',NULL),(14,2,'Nâu nhung tăm','M',10,'2024-07-27 14:52:24',NULL),(15,2,'Nâu nhung tăm','L',10,'2024-07-27 14:52:24',NULL),(16,2,'Nâu nhung tăm','XL',10,'2024-07-27 14:52:24',NULL),(17,2,'Đen nhung tăm','XL',10,'2024-07-27 14:52:24',NULL),(18,2,'Đen nhung tăm','L',10,'2024-07-27 14:52:24',NULL),(19,2,'Đen nhung tăm','M',20,'2024-07-27 14:52:24',NULL),(20,3,'Xanh','M',10,'2024-07-27 14:52:24',NULL),(21,3,'Xanh','L',10,'2024-07-27 14:52:24',NULL),(22,3,'Xanh','XL',8,'2024-07-27 14:52:24',NULL),(23,3,'Nâu','XL',10,'2024-07-27 14:52:24',NULL),(24,3,'Nâu','L',10,'2024-07-27 14:52:24',NULL),(25,3,'Nâu','M',10,'2024-07-27 14:52:24',NULL),(26,3,'Đen','XL',10,'2024-07-27 14:52:24',NULL),(27,3,'Đen','L',10,'2024-07-27 14:52:24',NULL),(28,3,'Đen','M',20,'2024-07-27 14:52:24',NULL),(29,4,'Đen','M',10,'2024-07-27 14:52:24',NULL),(30,4,'Đen','L',10,'2024-07-27 14:52:24',NULL),(31,4,'Đen','XL',10,'2024-07-27 14:52:24',NULL),(32,4,'Nâu','XL',10,'2024-07-27 14:52:24',NULL),(33,4,'Nâu','L',10,'2024-07-27 14:52:24',NULL),(34,4,'Nâu','M',10,'2024-07-27 14:52:24',NULL),(35,4,'Hồng','XL',10,'2024-07-27 14:52:24',NULL),(36,4,'Hồng','L',10,'2024-07-27 14:52:24',NULL),(37,4,'Hồng','M',20,'2024-07-27 14:52:24',NULL),(38,6,'Đỏ','L',12,'2024-09-07 04:19:44',NULL),(39,6,'Đỏ','XL',20,'2024-09-07 04:19:44',NULL),(40,6,'Đỏ','XXL',8,'2024-09-07 04:19:44',NULL);
/*!40000 ALTER TABLE `product_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `category_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double NOT NULL,
  `stock` int NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `create_at` datetime NOT NULL,
  `create_by` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `update_at` datetime DEFAULT NULL,
  `update_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `products_category_id_foreign` (`category_id`),
  CONSTRAINT `products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,2,'Áo Thun Soccer Phối Local Brand By UniSpace Our Ground Áo Phông Unisex Pao_STORE','<p>Không còn là những chiếc áo đơn điệu, áo thun đã được nghiên cứu, phát triển và kết hợp với nhiều chất liệu, chủ để khác nhau để cho ra</p>',69000,97,'ao-thun-soccer-phoi-local-brand-by-unispace-our-ground-ao-phong-unisex-pao-store',1,'2024-07-27 21:52:24','admin',NULL,NULL),(2,1,'Áo sơ mi nam nữ tay ngắn chất nhung tăm cao cấp kiểu dáng form rộng, unisex, basic mặc cực đẹp','<p>⭐ Tên sản phẩm : Áo sơ mi nhung tăm tay lỡ nam nữ unisex basic cao cấp ⭐ Chất Liệu: nhung tăm cao cấp</p>',76000,100,'ao-so-mi-nam-nu-tay-ngan-chat-nhung-tam-cao-cap-kieu-dang-form-rong-unisex-basic-mac-cuc-dep',1,'2024-07-27 21:52:24','admin',NULL,NULL),(3,2,'Quần jeans nữ ống loe co giãn, quần bò jean nữ ống đứng rộng suông CẠP CAO cao cấp Hottrend 2023 LUNA T023','<p>Quần jeans nữ ống loe co giãn, quần bò jean nữ ống đứng rộng suông CẠP CAO cao cấp Hottrend 2023 LUNA T023</p>',89000,98,'quan-jeans-nu-ong-loe-co-gian-quan-bo-jean-nu-ong-dung-rong-suong-cap-cao-cao-cap-hottrend-2023-luna-t023',1,'2024-07-27 21:52:24','admin',NULL,NULL),(4,2,'Áo Thun AM Nam Nữ Tay Lỡ Form Rộng ALTHOUGH Ullzang','<p>Chất liệu: thun cotton su 35/65 Áo Size M &lt; 45 kg, dài 63 ngang 47 Áo Size L &lt; 65kg, dài 70 ngang 55</p>',35000,100,'ao-thun-am-nam-nu-tay-lo-form-rong-although-ullzang',1,'2024-07-27 21:52:24','admin',NULL,NULL),(5,1,'áo polo','<p>hàng hot</p>',70000,0,'ao-polo',1,'2024-09-07 11:18:34','admin',NULL,NULL),(6,1,'Áo polo','<p>hàng hot</p>',200000,40,'ao-polo',1,'2024-09-07 11:19:44','admin',NULL,NULL);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `slide`
--

DROP TABLE IF EXISTS `slide`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `slide` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `main_title` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `sub_title` text COLLATE utf8mb4_unicode_ci,
  `status` tinyint(1) NOT NULL,
  `position` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'T',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `slide`
--

LOCK TABLES `slide` WRITE;
/*!40000 ALTER TABLE `slide` DISABLE KEYS */;
/*!40000 ALTER TABLE `slide` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `status`
--

DROP TABLE IF EXISTS `status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `status` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `display` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `status`
--

LOCK TABLES `status` WRITE;
/*!40000 ALTER TABLE `status` DISABLE KEYS */;
/*!40000 ALTER TABLE `status` ENABLE KEYS */;
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
  `role` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'khachhang',
  `phoneNumber` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin','admin',NULL,'$2y$12$8M41y0C00.IWdnyhqCXNQ.RllC/yVFKU.duV8m.9OJ0hAXJW.YbbC',NULL,'2024-07-27 14:52:22',NULL,'admin','123456'),(2,'datle0310','datle0310@gmail.com',NULL,'$2y$12$EcZXk7z/TmyhasOykSbSJODT/40yl6xevkdhcObU95zGvdCBtEo16',NULL,'2024-07-27 14:52:22',NULL,'khachhang','0346531944'),(3,'queanh2004','queanh2004@gmail.com',NULL,'$2y$12$477HM9lTTvC3iLfYWKtaBucN0aCLnZsrImz.Vm6PIhuK8ITuZ6Kmm',NULL,'2024-07-27 14:52:23',NULL,'khachhang','0346531944'),(4,'belien1997','belien1997@gmail.com',NULL,'$2y$12$So7OM1hVde9Vz4oUMyg/ce0szSy4b4aKILDfugjAvIp9ObeGPct5a',NULL,'2024-07-27 14:52:24',NULL,'khachhang','0334582494'),(5,'minhhien1995','minhhien1995@gmail.com',NULL,'$2y$12$vJDfYf0GWKnXMsfMpZFuGu7otR/rhyCoSd93jyppNMMQTi.cBLBs6',NULL,'2024-07-27 14:52:24',NULL,'khachhang','0334582494'),(6,'andung','txo432@gmail.com',NULL,'$2y$12$N2sQJBBG1CpCa5ixWyKrmOJIzvswntQabnFEGmgyBZtx81CQ7u3q2',NULL,'2024-07-28 09:54:07','2024-07-28 09:54:07','khachhang','0867372693'),(7,'nguyenandung','andungkoi@gmail.com',NULL,'$2y$12$rsJA7gQacfkXZHwEMvTkXuO8EEv31Jf1KwfC29hnADrAK48BS83Q.',NULL,'2024-07-30 13:30:55','2024-07-30 13:30:55','khachhang','0877095349'),(8,'andung123','txo234@gmail.com',NULL,'$2y$12$YFcEV67y6jvDjdPIapzBzeFZSrNhasctR30crdLGRL4xeteRxJRuy',NULL,'2024-08-30 04:43:36','2024-08-30 04:43:36','khachhang','0877094953'),(9,'andungnguyen','txo123@gmail.com',NULL,'$2y$12$4RzwaMqij6iUhXF80VWqRO.aBY2pto8tp9x24NZD8zOZX9czhPCiO',NULL,'2024-09-07 04:05:25','2024-09-07 04:05:25','khachhang','0877095345');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `voucher`
--

DROP TABLE IF EXISTS `voucher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `voucher` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `dongiatoithieu` double NOT NULL DEFAULT '0',
  `ma` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ngaytao` datetime NOT NULL,
  `ngayhethan` datetime NOT NULL,
  `sotiengiam` double NOT NULL,
  `solansudung` int NOT NULL,
  `solandadung` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `voucher`
--

LOCK TABLES `voucher` WRITE;
/*!40000 ALTER TABLE `voucher` DISABLE KEYS */;
INSERT INTO `voucher` VALUES (1,20000,'khuyenmai25%','2024-09-02 08:51:13','2024-09-19 08:50:00',5000,2,0),(2,70000,'khuyenmai10k','2024-09-18 12:39:49','2024-09-20 12:39:00',10000,2,1);
/*!40000 ALTER TABLE `voucher` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-09-19 11:59:58

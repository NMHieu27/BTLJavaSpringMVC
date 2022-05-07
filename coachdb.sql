CREATE DATABASE  IF NOT EXISTS `coachdb` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `coachdb`;
-- MySQL dump 10.13  Distrib 8.0.27, for Win64 (x86_64)
--
-- Host: localhost    Database: coachdb
-- ------------------------------------------------------
-- Server version	8.0.27

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
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `numberofseat` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'Giường nằm 45 chỗ',45),(2,'Ngồi 45 chỗ',45),(3,'Limousine 9 chỗ',9),(4,'Giường nằm 40 chỗ',40);
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coach`
--

DROP TABLE IF EXISTS `coach`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `coach` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `licenseplates` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `price` decimal(10,0) NOT NULL,
  `describe` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `image` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `active` bit(1) DEFAULT b'1',
  `category_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`),
  UNIQUE KEY `licenseplates_UNIQUE` (`licenseplates`),
  KEY `fk_coach_category_idx` (`category_id`),
  CONSTRAINT `fk_coach_category` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coach`
--

LOCK TABLES `coach` WRITE;
/*!40000 ALTER TABLE `coach` DISABLE KEYS */;
INSERT INTO `coach` VALUES (1,'Xe cẩm tú cầu','75A-145.19',350000,'có hệ thống máy lạnh, điều hòa giường nằm','https://res.cloudinary.com/ddphodfop/image/upload/v1651883889/xkldiuykfyqhq94iin2n.jpg',_binary '',1),(2,'Xe hoa hồng','51F-888.12',170000,'Nhiều hoa hồng','https://res.cloudinary.com/ddphodfop/image/upload/v1651883889/xkldiuykfyqhq94iin2n.jpg',_binary '',3),(3,'Xe anh Bo','52B-696.69',300000,'Xe chuyên chạy những đoạn đường ngắn hoặc đi xa','https://res.cloudinary.com/ddphodfop/image/upload/v1651883889/xkldiuykfyqhq94iin2n.jpg',_binary '',4),(4,'Xe hoa hồng trắng','86F-1258.65',280000,'Khác xe hoa hồng đỏ','https://res.cloudinary.com/ddphodfop/image/upload/v1651883889/xkldiuykfyqhq94iin2n.jpg',_binary '',2),(5,'Xe hướng dương','25G-7568.56',33000,'Xe này hướng về phái mặt trời','https://res.cloudinary.com/ddphodfop/image/upload/v1651883889/xkldiuykfyqhq94iin2n.jpg',_binary '',1);
/*!40000 ALTER TABLE `coach` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coaches`
--

DROP TABLE IF EXISTS `coaches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `coaches` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `start_time` datetime NOT NULL,
  `end_time` datetime NOT NULL,
  `empty_seats` int NOT NULL,
  `describe` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `unitprice` decimal(10,0) DEFAULT NULL,
  `pricechange` decimal(10,0) DEFAULT NULL,
  `is_started` bit(1) DEFAULT b'0',
  `is_canceled` bit(1) DEFAULT b'0',
  `route_id` int NOT NULL,
  `driver_id` int NOT NULL,
  `coach_id` int NOT NULL,
  `pricechange_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_driver_coaches_user_idx` (`driver_id`),
  KEY `fk_coaches_coach_idx` (`coach_id`),
  KEY `fk_coaches_route_idx` (`route_id`),
  KEY `fk_coaches_pricechange_idx` (`pricechange_id`),
  CONSTRAINT `fk_coaches_coach` FOREIGN KEY (`coach_id`) REFERENCES `coach` (`id`),
  CONSTRAINT `fk_coaches_pricechange` FOREIGN KEY (`pricechange_id`) REFERENCES `pricechange` (`id`),
  CONSTRAINT `fk_coaches_route` FOREIGN KEY (`route_id`) REFERENCES `route` (`id`),
  CONSTRAINT `fk_driver_coaches_user` FOREIGN KEY (`driver_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coaches`
--

LOCK TABLES `coaches` WRITE;
/*!40000 ALTER TABLE `coaches` DISABLE KEYS */;
INSERT INTO `coaches` VALUES (1,'Xe anh Quốc ','2022-04-29 09:00:00','2022-04-30 12:30:00',43,NULL,850000,850000,_binary '\0',_binary '\0',1,4,1,1),(2,'b','2022-05-01 08:00:00','2022-05-01 16:45:00',8,NULL,270000,270000,_binary '\0',_binary '\0',4,5,2,1),(3,'c','2022-05-15 09:00:00','2022-05-27 19:00:00',2,NULL,900000,670000,_binary '\0',_binary '\0',3,4,3,2),(4,'d','2022-04-20 10:30:00','2022-04-20 15:00:00',24,NULL,270000,270000,_binary '\0',_binary '\0',4,5,2,1),(5,'d','2022-04-20 10:30:00','2022-04-20 15:00:00',7,NULL,270000,270000,_binary '\0',_binary '\0',4,5,2,1),(6,'Hồ Chí Minh - Đà Lạt','2022-05-08 06:00:00','2022-05-09 20:00:00',41,'',550000,550000,_binary '\0',_binary '\0',2,4,1,1),(7,'Hồ Chí Minh - Đà Lạt','2022-05-08 06:00:00','2022-05-08 19:00:00',31,NULL,550000,550000,_binary '\0',_binary '\0',2,4,1,1);
/*!40000 ALTER TABLE `coaches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `created_date` datetime DEFAULT NULL,
  `user_id` int NOT NULL,
  `coaches_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_comment_user_idx` (`user_id`),
  KEY `fk_comment_coaches_idx` (`coaches_id`),
  CONSTRAINT `fk_comment_coaches` FOREIGN KEY (`coaches_id`) REFERENCES `coaches` (`id`),
  CONSTRAINT `fk_comment_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` VALUES (1,'Chuyến xe này đi rất tuyệt vời, bác tài chạy xe rất êm','2022-04-26 00:00:00',6,4),(2,'Chị hướng dẫn hơi gắt gỏng','2022-04-27 00:00:00',7,4),(3,'Xe chạy ổn','2022-05-05 16:16:06',6,1),(4,'Hay quá ta','2022-05-05 22:42:34',6,5),(5,'còn chạy không?\n','2022-05-06 01:39:03',6,1),(6,'testing adding comment','2022-05-07 09:18:20',3,3),(7,'testing add this comment','2022-05-07 09:22:20',3,3),(8,'this is great','2022-05-07 09:36:54',10,3),(9,'Testing redirect','2022-05-07 10:20:37',10,3);
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `location`
--

DROP TABLE IF EXISTS `location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `location` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `location`
--

LOCK TABLES `location` WRITE;
/*!40000 ALTER TABLE `location` DISABLE KEYS */;
INSERT INTO `location` VALUES (1,'TP Hồ Chí Minh'),(2,'Đà Lạt'),(3,'Vũng Tàu'),(4,'Hà Nội'),(5,'Khánh Hòa'),(6,'Thừa Thiên - Huế');
/*!40000 ALTER TABLE `location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pricechange`
--

DROP TABLE IF EXISTS `pricechange`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pricechange` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `value` decimal(10,3) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pricechange`
--

LOCK TABLES `pricechange` WRITE;
/*!40000 ALTER TABLE `pricechange` DISABLE KEYS */;
INSERT INTO `pricechange` VALUES (1,'Giá gốc',0.000),(2,'Giảm 30%',-0.300),(3,'Tăng 10%',0.100),(4,'Giảm 30/4',0.150),(5,'Giảm giữa tháng',-0.150);
/*!40000 ALTER TABLE `pricechange` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `route`
--

DROP TABLE IF EXISTS `route`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `route` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `price` decimal(10,0) NOT NULL,
  `destination_id` int NOT NULL,
  `startingpoint_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_route_starting_station_idx` (`startingpoint_id`),
  KEY `fk_route_destination_station_idx` (`destination_id`),
  CONSTRAINT `fk_route_destination_station` FOREIGN KEY (`destination_id`) REFERENCES `station` (`id`),
  CONSTRAINT `fk_route_startingpoint_station` FOREIGN KEY (`startingpoint_id`) REFERENCES `station` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `route`
--

LOCK TABLES `route` WRITE;
/*!40000 ALTER TABLE `route` DISABLE KEYS */;
INSERT INTO `route` VALUES (1,'Hồ Chí Minh - Hà Nội',500000,4,1),(2,'Hồ Chí Minh - Đà Lạt',200000,6,1),(3,'Hà Nội - Nha Trang',600000,9,4),(4,'Nha Trang - Đà Lạt',100000,7,9);
/*!40000 ALTER TABLE `route` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `station`
--

DROP TABLE IF EXISTS `station`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `station` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `address` varchar(100) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `location_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_station_location_idx` (`location_id`),
  CONSTRAINT `fk_station_location` FOREIGN KEY (`location_id`) REFERENCES `location` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `station`
--

LOCK TABLES `station` WRITE;
/*!40000 ALTER TABLE `station` DISABLE KEYS */;
INSERT INTO `station` VALUES (1,'Quận 1','50 Nam Kỳ Khởi Nghĩa',1),(2,'Củ Chi','68 Củ Chi',1),(3,'Gò Vấp','58 Quang Trung',1),(4,'Hoàn Kiếm','12/6/7Hồ Hoàn Kiếm',4),(5,'Ba Đình','Ngã 4 Ba Đình',4),(6,'Di Linh','63 Chùa Đi Linh',2),(7,'Bảo Lộc','89/8 Đèo Bảo Lộc',2),(8,'Lâm Hà','54/23/5 Lâm Hà',2),(9,'Nha Trang','68/97 Gần biển ',5);
/*!40000 ALTER TABLE `station` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ticket`
--

DROP TABLE IF EXISTS `ticket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ticket` (
  `id` int NOT NULL AUTO_INCREMENT,
  `created_date` datetime DEFAULT NULL,
  `user_id` int NOT NULL,
  `coaches_id` int NOT NULL,
  `price` decimal(10,0) DEFAULT NULL,
  `phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `fullname` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `email` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_ticket_user_idx` (`user_id`),
  KEY `fk_ticket_coaches_idx` (`coaches_id`),
  CONSTRAINT `fk_ticket_coaches` FOREIGN KEY (`coaches_id`) REFERENCES `coaches` (`id`),
  CONSTRAINT `fk_ticket_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticket`
--

LOCK TABLES `ticket` WRITE;
/*!40000 ALTER TABLE `ticket` DISABLE KEYS */;
INSERT INTO `ticket` VALUES (7,'2022-05-06 00:26:28',6,4,250000,'0123456789','Mạnh Linh','123@gmail.com'),(8,'2022-05-06 00:42:02',6,4,250000,'0123456789','Mạnh Linh','123@gmail.com'),(10,'2022-05-06 00:45:09',6,1,520000,'0343219182','Bùi Mạnh Linh','duigaquay512@gmail.com'),(11,'2022-05-06 01:15:36',6,1,520000,'0343219182','Bùi Mạnh Linh','1951052099linh@gmail.com'),(12,'2022-05-06 02:13:30',6,4,640000,'0343219182','Bùi Mạnh Linh','oustudents@ou.edu.vn'),(13,'2022-05-06 02:16:21',6,4,640000,'0343219182','Bùi Mạnh Linh','1951052099Linh@ou.edu.vn'),(14,'2022-05-06 02:17:49',6,4,640000,'0343219182','Bùi Mạnh Linh','1951052099Linh@ou.edu.vn'),(15,'2022-05-06 02:22:44',6,4,640000,'0343219182','Bùi Mạnh Linh','duigaquay279@gmail.com'),(16,'2022-05-06 02:27:59',6,4,640000,'0343219182','Bùi Mạnh Linh','duigaquay279@gmail.com'),(17,'2022-05-06 02:29:16',6,4,640000,'0343219182','Bùi Mạnh Linh','1951052099Linh@ou.edu.vn'),(18,'2022-05-06 02:31:46',6,4,640000,'0343219182','Bùi Mạnh Linh','duigaquay279@gmail.com'),(19,'2022-05-06 02:32:50',6,4,640000,'0343219182','Bùi Mạnh Linh','duigaquay279@gmail.com'),(20,'2022-05-06 03:10:17',6,4,640000,'0343219182','Bùi Mạnh Linh','duigaquay512@gmail.com'),(21,'2022-05-06 15:31:05',6,3,750000,'0343219182','Bùi Mạnh Linh','duigaquay512@gmail.com'),(22,'2022-05-06 15:54:31',6,4,250000,'0123456789','Mạnh Linh','123@gmail.com'),(23,'2022-05-06 16:07:27',6,3,750000,'0343219182','Bùi Mạnh Linh','duigaquay279@gmail.com'),(24,'2022-05-06 16:22:24',6,4,250000,'0123456789','Mạnh Linh','123@gmail.com'),(25,'2022-05-06 16:34:17',6,4,250000,'0123456789','Mạnh Linh','123@gmail.com'),(26,'2022-05-06 16:38:54',6,4,250000,'0123456789','Mạnh Linh','123@gmail.com'),(27,'2022-05-06 16:38:56',6,4,250000,'0123456789','Mạnh Linh','123@gmail.com'),(28,'2022-05-06 16:38:57',6,4,250000,'0123456789','Mạnh Linh','123@gmail.com'),(29,'2022-05-06 16:52:32',6,4,250000,'0123456789','Mạnh Linh','123@gmail.com'),(30,'2022-05-06 16:52:33',6,4,250000,'0123456789','Mạnh Linh','123@gmail.com'),(31,'2022-05-06 16:52:34',6,4,250000,'0123456789','Mạnh Linh','123@gmail.com'),(32,'2022-05-06 16:53:22',6,4,250000,'0123456789','Mạnh Linh','123@gmail.com'),(33,'2022-05-06 16:53:23',6,4,250000,'0123456789','Mạnh Linh','123@gmail.com'),(34,'2022-05-06 16:53:24',6,4,250000,'0123456789','Mạnh Linh','123@gmail.com'),(35,'2022-05-06 18:05:46',6,4,250000,'0123456789','Mạnh Linh','123@gmail.com'),(36,'2022-05-06 18:05:47',6,4,250000,'0123456789','Mạnh Linh','123@gmail.com'),(37,'2022-05-06 21:16:00',6,3,750000,'0343219182','Bùi Mạnh Linh','1951052099'),(38,'2022-05-06 21:30:10',6,3,750000,'0343219182','Bùi Mạnh Linh','duigaquay512@gmail.com'),(39,'2022-05-06 21:30:11',6,3,750000,'0343219182','Bùi Mạnh Linh','duigaquay512@gmail.com'),(40,'2022-05-06 21:44:03',6,3,750000,'0343219182','Bùi Mạnh Linh','oustudents@ou.edu.vn'),(41,'2022-05-06 21:44:03',6,3,750000,'0343219182','Bùi Mạnh Linh','oustudents@ou.edu.vn'),(42,'2022-05-06 21:44:41',6,3,750000,'0343219182','Bùi Mạnh Linh','oustudents@ou.edu.vn'),(43,'2022-05-06 21:44:41',6,3,750000,'0343219182','Bùi Mạnh Linh','oustudents@ou.edu.vn'),(44,'2022-05-06 22:22:59',6,3,750000,'0343219182','Bùi Mạnh Linh','oustudents@ou.edu.vn'),(45,'2022-05-06 22:23:02',6,3,750000,'0343219182','Bùi Mạnh Linh','oustudents@ou.edu.vn'),(46,'2022-05-06 22:23:03',6,3,750000,'0343219182','Bùi Mạnh Linh','oustudents@ou.edu.vn'),(47,'2022-05-06 22:23:03',6,3,750000,'0343219182','Bùi Mạnh Linh','oustudents@ou.edu.vn'),(48,'2022-05-07 04:02:09',6,3,750000,'0343219182','Bùi Mạnh Linh','duigaquay279@gmail.com'),(49,'2022-05-07 04:02:11',6,3,750000,'0343219182','Bùi Mạnh Linh','duigaquay279@gmail.com'),(50,'2022-05-07 04:06:45',6,3,750000,'0343219182','Bùi Mạnh Linh','duigaquay279@gmail.com'),(51,'2022-05-07 07:47:45',6,3,750000,'0343219182','Bùi Mạnh Linh','1951052099Linh@ou.edu.vn'),(52,'2022-05-07 07:47:46',6,3,750000,'0343219182','Bùi Mạnh Linh','1951052099Linh@ou.edu.vn'),(53,'2022-05-07 07:47:47',6,3,750000,'0343219182','Bùi Mạnh Linh','1951052099Linh@ou.edu.vn'),(54,'2022-05-07 07:59:50',6,3,750000,'0343219182','Bùi Mạnh Linh','duigaquay512@gmail.com'),(55,'2022-05-07 13:29:11',6,3,750000,'0343219182','Bùi Mạnh Linh','duigaquay512@gmail.com'),(56,'2022-05-07 13:51:23',6,7,550000,'0343219182','Nam Lươn','oustudents@ou.edu.vn'),(57,'2022-05-07 14:37:44',10,7,550000,'0343219182','Bùi Mạnh Linh','duigaquay512@gmail.com'),(58,'2022-05-07 14:38:29',1,7,550000,'0343219182','Bùi Mạnh Linh','duigaquay512@gmail.com'),(60,'2022-05-07 14:51:15',2,6,550000,'0343219182','Nam Lươn','duigaquay512@gmail.com'),(61,'2022-05-07 15:57:35',10,7,550000,'0343219182','Bùi Mạnh Linh','duigaquay512@gmail.com'),(62,'2022-05-07 16:06:22',10,7,550000,'0343219182','Bùi Mạnh Linh','1951052099Linh@ou.edu.vn'),(63,'2022-05-07 16:11:33',10,7,550000,'0343219182','Bùi Mạnh Linh','1951052099Linh@ou.edu.vn'),(64,'2022-05-07 16:18:59',10,7,550000,'0343219182','Bùi Mạnh Linh','oustudents@ou.edu.vn'),(65,'2022-05-07 17:09:26',1,6,550000,'0343219182','Bùi Mạnh Linh','oustudents@ou.edu.vn'),(66,'2022-05-07 17:12:37',1,7,550000,'0343219182','Nam Lươn','oustudents@ou.edu.vn'),(67,'2022-05-07 17:25:03',1,7,550000,'0343219182','Bùi Mạnh Linh','1951052055hieu@ou.edu.vn'),(68,'2022-05-07 17:25:04',1,7,550000,'0343219182','Bùi Mạnh Linh','1951052055hieu@ou.edu.vn'),(69,'2022-05-07 17:29:59',1,7,550000,'0343219182','Bùi Mạnh Linh','1951052055hieu@ou.edu.vn'),(70,'2022-05-07 19:16:46',1,7,550000,'0343219182','Nam Lươn','1951052055hieu@ou.edu.vn'),(71,'2022-05-07 22:15:54',1,7,550000,'0343219182','Bùi Mạnh Linh','1951052055hieu@ou.edu.vn'),(72,'2022-05-07 22:25:40',1,7,550000,'0343219182','Bùi Mạnh Linh','duigaquay279@gmail.com'),(73,'2022-05-07 22:27:42',1,6,550000,'0343219182','Bùi Mạnh Linh','duigaquay279@gmail.com'),(74,'2022-05-07 22:27:43',1,6,550000,'0343219182','Bùi Mạnh Linh','duigaquay279@gmail.com'),(75,'2022-05-07 22:31:06',1,7,550000,'0343219182','Nam Lươn','duigaquay279@gmail.com');
/*!40000 ALTER TABLE `ticket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `phone` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `fullname` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `join_date` datetime DEFAULT NULL,
  `user_role` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `avatar` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `active` bit(1) DEFAULT b'1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username_UNIQUE` (`username`),
  UNIQUE KEY `phone_UNIQUE` (`phone`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'hieu','$2a$10$Nd9H.IFDmEuCYfxEvXRIY.lJ3ajQpUHh/p52QY/VbYds5ddafi2pm','1234567890','Minh Hiếu',NULL,'2022-05-07 07:36:45','ROLE_ADMIN','https://res.cloudinary.com/ddphodfop/image/upload/v1651883889/xkldiuykfyqhq94iin2n.jpg',_binary ''),(2,'lhn','$2a$10$Nd9H.IFDmEuCYfxEvXRIY.lJ3ajQpUHh/p52QY/VbYds5ddafi2pm','2345678901','Nam Lươn','Nam cute','2022-05-07 07:36:45','ROLE_STAFF','https://res.cloudinary.com/ddphodfop/image/upload/v1651883889/xkldiuykfyqhq94iin2n.jpg',_binary ''),(3,'staff','$2a$10$Nd9H.IFDmEuCYfxEvXRIY.lJ3ajQpUHh/p52QY/VbYds5ddafi2pm','6789012345','staff',NULL,'2022-05-07 07:36:45','ROLE_STAFF','https://res.cloudinary.com/ddphodfop/image/upload/v1651883889/xkldiuykfyqhq94iin2n.jpg',_binary ''),(4,'nhn','$2a$10$Nd9H.IFDmEuCYfxEvXRIY.lJ3ajQpUHh/p52QY/VbYds5ddafi2pm','3456789012','Nam Nguyễn',NULL,'2022-05-07 07:36:45','ROLE_DRIVER','https://res.cloudinary.com/ddphodfop/image/upload/v1651883889/xkldiuykfyqhq94iin2n.jpg',_binary ''),(5,'driver','$2a$10$Nd9H.IFDmEuCYfxEvXRIY.lJ3ajQpUHh/p52QY/VbYds5ddafi2pm','7890123456','driver',NULL,'2022-05-07 07:36:45','ROLE_DRIVER','https://res.cloudinary.com/ddphodfop/image/upload/v1651883889/xkldiuykfyqhq94iin2n.jpg',_binary ''),(6,'Linh','$2a$10$Nd9H.IFDmEuCYfxEvXRIY.lJ3ajQpUHh/p52QY/VbYds5ddafi2pm','0123456789','Mạnh Linh',NULL,'2022-05-07 07:36:45','ROLE_USER','https://res.cloudinary.com/ddphodfop/image/upload/v1651883889/xkldiuykfyqhq94iin2n.jpg',_binary ''),(7,'user','$2a$10$Nd9H.IFDmEuCYfxEvXRIY.lJ3ajQpUHh/p52QY/VbYds5ddafi2pm','4567980123','User',NULL,'2022-05-07 07:36:45','ROLE_USER','https://res.cloudinary.com/ddphodfop/image/upload/v1651883889/xkldiuykfyqhq94iin2n.jpg',_binary ''),(8,'user1','$2a$10$Nd9H.IFDmEuCYfxEvXRIY.lJ3ajQpUHh/p52QY/VbYds5ddafi2pm','567890123','user1',NULL,'2022-05-07 07:36:45','ROLE_USER','https://res.cloudinary.com/ddphodfop/image/upload/v1651883889/xkldiuykfyqhq94iin2n.jpg',_binary ''),(9,'user2','$2a$10$Nd9H.IFDmEuCYfxEvXRIY.lJ3ajQpUHh/p52QY/VbYds5ddafi2pm','8901234567','User2',NULL,'2022-05-07 07:36:45','ROLE_USER','https://res.cloudinary.com/ddphodfop/image/upload/v1651883889/xkldiuykfyqhq94iin2n.jpg',_binary ''),(10,'user3','$2a$10$Nd9H.IFDmEuCYfxEvXRIY.lJ3ajQpUHh/p52QY/VbYds5ddafi2pm','0343219182','Bùi Mạnh Linh',NULL,'2022-05-07 07:36:45','ROLE_USER','https://res.cloudinary.com/ddphodfop/image/upload/v1651883889/xkldiuykfyqhq94iin2n.jpg',_binary '');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-05-07 22:54:08

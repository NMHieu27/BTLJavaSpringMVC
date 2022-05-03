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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coach`
--

LOCK TABLES `coach` WRITE;
/*!40000 ALTER TABLE `coach` DISABLE KEYS */;
INSERT INTO `coach` VALUES (1,'Xe cẩm tú cầu','75A-145.19',350000,NULL,NULL,_binary '',1),(2,'Xe hoa hồng','51F-888.12',170000,NULL,NULL,_binary '',3),(3,'Xe anh Bo','52B-696.69',300000,NULL,NULL,_binary '',4),(4,'Xe hoa hồng trắng','86F-1258.65',280000,NULL,NULL,_binary '',2),(5,'Xe hướng dương','25G-7568.56',33000,NULL,NULL,_binary '',1),(7,'Hoa Bồ Công Anh','H77.811.DF66',100000,'Dịch vụ tuyệt vời','https://res.cloudinary.com/ddphodfop/image/upload/v1651522066/fldofthgf4rszaiuaqdp.png',_binary '',3),(8,'Cánh bứm dối gian','N76.990.112',560000,'Quá đã','https://res.cloudinary.com/ddphodfop/image/upload/v1651522140/d0r4pda7pa12old8yohs.png',_binary '\0',3);
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coaches`
--

LOCK TABLES `coaches` WRITE;
/*!40000 ALTER TABLE `coaches` DISABLE KEYS */;
INSERT INTO `coaches` VALUES (1,'a','2022-04-29 09:00:00','2022-04-30 12:30:00',43,NULL,NULL,NULL,_binary '\0',_binary '\0',1,4,1,1),(2,'b','2022-05-01 08:00:00','2022-05-01 16:45:00',8,NULL,NULL,NULL,_binary '\0',_binary '\0',4,5,2,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `location`
--

LOCK TABLES `location` WRITE;
/*!40000 ALTER TABLE `location` DISABLE KEYS */;
INSERT INTO `location` VALUES (1,'TP Hồ Chí Minh'),(2,'Đà Lạt'),(3,'Vũng Tàu'),(4,'Hà Nội'),(5,'Khánh Hòa');
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pricechange`
--

LOCK TABLES `pricechange` WRITE;
/*!40000 ALTER TABLE `pricechange` DISABLE KEYS */;
INSERT INTO `pricechange` VALUES (1,'Giá gốc',0.000),(2,'Giảm 30%',-0.400),(3,'Tăng 10%',0.400),(4,'Giảm 30/4',0.150),(5,'Giảm giữa tháng',-0.150),(7,'Giảm 100%',1.000),(8,'Giảm 60%',0.600),(9,'Giảm 100% 3',0.770);
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
  `startingpoint_id` int NOT NULL,
  `destination_id` int NOT NULL,
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
INSERT INTO `route` VALUES (1,'Hồ Chí Minh - Hà Nội',500000,1,4),(2,'Hồ Chí Minh - Đà Lạt',200000,1,6),(3,'Hà Nội - Nha Trang',600000,4,9),(4,'Nha Trang - Đà Lạt',100000,9,7);
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
  `address` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
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
INSERT INTO `station` VALUES (1,'Quận 1',NULL,1),(2,'Củ Chi',NULL,1),(3,'Gò Vấp',NULL,1),(4,'Hoàn Kiếm',NULL,4),(5,'Ba Đình',NULL,4),(6,'Di Linh',NULL,2),(7,'Bảo Lộc',NULL,2),(8,'Lâm Hà',NULL,2),(9,'Nha Trang',NULL,5);
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
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `fullname` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `phone` varchar(10) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `price` decimal(10,0) DEFAULT NULL,
  `user_id` int NOT NULL,
  `coaches_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_ticket_user_idx` (`user_id`),
  KEY `fk_ticket_coaches_idx` (`coaches_id`),
  CONSTRAINT `fk_ticket_coaches` FOREIGN KEY (`coaches_id`) REFERENCES `coaches` (`id`),
  CONSTRAINT `fk_ticket_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticket`
--

LOCK TABLES `ticket` WRITE;
/*!40000 ALTER TABLE `ticket` DISABLE KEYS */;
INSERT INTO `ticket` VALUES (1,NULL,'','','',NULL,6,1),(2,NULL,'','','',NULL,8,1),(3,NULL,'','','',NULL,7,2);
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
  `password` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `phone` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `fullname` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `gender` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci DEFAULT 'Nam',
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `join_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `user_role` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `avatar` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `active` bit(1) DEFAULT b'1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username_UNIQUE` (`username`),
  UNIQUE KEY `phone_UNIQUE` (`phone`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'hieu','1','1234567890','Minh Hiếu','Nam',NULL,NULL,'ROLE_ADMIN',NULL,_binary ''),(2,'lhn','1','2345678901','Nam Lươn','Nam',NULL,NULL,'ROLE_ADMIN',NULL,_binary ''),(3,'staff','1','6789012345','staff','Nam',NULL,NULL,'ROLE_ADMIN',NULL,_binary ''),(4,'nhn','1','3456789012','Nam Nguyễn','Nam',NULL,NULL,'ROLE_STAFF',NULL,_binary ''),(5,'driver','1','7890123456','driver','Nam',NULL,NULL,'ROLE_STAFF',NULL,_binary ''),(6,'Linh','1','0123456789','Mạnh Linh','Nam',NULL,NULL,'ROLE_DRIVER',NULL,_binary ''),(7,'user','1','4567980123','User','Nam',NULL,NULL,'ROLE_USER',NULL,_binary ''),(8,'user1','1','567890123','user1','Nữ',NULL,NULL,'ROLE_USER',NULL,_binary ''),(9,'user2','1','8901234567','User2','Nữ',NULL,NULL,'ROLE_DRIVER',NULL,_binary '\0'),(11,'nemnem','123','3214523425','Một lằn','Nam','TPHCM',NULL,'ROLE_DRIVER','https://res.cloudinary.com/ddphodfop/image/upload/v1651590164/natgauwbpsq1u1vlneqb.gif',_binary ''),(12,'BML','12345','1231234321','Bùi Mạnh Linh','Nam','TPHCM',NULL,'ROLE_DRIVER','https://res.cloudinary.com/ddphodfop/image/upload/v1651590218/yh6wjzmfqzjdu0grywi7.png',_binary '\0'),(13,'aaaa','aaaa','2222222','Linh','Nam','TPHCM','2022-05-03 22:15:56','ROLE_DRIVER','https://res.cloudinary.com/ddphodfop/image/upload/v1651590957/rmptkd3imjocezjrtrsw.png',_binary '');
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

-- Dump completed on 2022-05-04  1:46:19

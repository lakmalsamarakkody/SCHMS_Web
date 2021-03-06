-- MariaDB dump 10.17  Distrib 10.4.11-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: schms
-- ------------------------------------------------------
-- Server version	10.4.11-MariaDB

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
-- Table structure for table `backup`
--

DROP TABLE IF EXISTS `backup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `backup` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_time` datetime NOT NULL,
  `file_size` int(5) DEFAULT NULL,
  `created_on` datetime NOT NULL,
  `updated_on` datetime NOT NULL,
  `deleted_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `backup`
--

LOCK TABLES `backup` WRITE;
/*!40000 ALTER TABLE `backup` DISABLE KEYS */;
INSERT INTO `backup` VALUES (2,'DB_20191202_035747.sql','Initial','2019-12-02 03:57:47',76,'2019-12-02 03:57:47','2019-12-02 03:57:47',NULL),(3,'DB_20191206_065101.sql','After Permission View UI implementation','2019-12-06 06:51:01',76,'2019-12-06 06:51:01','2019-12-06 06:51:01',NULL),(4,'DB_20200102_165617.sql','After User creation implementation','2020-01-02 16:56:17',76,'2020-01-02 16:56:17','2020-01-02 16:58:23','2020-01-02 16:58:23'),(5,'DB_20200102_165852.sql','After User Creation Finished','2020-01-02 16:58:52',76,'2020-01-02 16:58:52','2020-01-02 16:58:52',NULL);
/*!40000 ALTER TABLE `backup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `class`
--

DROP TABLE IF EXISTS `class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `class` (
  `id` int(3) NOT NULL AUTO_INCREMENT,
  `grade_id` int(2) NOT NULL,
  `staff_id` int(6) DEFAULT NULL,
  `name` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_on` datetime NOT NULL,
  `updated_on` datetime NOT NULL,
  `deleted_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `grade_id` (`grade_id`,`name`),
  UNIQUE KEY `staff_id` (`staff_id`),
  CONSTRAINT `class_ibfk_1` FOREIGN KEY (`grade_id`) REFERENCES `grade` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `class_ibfk_2` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `class`
--

LOCK TABLES `class` WRITE;
/*!40000 ALTER TABLE `class` DISABLE KEYS */;
INSERT INTO `class` VALUES (15,1,7,'A','2019-09-23 01:37:15','2019-12-04 19:13:59',NULL),(16,3,1,'A','2019-09-23 01:40:39','2020-01-01 05:13:04',NULL),(17,5,NULL,'A','2019-09-23 05:12:49','2019-09-23 05:12:49',NULL),(18,4,NULL,'A','2019-09-23 05:15:05','2019-09-23 05:15:05',NULL),(21,6,NULL,'A','2019-10-01 19:17:17','2020-01-01 05:13:04',NULL),(34,7,NULL,'A','2019-12-01 14:17:41','2019-12-01 14:17:41',NULL),(35,2,NULL,'A','2019-12-01 14:21:26','2019-12-01 14:21:26',NULL),(36,2,NULL,'B','2019-12-01 14:21:35','2019-12-01 14:21:35',NULL),(37,3,NULL,'B','2019-12-01 14:21:43','2019-12-01 14:21:43',NULL),(38,4,NULL,'B','2019-12-01 14:28:52','2019-12-01 14:28:52',NULL),(39,5,NULL,'B','2019-12-01 14:57:16','2019-12-01 14:57:16',NULL),(40,7,NULL,'B','2019-12-01 14:57:44','2019-12-01 14:57:44',NULL),(41,8,NULL,'A','2019-12-01 14:58:03','2019-12-01 14:58:03',NULL),(42,8,NULL,'B','2019-12-01 14:58:26','2019-12-01 14:58:26',NULL),(47,10,NULL,'A','2019-12-01 14:59:14','2019-12-10 20:10:48',NULL),(52,9,NULL,'A','2019-12-07 02:34:07','2019-12-07 02:34:07',NULL),(53,9,NULL,'B','2019-12-07 02:34:14','2019-12-07 02:34:14',NULL),(54,11,3,'A','2019-12-07 02:36:52','2019-12-10 20:11:05',NULL),(55,11,NULL,'B','2019-12-07 02:38:30','2019-12-10 20:10:27',NULL);
/*!40000 ALTER TABLE `class` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `class_timetable`
--

DROP TABLE IF EXISTS `class_timetable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `class_timetable` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `class_id` int(3) NOT NULL,
  `day` int(1) NOT NULL,
  `period` int(1) NOT NULL,
  `subject_id` int(3) NOT NULL,
  `staff_id` int(6) DEFAULT NULL,
  `created_on` datetime NOT NULL,
  `updated_on` datetime NOT NULL,
  `deleted_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `class_id` (`class_id`),
  KEY `staff_id` (`staff_id`),
  KEY `subject_id` (`subject_id`),
  CONSTRAINT `class_timetable_ibfk_1` FOREIGN KEY (`class_id`) REFERENCES `class` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `class_timetable_ibfk_2` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `class_timetable_ibfk_3` FOREIGN KEY (`subject_id`) REFERENCES `subject` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=136 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `class_timetable`
--

LOCK TABLES `class_timetable` WRITE;
/*!40000 ALTER TABLE `class_timetable` DISABLE KEYS */;
INSERT INTO `class_timetable` VALUES (83,15,1,1,1,1,'2019-10-02 19:27:09','2019-10-03 06:43:29',NULL),(84,16,1,1,1,8,'2019-10-02 19:27:26','2019-12-01 15:18:13',NULL),(85,15,2,1,5,7,'2019-10-02 19:28:29','2019-12-01 15:18:34',NULL),(86,16,2,1,5,4,'2019-10-02 19:28:43','2019-10-02 19:28:47',NULL),(87,15,3,1,2,1,'2019-10-02 20:06:18','2019-10-03 06:53:58',NULL),(88,15,4,1,4,NULL,'2019-10-02 20:06:20','2019-10-02 20:06:20',NULL),(89,15,5,1,1,NULL,'2019-10-02 20:06:21','2019-10-02 20:06:21',NULL),(90,15,2,2,1,3,'2019-10-03 06:54:30','2019-10-03 06:54:36',NULL),(91,15,4,2,4,7,'2019-10-03 06:58:21','2019-12-01 15:18:41',NULL),(92,15,1,2,5,7,'2019-11-24 03:25:16','2019-11-24 03:25:21',NULL),(93,15,1,3,10,NULL,'2019-12-01 15:16:58','2019-12-01 15:16:58',NULL),(94,15,1,4,9,NULL,'2019-12-01 15:17:03','2019-12-01 15:17:03',NULL),(95,15,1,5,6,NULL,'2019-12-01 15:17:07','2019-12-01 15:17:07',NULL),(96,47,1,1,5,3,'2019-12-01 15:17:21','2019-12-01 15:18:22',NULL),(97,47,2,1,5,3,'2019-12-01 15:17:23','2019-12-01 15:19:03',NULL),(98,47,3,1,5,3,'2019-12-01 15:17:25','2019-12-01 15:19:05',NULL),(99,47,3,2,5,3,'2019-12-01 15:17:29','2019-12-01 15:19:12',NULL),(100,47,4,1,5,3,'2019-12-01 15:17:33','2019-12-01 15:19:07',NULL),(101,47,5,1,5,3,'2019-12-01 15:17:35','2019-12-01 15:19:08',NULL),(102,47,1,2,10,NULL,'2019-12-01 15:19:19','2019-12-02 01:42:19',NULL),(103,47,2,2,9,4,'2019-12-01 15:19:21','2019-12-02 01:42:37',NULL),(104,47,4,2,1,8,'2019-12-01 15:19:24','2019-12-02 01:43:02',NULL),(105,47,5,2,7,7,'2019-12-01 15:19:27','2019-12-02 01:43:31',NULL),(106,47,1,3,9,4,'2019-12-01 15:19:36','2019-12-02 01:42:35',NULL),(107,47,2,3,1,8,'2019-12-01 15:19:39','2019-12-02 01:42:55',NULL),(108,47,3,3,7,7,'2019-12-01 15:19:45','2019-12-02 01:43:25',NULL),(109,47,4,3,9,4,'2019-12-01 15:19:47','2019-12-02 01:42:42',NULL),(110,47,5,3,10,NULL,'2019-12-01 15:19:57','2019-12-02 01:42:29',NULL),(111,47,1,4,7,7,'2019-12-01 15:20:03','2019-12-02 01:43:18',NULL),(112,47,1,5,2,1,'2019-12-01 15:20:06','2019-12-02 01:44:04',NULL),(113,47,1,6,1,8,'2019-12-01 15:20:13','2019-12-02 01:42:52',NULL),(114,47,1,7,4,7,'2019-12-01 15:20:18','2019-12-02 01:43:07',NULL),(115,47,1,8,6,4,'2019-12-01 15:20:25','2019-12-02 01:43:42',NULL),(116,47,2,4,10,NULL,'2019-12-01 15:20:32','2019-12-02 01:42:24',NULL),(117,47,2,5,8,8,'2019-12-01 15:20:36','2019-12-02 01:44:19',NULL),(118,47,2,6,7,7,'2019-12-01 15:20:53','2019-12-02 01:43:22',NULL),(119,47,2,7,6,4,'2019-12-01 15:20:58','2019-12-02 01:43:39',NULL),(120,47,2,8,2,1,'2019-12-01 15:21:00','2019-12-02 01:44:02',NULL),(121,47,3,4,10,NULL,'2019-12-01 15:21:06','2019-12-02 01:42:25',NULL),(122,47,3,5,9,4,'2019-12-01 15:21:10','2019-12-02 01:42:39',NULL),(123,47,3,6,1,8,'2019-12-01 15:21:13','2019-12-02 01:42:58',NULL),(124,47,3,7,6,4,'2019-12-01 15:21:17','2019-12-02 01:43:44',NULL),(125,47,3,8,2,1,'2019-12-01 15:21:19','2019-12-02 01:44:00',NULL),(126,47,4,4,10,NULL,'2019-12-01 15:21:28','2019-12-02 01:42:27',NULL),(127,47,4,5,8,8,'2019-12-01 15:21:31','2019-12-02 01:44:21',NULL),(128,47,4,6,7,7,'2019-12-01 15:21:32','2019-12-02 01:43:27',NULL),(129,47,4,7,6,4,'2019-12-01 15:21:34','2019-12-02 01:43:46',NULL),(130,47,4,8,2,1,'2019-12-01 15:21:38','2019-12-02 01:43:59',NULL),(131,47,5,4,9,4,'2019-12-01 15:21:44','2019-12-02 01:42:44',NULL),(132,47,5,5,1,8,'2019-12-01 15:21:50','2019-12-02 01:43:03',NULL),(133,47,5,6,8,8,'2019-12-01 15:21:53','2019-12-02 01:44:23',NULL),(134,47,5,7,6,4,'2019-12-01 15:21:55','2019-12-02 01:43:47',NULL),(135,47,5,8,2,1,'2019-12-01 15:21:57','2019-12-02 01:43:57',NULL);
/*!40000 ALTER TABLE `class_timetable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coach`
--

DROP TABLE IF EXISTS `coach`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coach` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `admission_date` date NOT NULL,
  `full_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `initials` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `surname` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nic` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dob` date NOT NULL,
  `gender` enum('male','female') COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone_home` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone_mobile` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `district_id` int(2) DEFAULT NULL,
  `created_on` datetime NOT NULL,
  `updated_on` datetime NOT NULL,
  `deleted_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nic` (`nic`),
  UNIQUE KEY `email` (`email`),
  KEY `district_id` (`district_id`),
  CONSTRAINT `coach_ibfk_1` FOREIGN KEY (`district_id`) REFERENCES `district` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coach`
--

LOCK TABLES `coach` WRITE;
/*!40000 ALTER TABLE `coach` DISABLE KEYS */;
INSERT INTO `coach` VALUES (3,'2019-12-18','Madura Sangeeth Gunathilake','H K M S','Gunathilakeee','951232305V','1995-04-12','male','madura.sangeeth@gmail.comm','0332285625','0715217895','121, Keenawala roaddd','Kubaloluwaaa',7,'2019-10-05 08:15:35','2020-01-05 05:34:42',NULL),(4,'2019-12-19','Rivindu Wickramarachchi','D B','Wickramarachchi','951423214V','1995-04-26','male','rivi.wiki@gmail.com',NULL,NULL,'267/10, Nagahakotuwa Road','Gampaha',NULL,'2019-10-06 02:58:11','2019-10-06 02:58:11',NULL);
/*!40000 ALTER TABLE `coach` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coach_has_sport`
--

DROP TABLE IF EXISTS `coach_has_sport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coach_has_sport` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `coach_id` int(6) NOT NULL,
  `sport_id` int(3) DEFAULT NULL,
  `created_on` datetime NOT NULL,
  `updated_on` datetime NOT NULL,
  `deleted_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `coach_id_2` (`coach_id`,`sport_id`),
  KEY `sport_id` (`sport_id`),
  KEY `coach_id` (`coach_id`),
  CONSTRAINT `coach_has_sport_ibfk_1` FOREIGN KEY (`sport_id`) REFERENCES `sport` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `coach_has_sport_ibfk_2` FOREIGN KEY (`coach_id`) REFERENCES `coach` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=88 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coach_has_sport`
--

LOCK TABLES `coach_has_sport` WRITE;
/*!40000 ALTER TABLE `coach_has_sport` DISABLE KEYS */;
INSERT INTO `coach_has_sport` VALUES (3,4,1,'2019-10-06 02:58:11','2019-10-06 02:58:11',NULL),(86,3,4,'2020-01-05 05:34:42','2020-01-05 05:34:42',NULL),(87,3,7,'2020-01-05 05:34:42','2020-01-05 05:34:42',NULL);
/*!40000 ALTER TABLE `coach_has_sport` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `district`
--

DROP TABLE IF EXISTS `district`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `district` (
  `id` int(2) NOT NULL AUTO_INCREMENT,
  `province_id` int(2) NOT NULL,
  `name` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_on` datetime NOT NULL,
  `updated_on` datetime NOT NULL,
  `deleted_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`,`province_id`),
  KEY `district_province_id_fk` (`province_id`),
  CONSTRAINT `district_province_id_fk` FOREIGN KEY (`province_id`) REFERENCES `province` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `district`
--

LOCK TABLES `district` WRITE;
/*!40000 ALTER TABLE `district` DISABLE KEYS */;
INSERT INTO `district` VALUES (1,2,'Ampara','2019-09-18 00:00:00','2019-09-18 00:00:00',NULL),(2,3,'Anuradhapura','2019-09-18 00:00:00','2019-09-18 00:00:00',NULL),(3,8,'Badulla','2019-09-18 00:00:00','2019-09-18 00:00:00',NULL),(4,2,'Batticaloa','2019-09-18 00:00:00','2019-09-18 00:00:00',NULL),(5,9,'Colombo','2019-09-18 00:00:00','2019-09-18 00:00:00',NULL),(6,7,'Galle','2019-09-18 00:00:00','2019-09-18 00:00:00',NULL),(7,9,'Gampaha','2019-09-18 00:00:00','2019-09-18 00:00:00',NULL),(8,7,'Hambantota','2019-09-18 00:00:00','2019-09-18 00:00:00',NULL),(9,5,'Jaffna','2019-09-18 00:00:00','2019-09-18 00:00:00',NULL),(10,9,'Kalutara','2019-09-18 00:00:00','2019-09-18 00:00:00',NULL),(11,1,'Kandy','2019-09-18 00:00:00','2019-09-18 00:00:00',NULL),(12,6,'Kegalle','2019-09-18 00:00:00','2019-09-18 00:00:00',NULL),(13,5,'Kilinochchi','2019-09-18 00:00:00','2019-09-18 00:00:00',NULL),(14,4,'Kurunegala','2019-09-18 00:00:00','2019-09-18 00:00:00',NULL),(15,5,'Mannar','2019-09-18 00:00:00','2019-09-18 00:00:00',NULL),(16,1,'Matale','2019-09-18 00:00:00','2019-09-18 00:00:00',NULL),(17,7,'Matara','2019-09-18 00:00:00','2019-09-18 00:00:00',NULL),(18,8,'Monaragala','2019-09-18 00:00:00','2019-09-18 00:00:00',NULL),(19,5,'Mullaitivu','2019-09-18 00:00:00','2019-09-18 00:00:00',NULL),(20,1,'Nuwara Eliya','2019-09-18 00:00:00','2019-09-18 00:00:00',NULL),(21,3,'Polonnaruwa','2019-09-18 00:00:00','2019-09-18 00:00:00',NULL),(22,4,'Puttalam','2019-09-18 00:00:00','2019-09-18 00:00:00',NULL),(23,6,'Ratnapura','2019-09-18 00:00:00','2019-09-18 00:00:00',NULL),(24,2,'Trincomalee','2019-09-18 00:00:00','2019-09-18 00:00:00',NULL),(25,5,'Vavuniya','2019-09-18 00:00:00','2019-09-18 00:00:00',NULL);
/*!40000 ALTER TABLE `district` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exam`
--

DROP TABLE IF EXISTS `exam`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exam` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `type_id` int(2) NOT NULL,
  `year` year(4) NOT NULL,
  `venue` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT 'School premises',
  `instructions` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT 'No instructions',
  `created_on` datetime NOT NULL,
  `updated_on` datetime NOT NULL,
  `deleted_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `type` (`type_id`,`year`),
  CONSTRAINT `exam_ibfk_1` FOREIGN KEY (`type_id`) REFERENCES `exam_type` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exam`
--

LOCK TABLES `exam` WRITE;
/*!40000 ALTER TABLE `exam` DISABLE KEYS */;
INSERT INTO `exam` VALUES (21,10,2019,'School Premises','Programmable Calculators are not allowed','2019-12-08 13:40:10','2019-12-08 13:40:10',NULL),(22,1,2020,'school main hall','Smart phones are not allowed','2019-12-12 04:24:14','2019-12-12 05:24:24',NULL);
/*!40000 ALTER TABLE `exam` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exam_grade_has_schedule`
--

DROP TABLE IF EXISTS `exam_grade_has_schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exam_grade_has_schedule` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `exam_grade_id` int(4) NOT NULL,
  `subject_id` int(3) NOT NULL,
  `date` date NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  `venue` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT 'School premises',
  `instructions` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT 'No instructions',
  `created_on` datetime NOT NULL,
  `updated_on` datetime NOT NULL,
  `deleted_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `exam_grade_id` (`exam_grade_id`,`subject_id`),
  KEY `exam_schedule_ibfk_2` (`subject_id`),
  CONSTRAINT `exam_grade_has_schedule_ibfk_1` FOREIGN KEY (`exam_grade_id`) REFERENCES `exam_has_grade` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `exam_grade_has_schedule_ibfk_2` FOREIGN KEY (`subject_id`) REFERENCES `subject` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=88 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exam_grade_has_schedule`
--

LOCK TABLES `exam_grade_has_schedule` WRITE;
/*!40000 ALTER TABLE `exam_grade_has_schedule` DISABLE KEYS */;
INSERT INTO `exam_grade_has_schedule` VALUES (77,49,3,'2019-12-08','11:00:00','13:00:00','Ananda Hall','Calculators Allowed','2019-12-08 13:52:11','2019-12-12 04:52:35',NULL),(78,49,10,'2019-12-08','08:00:00','10:00:00','Main Hall','','2019-12-08 13:54:12','2019-12-12 04:53:07',NULL),(79,50,1,'2020-01-16','08:00:00','10:00:00',NULL,NULL,'2020-01-08 00:04:17','2020-01-08 00:04:17',NULL),(82,51,2,'2020-01-14','08:00:00','10:00:00',NULL,NULL,'2020-01-08 00:05:26','2020-01-08 00:05:26',NULL),(85,50,6,'2020-01-09','08:00:00','10:00:00',NULL,NULL,'2020-01-08 17:25:34','2020-01-08 17:25:34',NULL),(86,50,8,'2020-01-10','08:00:00','10:00:00',NULL,NULL,'2020-01-08 17:29:59','2020-01-08 17:29:59',NULL),(87,50,4,'2020-01-10','11:00:00','13:00:00',NULL,NULL,'2020-01-10 22:48:36','2020-01-10 22:48:36',NULL);
/*!40000 ALTER TABLE `exam_grade_has_schedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exam_has_grade`
--

DROP TABLE IF EXISTS `exam_has_grade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exam_has_grade` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `exam_id` int(4) NOT NULL,
  `grade_id` int(2) NOT NULL,
  `created_on` datetime NOT NULL,
  `updated_on` datetime NOT NULL,
  `deleted_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `exam_id` (`exam_id`,`grade_id`),
  KEY `exam_has_grade_ibfk_2` (`grade_id`),
  CONSTRAINT `exam_has_grade_ibfk_1` FOREIGN KEY (`exam_id`) REFERENCES `exam` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `exam_has_grade_ibfk_2` FOREIGN KEY (`grade_id`) REFERENCES `grade` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exam_has_grade`
--

LOCK TABLES `exam_has_grade` WRITE;
/*!40000 ALTER TABLE `exam_has_grade` DISABLE KEYS */;
INSERT INTO `exam_has_grade` VALUES (49,21,6,'2019-12-08 13:40:35','2019-12-08 13:40:35',NULL),(50,22,1,'2020-01-08 00:04:17','2020-01-08 00:04:17',NULL),(51,22,6,'2020-01-08 00:05:05','2020-01-08 00:05:05',NULL);
/*!40000 ALTER TABLE `exam_has_grade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exam_type`
--

DROP TABLE IF EXISTS `exam_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exam_type` (
  `id` int(2) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_on` datetime NOT NULL,
  `updated_on` datetime NOT NULL,
  `deleted_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exam_type`
--

LOCK TABLES `exam_type` WRITE;
/*!40000 ALTER TABLE `exam_type` DISABLE KEYS */;
INSERT INTO `exam_type` VALUES (1,'First Semester','2019-09-21 05:44:36','2019-12-04 05:30:09',NULL),(4,'First Semester Mid','2019-09-22 23:52:20','2019-12-09 19:09:49',NULL),(5,'Second Semester Mid','2019-09-22 23:58:16','2019-12-08 13:33:27',NULL),(7,'Ordinary Level','2019-12-01 15:07:06','2019-12-01 15:07:06',NULL),(9,'Second Semester','2019-12-06 02:36:07','2019-12-06 02:36:07',NULL),(10,'Third Semester','2019-12-08 13:32:50','2019-12-08 13:32:50',NULL);
/*!40000 ALTER TABLE `exam_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grade`
--

DROP TABLE IF EXISTS `grade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grade` (
  `id` int(2) NOT NULL AUTO_INCREMENT,
  `name` int(2) NOT NULL,
  `created_on` datetime NOT NULL,
  `updated_on` datetime NOT NULL,
  `deleted_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grade`
--

LOCK TABLES `grade` WRITE;
/*!40000 ALTER TABLE `grade` DISABLE KEYS */;
INSERT INTO `grade` VALUES (1,1,'2019-09-16 00:00:00','2019-09-16 00:00:00',NULL),(2,2,'2019-12-01 00:00:00','2019-12-01 00:00:00',NULL),(3,3,'2019-09-21 02:07:46','2019-09-21 02:07:46',NULL),(4,4,'2019-09-21 03:53:16','2019-09-21 03:53:16',NULL),(5,5,'2019-09-21 23:49:46','2019-09-21 23:49:46',NULL),(6,6,'2019-09-28 16:11:22','2019-09-28 16:11:22',NULL),(7,7,'2019-12-01 14:17:28','2019-12-01 14:17:28',NULL),(8,8,'2019-12-01 14:20:50','2019-12-01 14:20:50',NULL),(9,9,'2019-12-01 14:20:55','2019-12-01 14:20:55',NULL),(10,10,'2019-12-07 00:00:00','2019-12-07 00:00:00',NULL),(11,11,'2019-12-01 14:21:05','2019-12-01 14:21:05',NULL),(12,12,'2019-12-07 02:34:37','2019-12-09 16:29:32',NULL);
/*!40000 ALTER TABLE `grade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `message`
--

DROP TABLE IF EXISTS `message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `message` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `sender_id` int(6) NOT NULL,
  `receiver_id` int(6) NOT NULL,
  `body` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_on` datetime NOT NULL,
  `updated_on` datetime NOT NULL,
  `deleted_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `receiver_id` (`receiver_id`),
  KEY `sender_id` (`sender_id`),
  CONSTRAINT `message_ibfk_1` FOREIGN KEY (`receiver_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `message_ibfk_2` FOREIGN KEY (`sender_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message`
--

LOCK TABLES `message` WRITE;
/*!40000 ALTER TABLE `message` DISABLE KEYS */;
INSERT INTO `message` VALUES (1,3,5,'Thank you for your purchase. We have received your payment for item #13201. Best Ways Shop.\r\n\r\n','2019-12-18 00:02:00','2020-01-09 19:12:44',NULL),(2,5,3,'thank you','2019-12-18 00:05:00','2020-01-08 03:11:17',NULL),(3,3,5,'You are welcome','2019-12-18 00:07:00','2020-01-09 19:12:44',NULL),(9,3,5,'hello, how are you?','2019-12-19 06:21:47','2020-01-09 19:12:44',NULL),(14,3,8,'Hi coach sangeeth.','2020-01-02 22:29:36','2020-01-03 01:35:21',NULL),(15,8,3,'Hello, staff lakmal?','2020-01-02 22:32:36','2020-01-09 18:16:52',NULL),(17,3,8,'what are you doing these days bro ??','2020-01-03 00:59:06','2020-01-03 01:35:21',NULL),(18,3,5,'hi ayesh aiye','2020-01-06 12:57:11','2020-01-09 19:12:44',NULL),(19,5,3,'hi lakmal malli','2020-01-08 03:22:36','2020-01-08 03:22:36',NULL),(20,5,3,'kohomada?','2020-01-08 03:22:54','2020-01-08 03:22:54',NULL),(22,3,10,'hi mrs. mallika..','2020-01-09 19:13:51','2020-01-09 19:14:28',NULL);
/*!40000 ALTER TABLE `message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notification`
--

DROP TABLE IF EXISTS `notification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notification` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `sender_id` int(6) NOT NULL,
  `receiver_id` int(6) NOT NULL,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) DEFAULT 0,
  `created_on` datetime NOT NULL,
  `updated_on` datetime NOT NULL,
  `deleted_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `receiver_id` (`receiver_id`),
  KEY `sender_id` (`sender_id`),
  CONSTRAINT `notification_ibfk_1` FOREIGN KEY (`receiver_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `notification_ibfk_2` FOREIGN KEY (`sender_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notification`
--

LOCK TABLES `notification` WRITE;
/*!40000 ALTER TABLE `notification` DISABLE KEYS */;
INSERT INTO `notification` VALUES (1,15,3,'Welcome','You are warmly welcome to SCHMS System',0,'2020-01-08 00:00:00','2020-01-08 16:12:06',NULL),(2,3,3,'Password changed','Your password has been changed by System Administrator',1,'2020-01-08 05:40:07','2020-01-09 01:10:24','2020-01-09 01:10:24'),(3,15,3,'Welcome','You are warmly welcome to SCHMS System',0,'2020-01-08 00:00:00','2020-01-08 16:17:38',NULL),(4,3,3,'Password changed','Your password has been changed by System Administrator',1,'2020-01-08 05:40:07','2020-01-09 01:10:29',NULL),(5,15,3,'Welcome','You are warmly welcome to SCHMS System',0,'2020-01-08 00:00:00','2020-01-08 16:17:41',NULL),(6,3,3,'Password changed','Your password has been changed by System Administrator',0,'2020-01-08 05:40:07','2020-01-09 01:02:46',NULL),(7,15,3,'Welcome','You are warmly welcome to SCHMS System',0,'2020-01-08 00:00:00','2020-01-08 16:17:44',NULL),(8,3,3,'Password changed','Your password has been changed by System Administrator',0,'2020-01-08 05:40:07','2020-01-08 16:08:37',NULL),(9,15,3,'Welcome','You are warmly welcome to SCHMS System',0,'2020-01-08 00:00:00','2020-01-08 16:17:45',NULL),(10,3,3,'Password changed','Your password has been changed by System Administrator',0,'2020-01-08 05:40:07','2020-01-09 01:02:42',NULL),(11,15,3,'Welcome','You are warmly welcome to SCHMS System',0,'2020-01-08 00:00:00','2020-01-09 01:06:22',NULL),(12,3,3,'Password changed','Your password has been changed by System Administrator',0,'2020-01-08 05:40:07','2020-01-09 01:05:20',NULL),(13,15,3,'Welcome','You are warmly welcome to SCHMS System',0,'2020-01-08 00:00:00','2020-01-09 01:06:24',NULL),(14,3,3,'Password changed','Your password has been changed by System Administrator',0,'2020-01-08 05:40:07','2020-01-09 01:06:17',NULL),(15,15,3,'Welcome','You are warmly welcome to SCHMS System',0,'2020-01-08 00:00:00','2020-01-09 01:06:00',NULL),(16,3,3,'Password changed','Your password has been changed by System Administrator',0,'2020-01-08 05:40:07','2020-01-09 01:06:26',NULL),(17,3,17,'Account Activated','Your account has been activated by System Administrator',0,'2020-01-08 16:34:08','2020-01-08 16:34:08',NULL),(24,3,7,'Attendance Marked','Your are present on 2020-01-08',0,'2020-01-08 16:57:07','2020-01-08 16:57:07',NULL),(25,3,7,'New Exam Schedule Found','A new exam schedule has been assigned to you on 2020-01-10',0,'2020-01-08 17:29:59','2020-01-08 17:29:59',NULL),(26,3,7,'Results Updated','Your exam results has been updated',0,'2020-01-08 18:12:44','2020-01-08 18:12:44',NULL),(27,3,7,'Sports Updated','Your engaged sport list has been updated',0,'2020-01-08 18:35:41','2020-01-08 18:35:41',NULL),(28,3,5,'Health Updated','Your health details has been updated',1,'2020-01-08 18:40:05','2020-01-09 01:43:54',NULL),(29,3,7,'New Exam Schedule Found','A new exam schedule has been assigned to you on 2020-01-10',0,'2020-01-10 22:48:36','2020-01-10 22:48:36',NULL),(30,3,5,'New Exam Schedule Found','A new exam schedule has been assigned to you on 2020-01-10',0,'2020-01-10 22:48:36','2020-01-10 22:48:36',NULL);
/*!40000 ALTER TABLE `notification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `parent`
--

DROP TABLE IF EXISTS `parent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `parent` (
  `id` int(7) NOT NULL AUTO_INCREMENT,
  `nic` varchar(12) COLLATE utf8mb4_unicode_ci NOT NULL,
  `full_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `initials` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `surname` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dob` date NOT NULL,
  `gender` enum('Male','Female') COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone_home` char(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone_mobile` char(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `occupation` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `position` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `income` int(10) DEFAULT NULL,
  `address` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `district_id` int(2) DEFAULT NULL,
  `created_on` datetime NOT NULL,
  `updated_on` datetime NOT NULL,
  `deleted_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nic` (`nic`),
  KEY `parent_district_id_fk` (`district_id`),
  CONSTRAINT `parent_district_id_fk` FOREIGN KEY (`district_id`) REFERENCES `district` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `parent`
--

LOCK TABLES `parent` WRITE;
/*!40000 ALTER TABLE `parent` DISABLE KEYS */;
INSERT INTO `parent` VALUES (4,'677660198V','Warnakulasooriya Mahawaduge Mallika Peiris','W M M','Peiris','1967-09-22','Female','mallika.pieris67@gmail.com','0332289862','0771007842','None','',30000,'144/5A, 3rd Lane, Palmgrove Estate','Veyangoda',6,'2019-09-23 09:33:17','2020-01-01 02:37:29',NULL),(5,'591231408V','Samarakkodi Arachchige lakshman samarakkodi','S A L','Samarakkodi','1959-02-28','Male','lakshmansamarakkodi@gmail.com','0332296548','0760411256','karate instructor',NULL,25000,'144/5A 3rd lane','Veyangoda',7,'2019-09-26 23:54:13','2019-09-26 23:54:13',NULL),(6,'647845211V','Sanath Mallawarachchi','W S','Mallawarachchi','1964-02-25','Male',NULL,NULL,NULL,'AirLanka officer',NULL,12000,'no 30 malkelum, kalagedihena.','Nittambuwa',NULL,'2019-10-03 06:28:05','2019-10-03 06:28:05',NULL),(11,'536751208V','Heshani Dewage Hashara Munasinghe','Hashara','Munasinghe','1953-05-13','Female','Hashara123@gmail.com','0332256985','0774924351','Nursing','Head of Dept',50000,'144/5A, 3rd Lane, vgeytra','Bambalapitiya',5,'2019-11-22 18:35:43','2019-11-22 18:35:43',NULL),(13,'653257508V','Dilanka Rukshan','D','Rukshan','1965-02-04','Female','dilankarukshan@gmail.com','0332246648','0756924351','Carpenter','',24000,'144/5A, 3rd Lane, Plamgrove Estate','Negombo',7,'2019-11-24 02:58:26','2020-01-08 16:31:13',NULL),(14,'661234567V','Rohan Fernando','R','Fernando','1966-06-10','Male','rfernando@gmail.com',NULL,NULL,'Teacher',NULL,60000,'10, 6th Lane, gorakadeniya','Nittambuwa',7,'2019-11-24 03:15:42','2019-11-24 03:15:42',NULL),(15,'561235602V','Manel Wickramarachchi','M','Wickramarachchi','1956-03-28','Male','manelwije@live.com','0332256412','0774856953','Software Engineer','Associate',65000,'5A, Rose Lane,','Gampaha',7,'2019-12-04 04:08:41','2019-12-04 04:08:41',NULL),(16,'199807814372','Lakmal','Lakmal','Samarakkody','2019-12-13','Male','lakmalsamarakkody@gmail.comd','0332278673','0774924351','Teacher',NULL,10000,'144/5A, 3rd Lane, Palmgrove Estate','Veyangoda',19,'2019-12-13 04:59:23','2019-12-13 04:59:23',NULL),(17,'269807814375','Lakmal','Lakmal','Samarakkody','2019-12-13','Female','lakmalsamarakkody@gmail.comsdsfdsfd','0776831019','0776831019','jhdgf','khgshg',54000,'144/5A, 3rd Lane, Palmgrove Estate','Veyangoda',17,'2019-12-13 05:08:57','2019-12-13 05:08:57',NULL),(18,'198724512345','Lakmal','Lakmal','Samarakkody','2019-12-12','Male','lakmalsamarakkody@gmail.vfbfdbfdb',NULL,'0774924351','None',NULL,NULL,'144/5A, 3rd Lane, Palmgrove Estate','Veyangoda',18,'2019-12-14 13:50:51','2019-12-14 13:50:51',NULL);
/*!40000 ALTER TABLE `parent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `province`
--

DROP TABLE IF EXISTS `province`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `province` (
  `id` int(2) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_on` datetime NOT NULL,
  `updated_on` datetime NOT NULL,
  `deleted_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `province`
--

LOCK TABLES `province` WRITE;
/*!40000 ALTER TABLE `province` DISABLE KEYS */;
INSERT INTO `province` VALUES (1,'Central','2019-09-18 00:00:00','2019-09-18 00:00:00',NULL),(2,'Eastern','2019-09-18 00:00:00','2019-09-18 00:00:00',NULL),(3,'North Central','2019-09-18 00:00:00','2019-09-18 00:00:00',NULL),(4,'North Western','2019-09-18 00:00:00','2019-09-18 00:00:00',NULL),(5,'Northern','2019-09-18 00:00:00','2019-09-18 00:00:00',NULL),(6,'Sabaragamuwa','2019-09-18 00:00:00','2019-09-18 00:00:00',NULL),(7,'Southern','2019-09-18 00:00:00','2019-09-18 00:00:00',NULL),(8,'Uva','2019-09-18 00:00:00','2019-09-18 00:00:00',NULL),(9,'Western','2019-09-18 00:00:00','2019-09-18 00:00:00',NULL);
/*!40000 ALTER TABLE `province` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `relation_type`
--

DROP TABLE IF EXISTS `relation_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `relation_type` (
  `id` int(2) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_on` datetime NOT NULL,
  `updated_on` datetime NOT NULL,
  `deleted_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `relation_type`
--

LOCK TABLES `relation_type` WRITE;
/*!40000 ALTER TABLE `relation_type` DISABLE KEYS */;
INSERT INTO `relation_type` VALUES (1,'Father','2019-09-21 04:56:27','2019-09-21 04:56:27',NULL),(2,'Mother','2019-09-21 04:56:33','2019-09-21 04:56:33',NULL),(3,'Guardian 1','2019-09-21 04:57:13','2019-12-09 19:07:58',NULL),(5,'Guardian 2','2019-12-06 02:23:47','2019-12-06 02:23:47',NULL);
/*!40000 ALTER TABLE `relation_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `religion`
--

DROP TABLE IF EXISTS `religion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `religion` (
  `id` int(2) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_on` datetime NOT NULL,
  `updated_on` datetime NOT NULL,
  `deleted_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `religion`
--

LOCK TABLES `religion` WRITE;
/*!40000 ALTER TABLE `religion` DISABLE KEYS */;
INSERT INTO `religion` VALUES (1,'Buddhist','2019-09-18 00:00:00','2019-12-09 16:29:46',NULL),(2,'Christian','2019-09-18 00:00:00','2019-09-18 00:00:00',NULL),(4,'Hindu','2019-12-01 14:59:35','2019-12-01 14:59:35',NULL),(6,'Muslims','2019-12-06 00:46:20','2019-12-09 14:23:42',NULL);
/*!40000 ALTER TABLE `religion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `report`
--

DROP TABLE IF EXISTS `report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `report` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_name` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `generated_by` int(7) DEFAULT NULL,
  `created_on` datetime NOT NULL,
  `updated_on` datetime NOT NULL,
  `deleted_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `generated_by` (`generated_by`),
  CONSTRAINT `report_ibfk_1` FOREIGN KEY (`generated_by`) REFERENCES `user` (`id`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `report`
--

LOCK TABLES `report` WRITE;
/*!40000 ALTER TABLE `report` DISABLE KEYS */;
/*!40000 ALTER TABLE `report` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sport`
--

DROP TABLE IF EXISTS `sport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sport` (
  `id` int(3) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_on` datetime NOT NULL,
  `updated_on` datetime NOT NULL,
  `deleted_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sport`
--

LOCK TABLES `sport` WRITE;
/*!40000 ALTER TABLE `sport` DISABLE KEYS */;
INSERT INTO `sport` VALUES (1,'Cricket','2019-09-23 04:22:38','2019-09-23 04:22:38',NULL),(2,'Football','2019-10-04 23:51:48','2019-10-04 23:51:48',NULL),(3,'Netball','2019-10-04 23:51:55','2019-10-04 23:51:55',NULL),(4,'Athletics','2019-10-04 23:52:06','2019-12-09 19:48:01',NULL),(5,'Gymnastic','2019-10-04 23:52:20','2019-10-04 23:52:20',NULL),(7,'Swimming','2019-12-06 02:49:46','2019-12-06 02:49:46',NULL);
/*!40000 ALTER TABLE `sport` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff`
--

DROP TABLE IF EXISTS `staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `staff` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `employee_number` int(6) NOT NULL,
  `type_id` int(2) NOT NULL,
  `admission_date` date NOT NULL,
  `nic` varchar(12) COLLATE utf8mb4_unicode_ci NOT NULL,
  `full_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `initials` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `surname` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dob` date NOT NULL,
  `gender` enum('Male','Female') COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone_home` char(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone_mobile` char(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `district_id` int(2) DEFAULT NULL,
  `religion_id` int(2) DEFAULT NULL,
  `created_on` datetime NOT NULL,
  `updated_on` datetime NOT NULL,
  `deleted_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `staff_id` (`employee_number`),
  UNIQUE KEY `nic` (`nic`),
  KEY `staff_staff_type_id_fk` (`type_id`),
  KEY `staff_district_id_fk` (`district_id`),
  KEY `staff_religion_id_fk` (`religion_id`),
  CONSTRAINT `staff_district_id_fk` FOREIGN KEY (`district_id`) REFERENCES `district` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `staff_ibfk_1` FOREIGN KEY (`religion_id`) REFERENCES `religion` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `staff_ibfk_2` FOREIGN KEY (`type_id`) REFERENCES `staff_type` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff`
--

LOCK TABLES `staff` WRITE;
/*!40000 ALTER TABLE `staff` DISABLE KEYS */;
INSERT INTO `staff` VALUES (1,1010,3,'2019-09-16','953651408V','Samarakkody Arachchige Lakmal Samarakkody','S A L','Samarakkody','1995-12-30','Male','lakmalsamarakkody@gmail.com','0332296548','0774924351','144/5a, 3rd lane, Palmgrove Estate','Veyangoda',7,1,'2019-09-16 00:00:00','2020-01-01 04:59:03',NULL),(3,3030,4,'2019-09-03','943651408V','Kasuni Imalsha Sehani Edirisinghe','E D K I S','Edirisinghe','1995-10-17','Female','sehani@gmail.com','0332289860','0715216515','267/10, Nagahakotuwa Road','Balummahara',7,1,'2019-09-21 19:07:50','2019-09-21 19:07:50',NULL),(4,4040,1,'2019-09-20','953611408V','Shyamin Ayesh Fernando','S A','Fernando','1998-11-24','Male','me@shyamin.com','','0778545123','148, 8th lane, Herant Estate','Veyangoda',7,2,'2019-09-21 19:15:34','2019-09-21 19:15:34',NULL),(7,7070,2,'2019-11-05','956351408V','Heshan Nayanajith mallawarachchi','M A H N','Mallawarachchi','2019-10-29','Male','lakmalsamarakkody90@gmail.com','0774924351',NULL,'144/5A, 3rd Lane, Plamgrove Estate','Gampaha',7,1,'2019-11-24 03:08:26','2019-11-24 03:08:26',NULL),(8,8080,2,'2019-11-14','945637892V','Laksara Prageeth Maduwantha','L P','Maduwantha','2019-11-05','Male','lakmalsamarakkody56@gmail.com','0774924351','4774924351','144/5A, 3rd Lane, Plamgrove Estate','Veyangoda',7,2,'2019-11-24 03:09:50','2019-11-24 03:09:50',NULL);
/*!40000 ALTER TABLE `staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff_attendance`
--

DROP TABLE IF EXISTS `staff_attendance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `staff_attendance` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `staff_id` int(6) NOT NULL,
  `date` date NOT NULL,
  `created_on` datetime NOT NULL,
  `updated_on` datetime NOT NULL,
  `deleted_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `staff_id` (`staff_id`,`date`),
  CONSTRAINT `staff_attendance_ibfk_1` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=87 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff_attendance`
--

LOCK TABLES `staff_attendance` WRITE;
/*!40000 ALTER TABLE `staff_attendance` DISABLE KEYS */;
INSERT INTO `staff_attendance` VALUES (2,3,'2019-10-03','2019-10-03 06:23:30','2019-10-03 06:23:30',NULL),(3,4,'2019-10-03','2019-10-03 06:23:32','2019-10-03 06:23:32',NULL),(4,3,'2019-11-20','2019-11-20 19:44:19','2019-11-20 19:44:19',NULL),(6,4,'2019-11-21','2019-11-21 00:13:24','2019-11-21 00:13:24',NULL),(8,1,'2019-11-23','2019-11-23 00:44:15','2019-11-23 00:44:15',NULL),(9,3,'2019-11-23','2019-11-23 00:44:16','2019-11-23 00:44:16',NULL),(12,4,'2019-11-29','2019-11-29 03:14:24','2019-11-29 03:14:24',NULL),(15,3,'2019-11-29','2019-11-29 03:20:30','2019-11-29 03:20:30',NULL),(16,7,'2019-11-29','2019-11-29 03:20:30','2019-11-29 03:20:30',NULL),(17,8,'2019-11-29','2019-11-29 03:20:31','2019-11-29 03:20:31',NULL),(18,1,'2019-12-01','2019-12-01 13:48:32','2019-12-01 13:48:32',NULL),(19,3,'2019-12-01','2019-12-01 13:48:33','2019-12-01 13:48:33',NULL),(21,7,'2019-12-01','2019-12-01 13:48:34','2019-12-01 13:48:34',NULL),(22,8,'2019-12-01','2019-12-01 13:48:34','2019-12-01 13:48:34',NULL),(23,1,'2019-11-30','2019-12-01 15:14:24','2019-12-01 15:14:24',NULL),(24,3,'2019-11-30','2019-12-01 15:14:26','2019-12-01 15:14:26',NULL),(25,4,'2019-11-30','2019-12-01 15:14:26','2019-12-01 15:14:26',NULL),(26,7,'2019-11-30','2019-12-01 15:14:27','2019-12-01 15:14:27',NULL),(27,8,'2019-11-30','2019-12-01 15:14:27','2019-12-01 15:14:27',NULL),(28,1,'2019-11-28','2019-12-01 15:14:38','2019-12-01 15:14:38',NULL),(29,3,'2019-11-28','2019-12-01 15:14:39','2019-12-01 15:14:39',NULL),(30,4,'2019-11-28','2019-12-01 15:14:39','2019-12-01 15:14:39',NULL),(31,8,'2019-11-28','2019-12-01 15:14:40','2019-12-01 15:14:40',NULL),(32,3,'2019-11-27','2019-12-01 15:14:45','2019-12-01 15:14:45',NULL),(34,7,'2019-11-27','2019-12-01 15:14:47','2019-12-01 15:14:47',NULL),(35,8,'2019-11-27','2019-12-01 15:14:48','2019-12-01 15:14:48',NULL),(36,1,'2019-11-27','2019-12-01 15:14:50','2019-12-01 15:14:50',NULL),(37,1,'2019-11-26','2019-12-01 15:14:55','2019-12-01 15:14:55',NULL),(38,3,'2019-11-26','2019-12-01 15:14:56','2019-12-01 15:14:56',NULL),(39,4,'2019-11-26','2019-12-01 15:14:56','2019-12-01 15:14:56',NULL),(40,7,'2019-11-26','2019-12-01 15:14:57','2019-12-01 15:14:57',NULL),(41,8,'2019-11-26','2019-12-01 15:14:57','2019-12-01 15:14:57',NULL),(42,1,'2019-11-25','2019-12-01 15:15:02','2019-12-01 15:15:02',NULL),(43,4,'2019-11-25','2019-12-01 15:15:03','2019-12-01 15:15:03',NULL),(44,7,'2019-11-25','2019-12-01 15:15:03','2019-12-01 15:15:03',NULL),(45,8,'2019-11-25','2019-12-01 15:15:04','2019-12-01 15:15:04',NULL),(46,1,'2019-11-24','2019-12-01 15:15:09','2019-12-01 15:15:09',NULL),(47,3,'2019-11-24','2019-12-01 15:15:10','2019-12-01 15:15:10',NULL),(48,4,'2019-11-24','2019-12-01 15:15:10','2019-12-01 15:15:10',NULL),(49,7,'2019-11-24','2019-12-01 15:15:11','2019-12-01 15:15:11',NULL),(50,8,'2019-11-24','2019-12-01 15:15:11','2019-12-01 15:15:11',NULL),(51,1,'2019-12-02','2019-12-02 01:37:13','2019-12-02 01:37:13',NULL),(52,3,'2019-12-02','2019-12-02 01:37:14','2019-12-02 01:37:14',NULL),(53,4,'2019-12-02','2019-12-02 01:37:14','2019-12-02 01:37:14',NULL),(54,7,'2019-12-02','2019-12-02 01:37:14','2019-12-02 01:37:14',NULL),(55,8,'2019-12-02','2019-12-02 01:37:15','2019-12-02 01:37:15',NULL),(57,3,'2019-12-04','2019-12-04 07:18:33','2019-12-04 07:18:33',NULL),(58,8,'2019-12-04','2019-12-04 07:18:34','2019-12-04 07:18:34',NULL),(60,1,'2019-12-03','2019-12-04 07:21:37','2019-12-04 07:21:37',NULL),(61,3,'2019-12-03','2019-12-04 07:21:38','2019-12-04 07:21:38',NULL),(62,4,'2019-12-03','2019-12-04 07:21:38','2019-12-04 07:21:38',NULL),(63,7,'2019-12-03','2019-12-04 07:21:39','2019-12-04 07:21:39',NULL),(64,8,'2019-12-03','2019-12-04 07:21:39','2019-12-04 07:21:39',NULL),(66,7,'2019-12-04','2019-12-04 07:21:45','2019-12-04 07:21:45',NULL),(67,4,'2019-12-04','2019-12-04 07:21:46','2019-12-04 07:21:46',NULL),(86,1,'2019-12-04','2019-12-11 17:58:43','2019-12-11 17:58:43',NULL);
/*!40000 ALTER TABLE `staff_attendance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff_category`
--

DROP TABLE IF EXISTS `staff_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `staff_category` (
  `id` int(2) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_on` datetime NOT NULL,
  `updated_on` datetime NOT NULL,
  `deleted_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff_category`
--

LOCK TABLES `staff_category` WRITE;
/*!40000 ALTER TABLE `staff_category` DISABLE KEYS */;
INSERT INTO `staff_category` VALUES (1,'Academic','2019-09-16 00:00:00','2019-09-16 00:00:00',NULL),(2,'Non-Academic','2019-09-16 00:00:00','2019-09-16 00:00:00',NULL),(4,'Minor','2019-12-06 02:57:55','2019-12-09 20:07:09',NULL);
/*!40000 ALTER TABLE `staff_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff_has_subject`
--

DROP TABLE IF EXISTS `staff_has_subject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `staff_has_subject` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `staff_id` int(6) NOT NULL,
  `subject_id` int(3) NOT NULL,
  `created_on` datetime NOT NULL,
  `updated_on` datetime NOT NULL,
  `deleted_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `staff_id` (`staff_id`,`subject_id`),
  KEY `staff_has_subject_ibfk_2` (`subject_id`),
  CONSTRAINT `staff_has_subject_ibfk_1` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `staff_has_subject_ibfk_2` FOREIGN KEY (`subject_id`) REFERENCES `subject` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff_has_subject`
--

LOCK TABLES `staff_has_subject` WRITE;
/*!40000 ALTER TABLE `staff_has_subject` DISABLE KEYS */;
INSERT INTO `staff_has_subject` VALUES (10,3,1,'2019-10-02 19:27:32','2019-10-02 19:27:32',NULL),(11,3,5,'2019-10-02 19:28:34','2019-10-02 19:28:34',NULL),(12,4,5,'2019-10-02 19:28:47','2019-10-02 19:28:47',NULL),(14,3,4,'2019-10-03 06:58:23','2019-10-03 06:58:23',NULL),(15,7,5,'2019-11-24 03:25:21','2019-11-24 03:25:21',NULL),(17,7,4,'2019-12-01 15:18:41','2019-12-01 15:18:41',NULL),(19,4,9,'2019-12-02 01:42:35','2019-12-02 01:42:35',NULL),(20,7,7,'2019-12-02 01:43:18','2019-12-02 01:43:18',NULL),(21,4,6,'2019-12-02 01:43:39','2019-12-02 01:43:39',NULL),(52,8,1,'2020-01-05 03:35:30','2020-01-05 03:35:30',NULL),(53,8,8,'2020-01-05 03:35:31','2020-01-05 03:35:31',NULL),(72,1,1,'2020-01-08 05:40:07','2020-01-08 05:40:07',NULL),(73,1,2,'2020-01-08 05:40:07','2020-01-08 05:40:07',NULL);
/*!40000 ALTER TABLE `staff_has_subject` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff_type`
--

DROP TABLE IF EXISTS `staff_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `staff_type` (
  `id` int(2) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` int(2) NOT NULL,
  `created_on` datetime NOT NULL,
  `updated_on` datetime NOT NULL,
  `deleted_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `staff_type_staff_category_id_fk` (`category_id`),
  CONSTRAINT `staff_type_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `staff_category` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff_type`
--

LOCK TABLES `staff_type` WRITE;
/*!40000 ALTER TABLE `staff_type` DISABLE KEYS */;
INSERT INTO `staff_type` VALUES (1,'Principal',1,'2019-09-16 00:00:00','2019-12-09 20:09:27',NULL),(2,'Deputy Principal',1,'2019-10-08 09:18:01','2019-10-08 09:18:01',NULL),(3,'System Administrator',2,'2019-10-09 12:26:39','2019-10-09 12:26:39',NULL),(4,'Teacher',1,'2019-12-02 01:32:08','2019-12-02 01:32:08',NULL),(6,'Librarian',2,'2019-12-06 03:19:48','2019-12-06 03:19:48',NULL),(7,'Receptionist',2,'2019-12-06 03:20:10','2019-12-06 03:20:10',NULL),(8,'Front Office',2,'2019-12-06 03:20:23','2019-12-06 03:20:23',NULL),(9,'Cleaner',4,'2019-12-06 03:20:32','2019-12-06 03:20:32',NULL);
/*!40000 ALTER TABLE `staff_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `admission_no` int(6) NOT NULL,
  `admission_date` date NOT NULL,
  `class_id` int(3) NOT NULL,
  `full_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `initials` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `surname` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dob` date NOT NULL,
  `gender` enum('male','female') COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone_mobile` char(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `birth_place` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `district_id` int(2) DEFAULT NULL,
  `religion_id` int(2) DEFAULT NULL,
  `created_on` datetime NOT NULL,
  `updated_on` datetime NOT NULL,
  `deleted_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admission_no` (`admission_no`),
  KEY `student_district_id_fk` (`district_id`),
  KEY `student_religion_id_fk` (`religion_id`),
  KEY `student_ibfk_2` (`class_id`),
  KEY `phone_mobile` (`phone_mobile`),
  KEY `city` (`city`),
  CONSTRAINT `student_district_id_fk` FOREIGN KEY (`district_id`) REFERENCES `district` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `student_ibfk_1` FOREIGN KEY (`religion_id`) REFERENCES `religion` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `student_ibfk_2` FOREIGN KEY (`class_id`) REFERENCES `class` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES (52,25,'2019-09-19',15,'Samarakkody Arachchige Lakmal Samarakkody','S A L','Samarakkody','1995-12-30','male','lakmalsamarakkody@gmail.com','0774924351','144/5A, 3rd Lane, Palmgrove Estate','Veyangoda',NULL,7,1,'2019-09-23 09:33:17','2020-01-05 05:35:04',NULL),(53,187895,'2019-09-19',15,'Shyamin Ayesh Fernando','S A','Fernando','1992-12-30','male','me@shyamin.com','0775621458','no 10 gorakadeniya','Attanagalla',NULL,7,2,'2019-09-26 18:36:24','2019-12-29 03:35:45',NULL),(64,15,'2019-11-22',15,'Fonseka Appuhamige Lakmali Fonseka','F A L','Fonseka','1995-07-05','female','lakmalifonseka@gmail.com','0778944951','144/5A, 3rd Lane, Plamgrove Estate','Veyangoda','Ragama',7,1,'2019-11-22 18:35:43','2019-11-22 18:35:43',NULL),(66,16,'2019-11-06',15,'Shehan Rajitha jayasekara','S R','Jayasekara','2002-08-05','female','rajithajayasekara@gmail.com','0775924351','144/5A, 3rd Lane, Plamgrove Estate','Negombo','Negombo',7,2,'2019-11-24 02:58:26','2019-11-24 02:58:26',NULL),(67,17,'2019-12-04',16,'Rivindu Rukshan Wickramarachchi','R R','Wickramarachchi','1995-04-09','male','rivndu@gmail.com','0714578652','5A, Rose Lane,','Gampaha','Gampaha',7,1,'2019-12-04 04:08:41','2019-12-04 04:08:41',NULL);
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_achievement`
--

DROP TABLE IF EXISTS `student_achievement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student_achievement` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` int(6) NOT NULL,
  `title` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` int(200) DEFAULT NULL,
  `achieved_on` date NOT NULL,
  `created_on` datetime NOT NULL,
  `updated_on` datetime NOT NULL,
  `deleted_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `student_achievement_student_id_fk` (`student_id`),
  CONSTRAINT `student_achievement_student_id_fk` FOREIGN KEY (`student_id`) REFERENCES `student` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_achievement`
--

LOCK TABLES `student_achievement` WRITE;
/*!40000 ALTER TABLE `student_achievement` DISABLE KEYS */;
/*!40000 ALTER TABLE `student_achievement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_attendance`
--

DROP TABLE IF EXISTS `student_attendance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student_attendance` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `student_id` int(6) NOT NULL,
  `date` date NOT NULL,
  `created_on` datetime NOT NULL,
  `updated_on` datetime NOT NULL,
  `deleted_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `student_id` (`student_id`,`date`),
  CONSTRAINT `student_attendance_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `student` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_attendance`
--

LOCK TABLES `student_attendance` WRITE;
/*!40000 ALTER TABLE `student_attendance` DISABLE KEYS */;
INSERT INTO `student_attendance` VALUES (1,52,'2019-09-26','2019-09-27 00:00:00','2019-09-27 00:00:00',NULL),(2,52,'2019-09-27','2019-09-27 00:00:00','2019-09-27 00:00:00',NULL),(8,52,'2019-09-28','2019-09-28 20:49:50','2019-09-28 20:49:50',NULL),(9,53,'2019-09-28','2019-09-28 20:51:52','2019-09-28 20:51:52',NULL),(10,53,'2019-09-29','2019-09-29 04:43:55','2019-09-29 04:43:55',NULL),(11,52,'2019-09-30','2019-09-30 19:55:22','2019-09-30 19:55:22',NULL),(12,52,'2019-10-03','2019-10-03 06:21:54','2019-10-03 06:21:54',NULL),(13,52,'2019-10-01','2019-10-04 21:32:00','2019-10-04 21:32:00',NULL),(14,53,'2019-10-01','2019-10-04 21:32:03','2019-10-04 21:32:03',NULL),(17,53,'2019-10-02','2019-10-04 21:32:22','2019-10-04 21:32:22',NULL),(18,53,'2019-10-03','2019-10-04 21:32:30','2019-10-04 21:32:30',NULL),(19,52,'2019-10-04','2019-10-04 21:32:50','2019-10-04 21:32:50',NULL),(20,52,'2019-10-15','2019-10-22 23:48:05','2019-10-22 23:48:05',NULL),(21,52,'2019-11-20','2019-11-20 19:12:23','2019-11-20 19:12:23',NULL),(22,53,'2019-11-20','2019-11-20 19:18:07','2019-11-20 19:18:07',NULL),(25,53,'2019-11-21','2019-11-21 00:55:22','2019-11-21 00:55:22',NULL),(26,52,'2019-11-22','2019-11-22 18:02:52','2019-11-22 18:02:52',NULL),(27,53,'2019-11-22','2019-11-22 18:02:56','2019-11-22 18:02:56',NULL),(29,64,'2019-11-22','2019-11-22 18:36:24','2019-11-22 18:36:24',NULL),(30,52,'2019-11-23','2019-11-23 00:06:20','2019-11-23 00:06:20',NULL),(31,64,'2019-11-23','2019-11-23 00:06:25','2019-11-23 00:06:25',NULL),(32,52,'2019-11-24','2019-11-24 04:18:30','2019-11-24 04:18:30',NULL),(33,53,'2019-11-24','2019-11-24 04:18:34','2019-11-24 04:18:34',NULL),(34,64,'2019-11-24','2019-11-24 04:18:46','2019-11-24 04:18:46',NULL),(36,64,'2019-11-25','2019-12-01 15:13:43','2019-12-01 15:13:43',NULL),(38,64,'2019-11-26','2019-12-01 15:13:54','2019-12-01 15:13:54',NULL),(40,64,'2019-11-27','2019-12-01 15:14:03','2019-12-01 15:14:03',NULL),(41,64,'2019-11-28','2019-12-01 15:14:07','2019-12-01 15:14:07',NULL),(44,64,'2019-11-30','2019-12-01 15:14:16','2019-12-01 15:14:16',NULL),(45,53,'2019-12-08','2019-12-08 20:44:16','2019-12-08 20:44:16',NULL),(49,53,'2019-12-09','2019-12-09 01:11:52','2019-12-09 01:11:52',NULL),(52,53,'2019-12-10','2019-12-10 00:40:33','2019-12-10 00:40:33',NULL),(63,52,'2020-01-08','2020-01-08 16:57:07','2020-01-08 16:57:07',NULL);
/*!40000 ALTER TABLE `student_attendance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_has_class`
--

DROP TABLE IF EXISTS `student_has_class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student_has_class` (
  `id` int(3) NOT NULL AUTO_INCREMENT,
  `student_id` int(6) NOT NULL,
  `class_id` int(3) NOT NULL,
  `index_no` int(2) NOT NULL,
  `created_on` datetime NOT NULL,
  `updated_on` datetime NOT NULL,
  `deleted_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `class_id` (`class_id`,`index_no`),
  UNIQUE KEY `student_id` (`student_id`,`class_id`),
  CONSTRAINT `student_has_class_ibfk_1` FOREIGN KEY (`class_id`) REFERENCES `class` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `student_has_class_ibfk_2` FOREIGN KEY (`student_id`) REFERENCES `student` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `student_has_class_ibfk_3` FOREIGN KEY (`class_id`) REFERENCES `student` (`class_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_has_class`
--

LOCK TABLES `student_has_class` WRITE;
/*!40000 ALTER TABLE `student_has_class` DISABLE KEYS */;
INSERT INTO `student_has_class` VALUES (12,52,15,1,'2019-09-23 09:33:17','2020-01-05 05:35:04',NULL),(13,53,15,2,'2019-09-26 18:36:24','2019-12-29 03:35:45',NULL),(16,64,15,3,'2019-11-22 18:35:43','2019-11-22 18:35:43',NULL),(18,66,15,4,'2019-11-24 02:58:27','2019-11-24 02:58:27',NULL),(19,67,16,1,'2019-12-04 04:08:41','2019-12-04 04:08:41',NULL);
/*!40000 ALTER TABLE `student_has_class` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_has_exam_schedule`
--

DROP TABLE IF EXISTS `student_has_exam_schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student_has_exam_schedule` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `student_id` int(6) NOT NULL,
  `exam_schedule_id` int(4) NOT NULL,
  `marks` varchar(3) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_on` datetime NOT NULL,
  `updated_on` datetime NOT NULL,
  `deleted_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `student_id` (`student_id`,`exam_schedule_id`),
  KEY `exam_schedule_id` (`exam_schedule_id`),
  CONSTRAINT `student_has_exam_schedule_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `student` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `student_has_exam_schedule_ibfk_2` FOREIGN KEY (`exam_schedule_id`) REFERENCES `exam_grade_has_schedule` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_has_exam_schedule`
--

LOCK TABLES `student_has_exam_schedule` WRITE;
/*!40000 ALTER TABLE `student_has_exam_schedule` DISABLE KEYS */;
INSERT INTO `student_has_exam_schedule` VALUES (25,64,77,'85','2019-12-08 13:52:12','2019-12-12 07:10:48',NULL),(27,64,78,'20','2019-12-08 13:54:12','2019-12-08 13:54:12',NULL),(28,67,77,'40','2019-12-27 00:00:00','2019-12-27 00:00:00',NULL),(29,52,79,'60','2020-01-08 00:04:17','2020-01-08 00:04:17',NULL),(32,53,82,'50','2020-01-08 00:05:26','2020-01-08 00:05:26',NULL),(33,64,82,'70','2020-01-08 00:05:26','2020-01-08 18:11:56',NULL),(36,52,85,'69','2020-01-08 17:25:34','2020-01-08 18:12:44',NULL),(37,52,86,'75','2020-01-08 17:29:59','2020-01-08 17:29:59',NULL),(38,52,87,NULL,'2020-01-10 22:48:36','2020-01-10 22:48:36',NULL),(39,53,87,NULL,'2020-01-10 22:48:36','2020-01-10 22:48:36',NULL),(40,64,87,NULL,'2020-01-10 22:48:36','2020-01-10 22:48:36',NULL),(41,66,87,NULL,'2020-01-10 22:48:36','2020-01-10 22:48:36',NULL);
/*!40000 ALTER TABLE `student_has_exam_schedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_has_parent`
--

DROP TABLE IF EXISTS `student_has_parent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student_has_parent` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `student_id` int(6) NOT NULL,
  `parent_id` int(7) NOT NULL,
  `relation_id` int(2) NOT NULL,
  `created_on` datetime NOT NULL,
  `updated_on` datetime NOT NULL,
  `deleted_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `student_id` (`student_id`,`parent_id`),
  KEY `parent_id` (`parent_id`),
  KEY `relation_id` (`relation_id`),
  CONSTRAINT `student_has_parent_ibfk_1` FOREIGN KEY (`parent_id`) REFERENCES `parent` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `student_has_parent_ibfk_2` FOREIGN KEY (`student_id`) REFERENCES `student` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `student_has_parent_ibfk_3` FOREIGN KEY (`relation_id`) REFERENCES `relation_type` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_has_parent`
--

LOCK TABLES `student_has_parent` WRITE;
/*!40000 ALTER TABLE `student_has_parent` DISABLE KEYS */;
INSERT INTO `student_has_parent` VALUES (47,52,4,2,'2019-09-23 09:33:17','2019-09-23 09:33:17',NULL),(48,53,4,2,'2019-09-26 18:36:24','2019-09-26 18:36:24',NULL),(49,52,5,1,'2019-09-26 23:54:13','2019-09-26 23:54:13',NULL),(57,64,11,2,'2019-11-22 18:35:43','2019-11-22 18:35:43',NULL),(59,66,13,1,'2019-11-24 02:58:27','2019-11-24 02:58:27',NULL),(60,64,14,1,'2019-11-24 03:15:42','2019-11-24 03:15:42',NULL),(61,67,15,1,'2019-12-04 04:08:41','2019-12-04 04:08:41',NULL);
/*!40000 ALTER TABLE `student_has_parent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_has_sport`
--

DROP TABLE IF EXISTS `student_has_sport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student_has_sport` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `student_id` int(6) NOT NULL,
  `sport_id` int(3) NOT NULL,
  `created_on` datetime NOT NULL,
  `updated_on` datetime NOT NULL,
  `deleted_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sport_id` (`sport_id`,`student_id`),
  KEY `student_has_sport_student_id_fk` (`student_id`),
  CONSTRAINT `student_has_sport_sport_id_fk` FOREIGN KEY (`sport_id`) REFERENCES `sport` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `student_has_sport_student_id_fk` FOREIGN KEY (`student_id`) REFERENCES `student` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=115 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_has_sport`
--

LOCK TABLES `student_has_sport` WRITE;
/*!40000 ALTER TABLE `student_has_sport` DISABLE KEYS */;
INSERT INTO `student_has_sport` VALUES (83,53,2,'2019-12-14 21:59:42','2019-12-14 21:59:42',NULL),(84,53,5,'2019-12-14 21:59:42','2019-12-14 21:59:42',NULL),(112,52,4,'2020-01-08 18:35:40','2020-01-08 18:35:40',NULL),(113,52,1,'2020-01-08 18:35:41','2020-01-08 18:35:41',NULL),(114,52,2,'2020-01-08 18:35:41','2020-01-08 18:35:41',NULL);
/*!40000 ALTER TABLE `student_has_sport` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_has_sport_achievement`
--

DROP TABLE IF EXISTS `student_has_sport_achievement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student_has_sport_achievement` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `student_sport_id` int(8) NOT NULL,
  `title` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT 'NULL',
  `achieved_on` date NOT NULL,
  `created_on` datetime NOT NULL,
  `updated_on` datetime NOT NULL,
  `deleted_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `student_has_sport_achievement_ibfk_1` (`student_sport_id`),
  CONSTRAINT `student_has_sport_achievement_ibfk_1` FOREIGN KEY (`student_sport_id`) REFERENCES `student_has_sport` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_has_sport_achievement`
--

LOCK TABLES `student_has_sport_achievement` WRITE;
/*!40000 ALTER TABLE `student_has_sport_achievement` DISABLE KEYS */;
/*!40000 ALTER TABLE `student_has_sport_achievement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_has_subject`
--

DROP TABLE IF EXISTS `student_has_subject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student_has_subject` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `student_id` int(6) NOT NULL,
  `subject_id` int(3) NOT NULL,
  `created_on` datetime NOT NULL,
  `updated_on` datetime NOT NULL,
  `deleted_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `student_id` (`student_id`,`subject_id`),
  KEY `student_has_subject_ibfk_2` (`subject_id`),
  CONSTRAINT `student_has_subject_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `student` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `student_has_subject_ibfk_2` FOREIGN KEY (`subject_id`) REFERENCES `subject` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_has_subject`
--

LOCK TABLES `student_has_subject` WRITE;
/*!40000 ALTER TABLE `student_has_subject` DISABLE KEYS */;
INSERT INTO `student_has_subject` VALUES (18,52,1,'2019-10-02 15:57:50','2019-10-02 15:57:50',NULL),(19,52,5,'2019-10-02 15:57:52','2019-10-02 15:57:52',NULL),(20,53,1,'2019-10-02 17:10:14','2019-10-02 17:10:14',NULL),(21,53,2,'2019-10-02 17:10:27','2019-10-02 17:10:27',NULL),(22,53,5,'2019-10-02 17:10:29','2019-10-02 17:10:29',NULL),(23,52,2,'2019-10-02 18:27:51','2019-10-02 18:27:51',NULL),(24,52,4,'2019-10-02 20:06:20','2019-10-02 20:06:20',NULL),(25,52,10,'2019-12-01 15:16:59','2019-12-01 15:16:59',NULL),(26,52,9,'2019-12-01 15:17:03','2019-12-01 15:17:03',NULL),(27,52,6,'2019-12-01 15:17:07','2019-12-01 15:17:07',NULL);
/*!40000 ALTER TABLE `student_has_subject` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_health`
--

DROP TABLE IF EXISTS `student_health`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student_health` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` int(6) NOT NULL,
  `heart_rate` int(3) DEFAULT NULL,
  `blood_pressure` int(3) DEFAULT NULL,
  `height` int(3) DEFAULT NULL,
  `weight` int(3) DEFAULT NULL,
  `bmi` float(4,2) DEFAULT NULL,
  `vaccination` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `speciality` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date` date NOT NULL,
  `blood_group` enum('A+','A-','B+','B-','AB+','AB-','O+','O-') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `surgeries` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_on` datetime NOT NULL,
  `updated_on` datetime NOT NULL,
  `deleted_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `student_id` (`student_id`),
  CONSTRAINT `student_health_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `student` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_health`
--

LOCK TABLES `student_health` WRITE;
/*!40000 ALTER TABLE `student_health` DISABLE KEYS */;
INSERT INTO `student_health` VALUES (1,52,85,95,160,55,21.48,NULL,'Spectacles','2019-11-22','A+',NULL,'2019-11-22 00:00:00','2019-12-14 22:14:32',NULL),(3,53,56,98,140,45,22.96,NULL,NULL,'2019-11-22','B+',NULL,'2019-11-22 00:00:00','2020-01-08 18:40:05',NULL),(21,64,NULL,NULL,159,50,19.78,NULL,NULL,'2019-12-11','O+',NULL,'2019-12-11 03:54:29','2020-01-08 18:39:27',NULL),(23,66,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-12-11','A+',NULL,'2019-12-11 05:13:01','2019-12-14 22:14:33',NULL),(24,67,NULL,NULL,125,NULL,NULL,NULL,NULL,'2019-12-11',NULL,NULL,'2019-12-11 05:13:16','2019-12-14 22:14:33',NULL);
/*!40000 ALTER TABLE `student_health` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subject`
--

DROP TABLE IF EXISTS `subject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subject` (
  `id` int(3) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `si_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_on` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_on` datetime NOT NULL DEFAULT current_timestamp(),
  `deleted_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subject`
--

LOCK TABLES `subject` WRITE;
/*!40000 ALTER TABLE `subject` DISABLE KEYS */;
INSERT INTO `subject` VALUES (1,'English','ඉංග්‍රීසි','2019-09-21 04:28:43','2019-12-09 18:43:48',NULL),(2,'Sinhala',NULL,'2019-09-21 04:32:43','2019-09-21 04:32:43',NULL),(3,'Catholic',NULL,'2019-09-21 04:53:19','2019-09-21 04:53:19',NULL),(4,'Tamil',NULL,'2019-09-22 00:22:56','2019-09-22 00:22:56',NULL),(5,'Maths',NULL,'2019-09-22 00:23:31','2019-09-22 00:23:31',NULL),(6,'Science','විද්‍යාව','2019-12-01 15:00:36','2019-12-01 15:00:36',NULL),(7,'History','ඉතිහාසය','2019-12-01 15:01:00','2019-12-01 15:01:00',NULL),(8,'Geography','භූගෝල විද්‍යාව','2019-12-01 15:02:39','2019-12-09 18:43:34',NULL),(9,'Civilization',NULL,'2019-12-01 15:02:51','2019-12-01 15:02:51',NULL),(10,'Buddhism',NULL,'2019-12-01 15:03:05','2019-12-01 15:03:05',NULL),(12,'English Literature',NULL,'2019-12-06 02:10:50','2019-12-06 02:10:50',NULL);
/*!40000 ALTER TABLE `subject` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(7) NOT NULL AUTO_INCREMENT,
  `ref_id` int(6) DEFAULT NULL,
  `user_type` enum('staff','student','parent','coach') COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `theme` enum('Default','Dark') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Default',
  `role_id` int(2) NOT NULL,
  `status` enum('Active','Deactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Active',
  `remember_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_on` datetime NOT NULL,
  `updated_on` datetime NOT NULL,
  `deleted_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ref_id` (`ref_id`,`user_type`),
  UNIQUE KEY `username` (`username`),
  KEY `user_user_role_id_fk` (`role_id`),
  CONSTRAINT `user_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `user_role` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (3,1,'staff','lakmal','$2y$10$72qY0SygOrhWp4hehoDFZOV8VcByHEjl1SViRuj5QKQs4lsP5UUaa','Default',1,'Active','5442e353b7248016f3d065ce95504a93','2019-10-08 00:00:00','2020-01-10 22:47:10',NULL),(5,53,'student','shyamin','$2y$10$TGrFl9HtmAUSKzOjcQ.zx.az1N3mDY5AX7z33y5smUT8c/OyW0krS','Default',3,'Active',NULL,'2019-12-18 00:00:00','2020-01-08 04:10:43',NULL),(7,52,'student','stulakmal','$2y$10$.jLcTxrYLJUd0CKIWvYnQulqVb4B7egrJI0SIwtKvOmrMPE0TpePa','Default',3,'Active',NULL,'2019-12-29 18:31:16','2020-01-05 05:35:04',NULL),(8,3,'coach','sangeeth','$2y$10$dVL711S6lHNivFYk3Vtg9eX6gp8yuhtl7e5ObCHLcmRz62TSuU24K','Default',5,'Active',NULL,'2019-12-29 21:22:18','2020-01-05 05:34:42',NULL),(10,4,'parent','mallika','$2y$10$fA27.FLrpNuHT1wY2WoRv..EGGiV1Xsn22lFSyj036G2XI4do4q8u','Default',4,'Active',NULL,'2020-01-01 02:17:39','2020-01-08 02:42:25',NULL),(11,8,'staff','laksara','$2y$10$e5fR35yL6rxbGXUiEf1.huMCSm2xtbcC4d4CnhExT4iooYktQMEy.','Default',2,'Deactive',NULL,'2020-01-05 03:34:07','2020-01-05 03:35:31',NULL),(13,3,'staff','sehani','$2y$10$ru/Y8x1He9G0m3aM.9rZMuts/moLZQ5aVKLic73hdssE56KSTtX4K','Default',6,'Deactive',NULL,'2020-01-05 05:09:31','2020-01-05 05:09:31',NULL),(14,5,'parent','lakshman','$2y$10$ymjqK/va2fr4vRn4yJHEReqJY9u3rDMFcgf/eiFyehYuWV34zaIlW','Default',4,'Active',NULL,'2020-01-05 05:11:39','2020-01-05 05:11:39',NULL),(15,67,'student','rivindu','$2y$10$8X9GlcM1cX.JIFppI5yPseF/KueG6WQZYXvGm1ndbg3xea2Y2Qa7u','Default',3,'Active',NULL,'2020-01-05 05:17:58','2020-01-05 05:17:58',NULL),(17,13,'parent','rukshan','$2y$10$V5G0IP3WWre8oYtqN72YvOPXhuNdg53USeMQadTOiT3sDXjbamCDa','Default',4,'Active',NULL,'2020-01-08 16:34:08','2020-01-08 16:34:08',NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_permission`
--

DROP TABLE IF EXISTS `user_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_permission` (
  `id` int(3) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `module` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_on` datetime NOT NULL,
  `updated_on` datetime NOT NULL,
  `deleted_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `type` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=105 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_permission`
--

LOCK TABLES `user_permission` WRITE;
/*!40000 ALTER TABLE `user_permission` DISABLE KEYS */;
INSERT INTO `user_permission` VALUES (1,'home-index-view','home',NULL,'2020-01-09 00:00:00','2020-01-09 00:00:00',NULL),(2,'attendance-index-view','attendance',NULL,'2019-01-09 00:00:00','2019-01-09 00:00:00',NULL),(3,'attendance-mark-view','attendance',NULL,'2019-01-09 00:00:00','2019-01-09 00:00:00',NULL),(4,'attendance-search-view','attendance',NULL,'2019-01-09 00:00:00','2019-01-09 00:00:00',NULL),(5,'backup-index-view','backup',NULL,'2019-01-09 00:00:00','2019-01-09 00:00:00',NULL),(6,'exam-index-view','exam',NULL,'2019-01-09 00:00:00','2019-01-09 00:00:00',NULL),(7,'exam-create-view','exam',NULL,'2019-01-09 00:00:00','2019-01-09 00:00:00',NULL),(8,'exam-search-view','exam',NULL,'2019-01-09 00:00:00','2019-01-09 00:00:00',NULL),(9,'health-index-view','health',NULL,'2019-01-09 00:00:00','2019-01-09 00:00:00',NULL),(10,'health-add-view','health',NULL,'2019-01-09 00:00:00','2019-01-09 00:00:00',NULL),(11,'health-search-view','health',NULL,'2019-01-09 00:00:00','2019-01-09 00:00:00',NULL),(12,'messages-index-view','messages',NULL,'2019-01-09 00:00:00','2019-01-09 00:00:00',NULL),(13,'messages-single-view','messages',NULL,'2019-01-09 00:00:00','2019-01-09 00:00:00',NULL),(14,'parents-index-view','parent',NULL,'2019-01-09 00:00:00','2019-01-09 00:00:00',NULL),(15,'parents-add-view','parent',NULL,'2019-01-09 00:00:00','2019-01-09 00:00:00',NULL),(16,'parents-profile-view','parent',NULL,'2019-01-09 00:00:00','2019-01-09 00:00:00',NULL),(17,'parents-search-view','parent',NULL,'2019-01-09 00:00:00','2019-01-09 00:00:00',NULL),(18,'portal-messages-view','portal',NULL,'2019-01-09 00:00:00','2019-01-09 00:00:00',NULL),(19,'portal-parent-view','portal',NULL,'2019-01-09 00:00:00','2019-01-09 00:00:00',NULL),(20,'portal-single-view','portal',NULL,'2019-01-09 00:00:00','2019-01-09 00:00:00',NULL),(21,'portal-student-view','portal',NULL,'2019-01-09 00:00:00','2019-01-09 00:00:00',NULL),(22,'report-attendance-view','report',NULL,'2019-01-09 00:00:00','2019-01-09 00:00:00',NULL),(23,'report-health-view','report',NULL,'2019-01-09 00:00:00','2019-01-09 00:00:00',NULL),(24,'report-result-view','report',NULL,'2019-01-09 00:00:00','2019-01-09 00:00:00',NULL),(25,'report-staff-view','report',NULL,'2019-01-09 00:00:00','2019-01-09 00:00:00',NULL),(26,'report-student-view','report',NULL,'2019-01-09 00:00:00','2019-01-09 00:00:00',NULL),(27,'report-timetable-view','report',NULL,'2019-01-09 00:00:00','2019-01-09 00:00:00',NULL),(28,'result-index-view','result',NULL,'2019-01-09 00:00:00','2019-01-09 00:00:00',NULL),(29,'result-add-view','result',NULL,'2019-01-09 00:00:00','2019-01-09 00:00:00',NULL),(30,'result-search-view','result',NULL,'2019-01-09 00:00:00','2019-01-09 00:00:00',NULL),(31,'management-index-view','management',NULL,'2019-01-09 00:00:00','2019-01-09 00:00:00',NULL),(32,'sport-index-view','sport',NULL,'2019-01-09 00:00:00','2019-01-09 00:00:00',NULL),(33,'sport-add_coach-view','sport',NULL,'2019-01-09 00:00:00','2019-01-09 00:00:00',NULL),(34,'sport-assign-view','sport',NULL,'2019-01-09 00:00:00','2019-01-09 00:00:00',NULL),(35,'sport-profile_coach-view','sport',NULL,'2019-01-09 00:00:00','2019-01-09 00:00:00',NULL),(36,'sport-search_coach-view','sport',NULL,'2019-01-09 00:00:00','2019-01-09 00:00:00',NULL),(37,'sport-search_student-view','sport',NULL,'2019-01-09 00:00:00','2019-01-09 00:00:00',NULL),(38,'staff-index-view','staff',NULL,'2019-01-09 00:00:00','2019-01-09 00:00:00',NULL),(39,'staff-add-view','staff',NULL,'2019-01-09 00:00:00','2019-01-09 00:00:00',NULL),(40,'staff-profile-view','staff',NULL,'2019-01-09 00:00:00','2019-01-09 00:00:00',NULL),(41,'staff-search-view','staff',NULL,'2019-01-09 00:00:00','2019-01-09 00:00:00',NULL),(42,'student-index-view','student',NULL,'2019-01-09 00:00:00','2019-01-09 00:00:00',NULL),(43,'student-add-view','student',NULL,'2019-01-09 00:00:00','2019-01-09 00:00:00',NULL),(44,'student-profile-view','student',NULL,'2019-01-09 00:00:00','2019-01-09 00:00:00',NULL),(45,'student-search-view','student',NULL,'2019-01-09 00:00:00','2019-01-09 00:00:00',NULL),(46,'timetable-index-view','timetable',NULL,'2019-01-09 00:00:00','2019-01-09 00:00:00',NULL),(47,'timetable-class_timetable-view','timetable',NULL,'2019-01-09 00:00:00','2019-01-09 00:00:00',NULL),(48,'timetable-create-view','timetable',NULL,'2019-01-09 00:00:00','2019-01-09 00:00:00',NULL),(49,'timetable-staff_timetable-view','timetable',NULL,'2019-01-09 00:00:00','2019-01-09 00:00:00',NULL),(50,'user-index-view','user',NULL,'2019-01-09 00:00:00','2019-01-09 00:00:00',NULL),(51,'user-permission-view','user',NULL,'2019-01-09 00:00:00','2019-01-09 00:00:00',NULL),(52,'user-search-view','user',NULL,'2019-01-09 00:00:00','2019-01-09 00:00:00',NULL),(53,'student-profile-edit-propic','student',NULL,'2019-01-10 00:00:00','2019-01-10 00:00:00',NULL),(54,'staff-profile-edit-propic','staff',NULL,'2019-01-10 00:00:00','2019-01-10 00:00:00',NULL),(55,'coach-profile-edit-propic','coach',NULL,'2019-01-10 00:00:00','2019-01-10 00:00:00',NULL),(56,'parents-profile-edit-propic','parent',NULL,'2019-01-10 00:00:00','2019-01-10 00:00:00',NULL),(57,'attendance-search-view-student','attendance',NULL,'2019-01-10 00:00:00','2019-01-10 00:00:00',NULL),(58,'attendance-search-view-staff','attendance',NULL,'2019-01-10 00:00:00','2019-01-10 00:00:00',NULL),(59,'attendance-mark-view-staff','attendance',NULL,'2019-01-10 00:00:00','2019-01-10 00:00:00',NULL),(60,'attendance-mark-view-student','attendance',NULL,'2019-01-10 00:00:00','2019-01-10 00:00:00',NULL),(61,'exam-search-edit-exam','exam',NULL,'2019-01-10 00:00:00','2019-01-10 00:00:00',NULL),(62,'result-search-edit-result','result',NULL,'2019-01-10 00:00:00','2019-01-10 00:00:00',NULL),(63,'result-search-delete-result','result',NULL,'2020-01-10 00:00:00','2020-01-10 00:00:00',NULL),(64,'exam-search-delete-exam','exam',NULL,'2020-01-10 00:00:00','2020-01-10 00:00:00',NULL),(65,'exam-create-edit-exam_type','exam',NULL,'2020-01-09 00:00:00','2020-01-09 00:00:00',NULL),(66,'exam-create-add-exam_type','exam',NULL,'2020-01-10 00:00:00','2020-01-10 00:00:00',NULL),(67,'student-sport-delete','student',NULL,'2020-01-08 00:00:00','2020-01-08 00:00:00',NULL),(68,'coach-profile-view','coach',NULL,'2020-01-09 00:00:00','2020-01-09 00:00:00',NULL),(69,'health-search-edit','health',NULL,'2020-01-10 00:00:00','2020-01-10 00:00:00',NULL),(70,'health-search-delete','health',NULL,'2020-01-10 00:00:00','2020-01-10 00:00:00',NULL),(71,'report-any-generate','report',NULL,'2020-01-10 00:00:00','2020-01-10 00:00:00',NULL),(72,'report-any-view','report',NULL,'2020-01-10 00:00:00','2020-01-10 00:00:00',NULL),(73,'report-any-delete','report',NULL,'2020-01-10 00:00:00','2020-01-10 00:00:00',NULL),(74,'student-profile-edit','student',NULL,'2020-01-09 00:00:00','2020-01-09 00:00:00',NULL),(75,'staff-profile-edit','staff',NULL,'2020-01-09 00:00:00','2020-01-09 00:00:00',NULL),(76,'coach-profile-edit','coach',NULL,'2020-01-09 00:00:00','2020-01-09 00:00:00',NULL),(77,'parents-profile-edit','parent',NULL,'2020-01-09 00:00:00','2020-01-09 00:00:00',NULL),(78,'student-profile-delete','student',NULL,'2020-01-10 00:00:00','2020-01-10 00:00:00',NULL),(79,'staff-profile-delete','staff',NULL,'2020-01-10 00:00:00','2020-01-10 00:00:00',NULL),(80,'parents-profile-delete','parent',NULL,'2020-01-10 00:00:00','2020-01-10 00:00:00',NULL),(81,'coach-profile-delete','coach',NULL,'2020-01-10 00:00:00','2020-01-10 00:00:00',NULL),(82,'exam-create-delete-exam_type','exam',NULL,'2020-01-10 00:00:00','2020-01-10 00:00:00',NULL),(83,'exam-create-add-schedule','exam',NULL,'2020-01-10 00:00:00','2020-01-10 00:00:00',NULL),(84,'exam-create-edit-schedule','exam',NULL,'2020-01-10 00:00:00','2020-01-10 00:00:00',NULL),(85,'exam-search-delete-schedule','exam',NULL,'2020-01-10 00:00:00','2020-01-10 00:00:00',NULL),(86,'messages-create-new','messages',NULL,'2020-01-10 00:00:00','2020-01-10 00:00:00',NULL),(87,'messages-conversation-reply','messages',NULL,'2020-01-10 00:00:00','2020-01-10 00:00:00',NULL),(88,'notification-read','notification',NULL,'2020-01-10 00:00:00','2020-01-10 00:00:00',NULL),(89,'notification-delete','notification',NULL,'2020-01-10 00:00:00','2020-01-10 00:00:00',NULL),(90,'user-permission-view-edit','user',NULL,'2020-01-10 00:00:00','2020-01-10 00:00:00',NULL),(91,'portal-student-edit','portal',NULL,'2020-01-10 00:00:00','2020-01-10 00:00:00',NULL),(92,'portal-parent-edit','portal',NULL,'2020-01-10 00:00:00','2020-01-10 00:00:00',NULL),(93,'portal-messages-create-new','portal',NULL,'2020-01-10 00:00:00','2020-01-10 00:00:00',NULL),(94,'portal-messages-conversation-reply','portal',NULL,'2020-01-10 00:00:00','2020-01-10 00:00:00',NULL),(95,'report-any-create','report',NULL,'2020-01-10 00:00:00','2020-01-10 00:00:00',NULL),(96,'management-index-edit-any','management',NULL,'2020-01-10 00:00:00','2020-01-10 00:00:00',NULL),(97,'management-index-delete-any','management',NULL,'2020-01-10 00:00:00','2020-01-10 00:00:00',NULL),(98,'management-index-add-any','management',NULL,'2020-01-10 00:00:00','2020-01-10 00:00:00',NULL),(99,'sport-student-delete','sport',NULL,'2020-01-10 00:00:00','2020-01-10 00:00:00',NULL),(100,'sport-student-edit','sport',NULL,'2020-01-10 00:00:00','2020-01-10 00:00:00',NULL),(101,'timetable-assign-subject','timetable',NULL,'2020-01-10 00:00:00','2020-01-10 00:00:00',NULL),(102,'timetable-assign-staff','timetable',NULL,'2020-01-10 00:00:00','2020-01-10 00:00:00',NULL),(103,'user-edit-theme','user',NULL,'2020-01-10 00:00:00','2020-01-10 00:00:00',NULL),(104,'mobile-schms-api','mobile',NULL,'2020-01-10 00:00:00','2020-01-10 00:00:00',NULL);
/*!40000 ALTER TABLE `user_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_role`
--

DROP TABLE IF EXISTS `user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_role` (
  `id` int(2) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_on` datetime NOT NULL,
  `updated_on` datetime NOT NULL,
  `deleted_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `role` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_role`
--

LOCK TABLES `user_role` WRITE;
/*!40000 ALTER TABLE `user_role` DISABLE KEYS */;
INSERT INTO `user_role` VALUES (1,'System Administrator','This user has full access to this system','2019-09-02 00:00:00','2019-12-09 20:24:26',NULL),(2,'Ordinary Staff',NULL,'2019-11-23 00:00:00','2019-11-23 00:00:00',NULL),(3,'Student',NULL,'2019-12-18 00:00:00','2019-12-18 00:00:00',NULL),(4,'Parent',NULL,'2019-11-23 00:00:00','2019-11-23 00:00:00',NULL),(5,'Coach',NULL,'2019-11-23 00:00:00','2019-11-23 00:00:00',NULL),(6,'Guest Staff','This user has access to sport fields of this system','2019-12-29 21:17:11','2019-12-29 21:17:11',NULL);
/*!40000 ALTER TABLE `user_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_role_has_permission`
--

DROP TABLE IF EXISTS `user_role_has_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_role_has_permission` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `role_id` int(2) NOT NULL,
  `permission_id` int(3) NOT NULL,
  `created_on` datetime NOT NULL,
  `updated_on` datetime NOT NULL,
  `deleted_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `role_id` (`role_id`,`permission_id`),
  KEY `user_role_has_permission_ibfk_1` (`permission_id`),
  CONSTRAINT `user_role_has_permission_ibfk_1` FOREIGN KEY (`permission_id`) REFERENCES `user_permission` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `user_role_has_permission_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `user_role` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=131 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_role_has_permission`
--

LOCK TABLES `user_role_has_permission` WRITE;
/*!40000 ALTER TABLE `user_role_has_permission` DISABLE KEYS */;
INSERT INTO `user_role_has_permission` VALUES (7,1,2,'2020-01-09 14:47:34','2020-01-09 14:47:34',NULL),(8,1,3,'2020-01-09 14:47:39','2020-01-09 14:47:39',NULL),(9,1,4,'2020-01-09 14:49:50','2020-01-09 14:49:50',NULL),(10,1,5,'2020-01-09 16:04:25','2020-01-09 16:04:25',NULL),(13,1,6,'2020-01-09 16:48:56','2020-01-09 16:48:56',NULL),(14,1,8,'2020-01-09 16:49:23','2020-01-09 16:49:23',NULL),(15,1,7,'2020-01-09 17:00:04','2020-01-09 17:00:04',NULL),(21,1,9,'2020-01-09 17:35:07','2020-01-09 17:35:07',NULL),(23,1,11,'2020-01-09 17:35:27','2020-01-09 17:35:27',NULL),(24,1,10,'2020-01-09 17:35:35','2020-01-09 17:35:35',NULL),(27,1,1,'2020-01-09 17:40:16','2020-01-09 17:40:16',NULL),(28,1,12,'2020-01-09 18:16:41','2020-01-09 18:16:41',NULL),(29,1,13,'2020-01-09 18:16:49','2020-01-09 18:16:49',NULL),(30,1,14,'2020-01-09 18:45:48','2020-01-09 18:45:48',NULL),(31,1,17,'2020-01-09 18:46:14','2020-01-09 18:46:14',NULL),(33,1,15,'2020-01-09 18:46:35','2020-01-09 18:46:35',NULL),(34,1,16,'2020-01-09 18:47:25','2020-01-09 18:47:25',NULL),(35,3,18,'2020-01-09 19:11:30','2020-01-09 19:11:30',NULL),(36,3,20,'2020-01-09 19:12:42','2020-01-09 19:12:42',NULL),(37,4,18,'2020-01-09 19:13:22','2020-01-09 19:13:22',NULL),(38,4,20,'2020-01-09 19:14:22','2020-01-09 19:14:22',NULL),(40,3,21,'2020-01-09 19:18:30','2020-01-09 19:18:30',NULL),(41,4,19,'2020-01-09 19:20:53','2020-01-09 19:20:53',NULL),(42,1,22,'2020-01-09 19:59:09','2020-01-09 19:59:09',NULL),(43,1,23,'2020-01-09 19:59:18','2020-01-09 19:59:18',NULL),(44,1,24,'2020-01-09 19:59:21','2020-01-09 19:59:21',NULL),(45,1,25,'2020-01-09 19:59:24','2020-01-09 19:59:24',NULL),(46,1,26,'2020-01-09 19:59:26','2020-01-09 19:59:26',NULL),(47,1,27,'2020-01-09 19:59:28','2020-01-09 19:59:28',NULL),(49,1,29,'2020-01-09 20:06:34','2020-01-09 20:06:34',NULL),(50,1,30,'2020-01-09 20:06:36','2020-01-09 20:06:36',NULL),(51,1,28,'2020-01-09 20:22:05','2020-01-09 20:22:05',NULL),(52,1,31,'2020-01-09 20:22:37','2020-01-09 20:22:37',NULL),(53,1,33,'2020-01-09 20:36:28','2020-01-09 20:36:28',NULL),(54,1,34,'2020-01-09 20:36:36','2020-01-09 20:36:36',NULL),(55,1,32,'2020-01-09 20:36:39','2020-01-09 20:36:39',NULL),(57,1,36,'2020-01-09 20:36:45','2020-01-09 20:36:45',NULL),(58,1,37,'2020-01-09 20:36:48','2020-01-09 20:36:48',NULL),(59,1,35,'2020-01-09 20:38:27','2020-01-09 20:38:27',NULL),(60,1,39,'2020-01-09 20:45:28','2020-01-09 20:45:28',NULL),(63,1,41,'2020-01-09 20:45:37','2020-01-09 20:45:37',NULL),(65,1,38,'2020-01-09 20:57:56','2020-01-09 20:57:56',NULL),(66,1,43,'2020-01-09 21:05:38','2020-01-09 21:05:38',NULL),(67,1,42,'2020-01-09 21:05:41','2020-01-09 21:05:41',NULL),(69,1,45,'2020-01-09 21:05:46','2020-01-09 21:05:46',NULL),(70,1,47,'2020-01-09 21:13:13','2020-01-09 21:13:13',NULL),(71,1,48,'2020-01-09 21:13:17','2020-01-09 21:13:17',NULL),(72,1,46,'2020-01-09 21:13:19','2020-01-09 21:13:19',NULL),(73,1,49,'2020-01-09 21:13:21','2020-01-09 21:13:21',NULL),(74,1,50,'2020-01-09 22:34:49','2020-01-09 22:34:49',NULL),(75,1,51,'2020-01-09 22:36:11','2020-01-09 22:36:11',NULL),(76,1,52,'2020-01-09 22:36:37','2020-01-09 22:36:37',NULL),(77,1,54,'2020-01-10 05:21:25','2020-01-10 05:21:25',NULL),(78,1,58,'2020-01-10 06:15:52','2020-01-10 06:15:52',NULL),(79,1,62,'2020-01-10 07:31:31','2020-01-10 07:31:31',NULL),(80,1,59,'2020-01-10 07:31:48','2020-01-10 07:31:48',NULL),(81,1,57,'2020-01-10 07:31:49','2020-01-10 07:31:49',NULL),(82,1,60,'2020-01-10 07:31:50','2020-01-10 07:31:50',NULL),(84,1,53,'2020-01-10 07:31:58','2020-01-10 07:31:58',NULL),(85,1,55,'2020-01-10 07:32:07','2020-01-10 07:32:07',NULL),(86,1,56,'2020-01-10 07:33:34','2020-01-10 07:33:34',NULL),(87,1,63,'2020-01-10 07:41:07','2020-01-10 07:41:07',NULL),(89,1,65,'2020-01-10 07:57:27','2020-01-10 07:57:27',NULL),(90,1,66,'2020-01-10 07:59:30','2020-01-10 07:59:30',NULL),(91,1,64,'2020-01-10 07:59:34','2020-01-10 07:59:34',NULL),(92,1,61,'2020-01-10 08:01:43','2020-01-10 08:01:43',NULL),(93,1,44,'2020-01-10 08:08:17','2020-01-10 08:08:17',NULL),(94,1,67,'2020-01-10 08:13:31','2020-01-10 08:13:31',NULL),(96,1,68,'2020-01-10 08:19:23','2020-01-10 08:19:23',NULL),(97,1,69,'2020-01-10 08:25:07','2020-01-10 08:25:07',NULL),(98,1,70,'2020-01-10 08:26:02','2020-01-10 08:26:02',NULL),(99,1,40,'2020-01-10 08:35:38','2020-01-10 08:35:38',NULL),(101,1,71,'2020-01-10 09:15:07','2020-01-10 09:15:07',NULL),(102,1,72,'2020-01-10 09:15:16','2020-01-10 09:15:16',NULL),(103,1,73,'2020-01-10 09:15:20','2020-01-10 09:15:20',NULL),(104,1,76,'2020-01-10 15:00:32','2020-01-10 15:00:32',NULL),(105,1,74,'2020-01-10 15:01:00','2020-01-10 15:01:00',NULL),(106,1,78,'2020-01-10 15:01:10','2020-01-10 15:01:10',NULL),(107,1,81,'2020-01-10 15:21:52','2020-01-10 15:21:52',NULL),(108,1,82,'2020-01-10 16:54:40','2020-01-10 16:54:40',NULL),(109,1,90,'2020-01-10 00:00:00','2020-01-10 00:00:00',NULL),(110,1,104,'2020-01-10 20:04:25','2020-01-10 20:04:25',NULL),(111,1,98,'2020-01-10 20:30:47','2020-01-10 20:30:47',NULL),(112,1,97,'2020-01-10 20:30:49','2020-01-10 20:30:49',NULL),(113,1,96,'2020-01-10 20:30:51','2020-01-10 20:30:51',NULL),(114,1,83,'2020-01-10 22:45:59','2020-01-10 22:45:59',NULL),(115,1,84,'2020-01-10 22:46:01','2020-01-10 22:46:01',NULL),(116,1,85,'2020-01-10 22:46:03','2020-01-10 22:46:03',NULL),(117,1,87,'2020-01-10 22:46:07','2020-01-10 22:46:07',NULL),(118,1,86,'2020-01-10 22:46:10','2020-01-10 22:46:10',NULL),(119,1,89,'2020-01-10 22:46:14','2020-01-10 22:46:14',NULL),(120,1,88,'2020-01-10 22:46:17','2020-01-10 22:46:17',NULL),(121,1,99,'2020-01-10 22:46:22','2020-01-10 22:46:22',NULL),(122,1,80,'2020-01-10 22:46:26','2020-01-10 22:46:26',NULL),(123,1,77,'2020-01-10 22:46:28','2020-01-10 22:46:28',NULL),(124,1,100,'2020-01-10 22:46:33','2020-01-10 22:46:33',NULL),(125,1,75,'2020-01-10 22:46:36','2020-01-10 22:46:36',NULL),(126,1,79,'2020-01-10 22:46:38','2020-01-10 22:46:38',NULL),(127,1,102,'2020-01-10 22:46:42','2020-01-10 22:46:42',NULL),(128,1,101,'2020-01-10 22:46:45','2020-01-10 22:46:45',NULL),(130,1,103,'2020-01-10 22:47:06','2020-01-10 22:47:06',NULL);
/*!40000 ALTER TABLE `user_role_has_permission` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-01-10 23:21:16

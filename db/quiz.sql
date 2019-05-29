CREATE DATABASE  IF NOT EXISTS `quiz` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `quiz`;
-- MySQL dump 10.13  Distrib 5.6.13, for Win32 (x86)
--
-- Host: localhost    Database: quiz
-- ------------------------------------------------------
-- Server version	5.5.37

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `answer`
--

DROP TABLE IF EXISTS `answer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `answer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question_id` int(11) NOT NULL,
  `content` varchar(500) DEFAULT NULL,
  `true_answer` int(11) DEFAULT NULL,
  `status` varchar(45) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `answer`
--

LOCK TABLES `answer` WRITE;
/*!40000 ALTER TABLE `answer` DISABLE KEYS */;
INSERT INTO `answer` VALUES (1,1,'zxcxzc',0,'1'),(2,1,'czxcxz',1,'1'),(3,1,'czxczx',1,'1'),(4,2,'Answer1',1,'1'),(5,2,'Answer2',0,'1'),(6,2,'Answer3',0,'1'),(7,3,'czxczx',0,'1'),(8,3,'cxzczx',1,'1'),(9,3,'xzzz',0,'1'),(10,4,'dasda',0,'1'),(11,4,'dasdas',1,'1'),(12,4,'dssds',0,'1'),(13,5,'cs',1,'1'),(14,5,'cs1',0,'1'),(15,6,'cs',1,'1'),(16,5,'cs2',0,'1'),(17,6,'cs1',0,'1'),(18,7,'cs',1,'1'),(19,6,'cs2',0,'1'),(20,7,'cs1',0,'1'),(21,7,'cs2',0,'1'),(22,8,'111',0,'1'),(23,8,'11111',1,'1'),(24,8,'32',0,'1'),(25,9,'111',0,'1'),(26,9,'11111',1,'1'),(27,9,'32',0,'1'),(28,10,'cxzcz',0,'1'),(29,10,'cxzcz',0,'1'),(30,10,'cxz',1,'1'),(31,11,'dasdsa',0,'1'),(32,11,'fdsfsd',1,'1'),(33,11,'dasdas',0,'1'),(34,12,'a',0,'1'),(35,12,'b',1,'1'),(36,12,'c',1,'1'),(37,12,'d',0,'1'),(38,13,'dasdas',0,'1'),(39,13,'sdasdas',1,'1'),(40,13,'dasdsad',0,'1'),(41,13,'dasdas',0,'1'),(42,14,'dsfsdfs',1,'1'),(43,14,'fsfsdf',0,'1'),(44,14,'fdsfs',0,'1'),(45,15,'dasdsa',1,'1'),(46,15,'sdasds',0,'1'),(47,16,'dasdsa',1,'1'),(48,15,'dsadas',0,'1'),(49,17,'dasdsa',1,'1'),(50,16,'sdasds',0,'1'),(51,17,'sdasds',0,'1'),(52,16,'dsadas',0,'1'),(53,17,'dsadas',0,'1'),(54,18,'xczc',0,'1'),(55,18,'czxcz',1,'1'),(56,18,'czx',1,'1'),(57,19,'Microsoft Windows 10',1,'1'),(58,19,'Microsoft Windows 7',0,'1'),(59,19,'Microsoft Windows 8',0,'1'),(60,20,'fsdf',0,'1'),(61,20,'fsdf',1,'1'),(62,20,'fsdf',0,'1'),(63,20,'fsdf',0,'1'),(64,20,'fsdfds',0,'1'),(65,20,'fsdfs',0,'1');
/*!40000 ALTER TABLE `answer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exam`
--

DROP TABLE IF EXISTS `exam`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exam` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `quiz_id` int(11) DEFAULT NULL,
  `examer_id` int(11) DEFAULT NULL,
  `true_answer_count` int(11) DEFAULT NULL,
  `false_answer_count` int(11) DEFAULT NULL,
  `time` double DEFAULT NULL,
  `status` int(11) DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exam`
--

LOCK TABLES `exam` WRITE;
/*!40000 ALTER TABLE `exam` DISABLE KEYS */;
INSERT INTO `exam` VALUES (26,1,30,1,5,17.105,1);
/*!40000 ALTER TABLE `exam` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `examer`
--

DROP TABLE IF EXISTS `examer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `examer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(45) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  `birth_date` date DEFAULT NULL,
  `phone` varchar(45) DEFAULT NULL,
  `image` varchar(200) DEFAULT NULL,
  `status` int(11) DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `examer`
--

LOCK TABLES `examer` WRITE;
/*!40000 ALTER TABLE `examer` DISABLE KEYS */;
INSERT INTO `examer` VALUES (1,'30','Some',NULL,NULL,NULL,1),(2,'31',NULL,NULL,NULL,NULL,1),(3,'32','Some','2019-04-09','',NULL,1);
/*!40000 ALTER TABLE `examer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `examer_answer_stat`
--

DROP TABLE IF EXISTS `examer_answer_stat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `examer_answer_stat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `examer_id` int(11) DEFAULT NULL,
  `question_id` int(11) DEFAULT NULL,
  `answer_id` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=219 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `examer_answer_stat`
--

LOCK TABLES `examer_answer_stat` WRITE;
/*!40000 ALTER TABLE `examer_answer_stat` DISABLE KEYS */;
INSERT INTO `examer_answer_stat` VALUES (213,30,5,14,1),(214,30,6,17,1),(215,30,7,18,1),(216,30,10,29,1),(217,30,11,31,1),(218,30,19,59,1);
/*!40000 ALTER TABLE `examer_answer_stat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `moder_to_examer`
--

DROP TABLE IF EXISTS `moder_to_examer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `moder_to_examer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `moder_id` int(11) NOT NULL,
  `examer_id` int(11) NOT NULL,
  `status` int(11) DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `moder_to_examer`
--

LOCK TABLES `moder_to_examer` WRITE;
/*!40000 ALTER TABLE `moder_to_examer` DISABLE KEYS */;
INSERT INTO `moder_to_examer` VALUES (1,3,2,1),(2,5,4,1),(3,3,13,1),(4,3,14,1),(5,8,15,1),(6,5,16,1),(7,3,17,1),(8,3,19,1),(9,8,22,1),(10,8,23,1),(11,3,24,1),(12,3,26,1),(13,3,27,1),(14,3,28,1),(15,3,29,1),(16,3,30,1),(17,3,31,1),(18,3,32,1);
/*!40000 ALTER TABLE `moder_to_examer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `question`
--

DROP TABLE IF EXISTS `question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `question` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(500) DEFAULT NULL,
  `quiz_id` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question`
--

LOCK TABLES `question` WRITE;
/*!40000 ALTER TABLE `question` DISABLE KEYS */;
INSERT INTO `question` VALUES (1,'cxzczxxzxzxzxzXZ fsdfsd fsdf sdfs dfsdf sdfsdfsdf sf sf sdf sfsd fsfdfsdfsdfs',5,1),(2,'Question1',2,1),(3,'cxzcxz',3,1),(4,'dsadasd',2,1),(5,'czxcz',1,1),(6,'czxcz',1,1),(7,'czxcz',1,1),(8,'111',2,1),(9,'111',2,1),(10,'cxzcxz',1,1),(11,'asasa',1,1),(12,'??',2,1),(13,'Quetion',3,1),(14,'fdsfsd',3,1),(15,'dsada',3,1),(16,'dsada',3,1),(17,'dsada',3,1),(18,'czxczx',3,1),(19,'Select OS',1,1),(20,'fdfsdf',1,1);
/*!40000 ALTER TABLE `question` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quiz`
--

DROP TABLE IF EXISTS `quiz`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quiz` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `moder_id` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quiz`
--

LOCK TABLES `quiz` WRITE;
/*!40000 ALTER TABLE `quiz` DISABLE KEYS */;
INSERT INTO `quiz` VALUES (1,'Quiz1',1,3,1);
/*!40000 ALTER TABLE `quiz` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quiz_category`
--

DROP TABLE IF EXISTS `quiz_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quiz_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quiz_category`
--

LOCK TABLES `quiz_category` WRITE;
/*!40000 ALTER TABLE `quiz_category` DISABLE KEYS */;
INSERT INTO `quiz_category` VALUES (1,'Math',1);
/*!40000 ALTER TABLE `quiz_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `surname` varchar(45) DEFAULT NULL,
  `password` varchar(32) DEFAULT NULL,
  `username` varchar(45) DEFAULT NULL,
  `register_date` date DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `username_UNIQUE` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'Amin ',NULL,NULL,NULL,NULL,1,1),(2,'Nazim',NULL,NULL,NULL,NULL,3,1),(3,'samir',NULL,NULL,NULL,NULL,2,1),(4,'Akif',NULL,NULL,NULL,NULL,3,1),(5,'Shako',NULL,NULL,NULL,NULL,2,1),(6,'11111111111111dasdas11111111','123dsda','123','123','2019-02-16',2,0),(7,'123','123','123','456','2019-02-16',2,1),(8,'Alex','Soyad','123','123456','2019-02-16',2,1),(9,'Alex','Badalov','123456','shako.badalov','2019-02-17',1,1),(10,'First','Second','123','12345','2019-02-18',3,1),(11,'123','123','c4ca4238a0b923820dcc509a6f75849b','789','2019-02-18',3,3),(12,'789','789','123','7894','2019-02-18',3,1),(13,'456','456','123','4569','2019-02-18',3,1),(14,'Ad','Soyad','202cb962ac59075b964b07152d234b70','12','2019-02-20',1,1),(15,'Alex','X-t','202cb962ac59075b964b07152d234b70','alex997','2019-02-21',3,1),(16,'123','145','c4ca4238a0b923820dcc509a6f75849b','1235','2019-02-21',1,1),(17,'Shako','Badalov','c20ad4d76fe97759aa27a0c99bff6710','shako','2019-02-23',3,1),(18,'cxzc','czx','6512bd43d9caa6e02c990b0a82652dca','c1','2019-03-04',2,1),(19,'cxzc','czx','6512bd43d9caa6e02c990b0a82652dca','c2','2019-03-04',3,1),(20,'zzzz','zzzz','c4ca4238a0b923820dcc509a6f75849b','14','2019-03-04',1,1),(21,'a','a','c20ad4d76fe97759aa27a0c99bff6710','122','2019-03-04',2,1),(22,'aa','aa','7694f4a66316e53c8cdd9d9954bd611d','q','2019-03-04',3,1),(23,'A','A','202cb962ac59075b964b07152d234b70','124','2019-03-04',3,1),(24,'12','12','c4ca4238a0b923820dcc509a6f75849b','1212','2019-03-04',3,1),(25,'Samir','Hasanov','c20ad4d76fe97759aa27a0c99bff6710','sam','2019-03-04',1,1),(26,'Shako','badalov','c20ad4d76fe97759aa27a0c99bff6710','badalov','2019-03-04',3,1),(27,'drako','malfoy','698d51a19d8a121ce581499d7b701668','drako','2019-03-14',3,0),(28,'ad','ad','202cb962ac59075b964b07152d234b70','1234','2019-03-18',3,1),(29,'czxc','zczxcz','c4ca4238a0b923820dcc509a6f75849b','47','2019-03-22',3,1),(30,'Emil','Qedirli','698d51a19d8a121ce581499d7b701668','emil','2019-03-28',3,1),(31,'Ali','Agayev','49ae49a23f67c759bf4fc791ba842aa2','ali','2019-03-29',3,1),(32,'Serxan','Semedbeyli','b6d767d2f8ed5d21a44b0e5886680cb9','serxan555','2019-04-01',3,1);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_type`
--

DROP TABLE IF EXISTS `user_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `status` int(11) DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_type`
--

LOCK TABLES `user_type` WRITE;
/*!40000 ALTER TABLE `user_type` DISABLE KEYS */;
INSERT INTO `user_type` VALUES (1,'Admin',1),(2,'Moderator',1),(3,'Student',1);
/*!40000 ALTER TABLE `user_type` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-04-03 12:55:32

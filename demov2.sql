-- MySQL dump 10.13  Distrib 5.7.32, for Win64 (x86_64)
--
-- Host: localhost    Database: demov2
-- ------------------------------------------------------
-- Server version	5.7.32-log

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

DROP DATABASE `demov2`;
CREATE DATABASE IF NOT EXISTS `demov2`;
USE `demov2`;
--
-- Table structure for table `credit card`
--

DROP TABLE IF EXISTS `credit card`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `credit card` (
  `Pay_id` int(11) NOT NULL,
  `CC_id` int(11) NOT NULL,
  `Pay_datetime` datetime NOT NULL,
  `Pay_amount` decimal(10,2) NOT NULL,
  `CC_type` varchar(4) NOT NULL,
  `CC_name_on_card` varchar(20) NOT NULL,
  PRIMARY KEY (`Pay_id`,`CC_id`),
  UNIQUE KEY `CC_id_UNIQUE` (`CC_id`),
  UNIQUE KEY `Pay_id_UNIQUE` (`Pay_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `credit card`
--

LOCK TABLES `credit card` WRITE;
/*!40000 ALTER TABLE `credit card` DISABLE KEYS */;
INSERT INTO `credit card` VALUES (1,2,'2020-11-11 00:00:00',123.00,'VISA','Noppart');
/*!40000 ALTER TABLE `credit card` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `demov2`.`credit card_BEFORE_INSERT` BEFORE INSERT ON `credit card` FOR EACH ROW
BEGIN
DECLARE CC_type,baddata INT;  
    SET baddata = 0;  
    IF NEW.CC_type not in ('VISA','MSTC') THEN  
        SET baddata = 1;  
    END IF;  
    IF baddata = 1 THEN  
        SELECT CONCAT('Cannot Insert This ',NEW.CC_type,' is Invalid')  
        INTO CC_type FROM information_schema.tables;
    END IF;  
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `demov2`.`credit card_BEFORE_UPDATE` BEFORE UPDATE ON `credit card` FOR EACH ROW
BEGIN
DECLARE CC_type,baddata INT;  
    SET baddata = 0;  
    IF NEW.CC_type not in ('VISA','MSTC') THEN  
        SET baddata = 1;  
    END IF;  
    IF baddata = 1 THEN  
        SELECT CONCAT('Cannot Insert This ',NEW.CC_type,' is Invalid')  
        INTO CC_type FROM information_schema.tables;
    END IF;  
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer` (
  `Cus_id` varchar(9) NOT NULL,
  `cus_fname` varchar(100) NOT NULL,
  `cus_lname` varchar(100) NOT NULL,
  PRIMARY KEY (`Cus_id`),
  UNIQUE KEY `Cus_id_UNIQUE` (`Cus_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order` (
  `Order_id` int(11) NOT NULL,
  `Order_createdDate` date NOT NULL,
  `C_id` varchar(9) NOT NULL,
  PRIMARY KEY (`Order_id`),
  KEY `FKCUS_id_idx` (`C_id`),
  CONSTRAINT `FKCUS_id` FOREIGN KEY (`C_id`) REFERENCES `customer` (`Cus_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orderline`
--

DROP TABLE IF EXISTS `orderline`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orderline` (
  `OL_quantity` int(11) NOT NULL,
  `OL_no` int(11) NOT NULL AUTO_INCREMENT,
  `OL_price` decimal(10,2) NOT NULL,
  `OL_product_name` varchar(45) NOT NULL,
  `Pro_id` varchar(9) NOT NULL,
  `Or_id` int(11) NOT NULL,
  PRIMARY KEY (`OL_no`),
  KEY `FKP_id_idx` (`Pro_id`),
  KEY `FKOr_id_idx` (`Or_id`),
  CONSTRAINT `FKOr_id` FOREIGN KEY (`Or_id`) REFERENCES `order` (`Order_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FKP_id` FOREIGN KEY (`Pro_id`) REFERENCES `product` (`P_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderline`
--

LOCK TABLES `orderline` WRITE;
/*!40000 ALTER TABLE `orderline` DISABLE KEYS */;
/*!40000 ALTER TABLE `orderline` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payment` (
  `Pay_id` int(11) NOT NULL,
  `Pay_datetime` datetime NOT NULL,
  `Pay_amount` decimal(10,2) NOT NULL,
  `Or_id` int(11) NOT NULL,
  PRIMARY KEY (`Pay_id`),
  UNIQUE KEY `Pay_id_UNIQUE` (`Pay_id`),
  KEY `FKOr_id_idx` (`Or_id`),
  CONSTRAINT `FKPOr_id` FOREIGN KEY (`Or_id`) REFERENCES `order` (`Order_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product` (
  `P_id` varchar(9) NOT NULL,
  `P_name` varchar(20) NOT NULL,
  `P_price` decimal(10,2) NOT NULL,
  `P_description` varchar(100) NOT NULL,
  `P_picture` blob NOT NULL,
  `S_id` varchar(9) NOT NULL,
  PRIMARY KEY (`P_id`),
  UNIQUE KEY `P_id_UNIQUE` (`P_id`),
  KEY `S_id_idx` (`S_id`),
  CONSTRAINT `FKS_id` FOREIGN KEY (`S_id`) REFERENCES `shop` (`shop_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `receipt`
--

DROP TABLE IF EXISTS `receipt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `receipt` (
  `Rec_id` int(11) NOT NULL,
  `Rec_createdDate` datetime NOT NULL,
  `Rec_deliveryDate` date NOT NULL,
  `Pay_id` int(11) NOT NULL,
  PRIMARY KEY (`Rec_id`),
  UNIQUE KEY `Rec_id_UNIQUE` (`Rec_id`),
  KEY `FKPay_id_idx` (`Pay_id`),
  CONSTRAINT `FKPay_id` FOREIGN KEY (`Pay_id`) REFERENCES `payment` (`Pay_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `receipt`
--

LOCK TABLES `receipt` WRITE;
/*!40000 ALTER TABLE `receipt` DISABLE KEYS */;
/*!40000 ALTER TABLE `receipt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop`
--

DROP TABLE IF EXISTS `shop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shop` (
  `shop_id` varchar(9) NOT NULL,
  `shop_name` varchar(100) NOT NULL,
  PRIMARY KEY (`shop_id`),
  UNIQUE KEY `shop_id_UNIQUE` (`shop_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop`
--

LOCK TABLES `shop` WRITE;
/*!40000 ALTER TABLE `shop` DISABLE KEYS */;
/*!40000 ALTER TABLE `shop` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-11-11 16:56:18

-- MySQL dump 10.13  Distrib 5.7.32, for Win64 (x86_64)
--
-- Host: localhost    Database: db_project2
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

--
-- Table structure for table `_order`
--

DROP TABLE IF EXISTS `_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `_order` (
  `order_ID` varchar(9) NOT NULL,
  `order_createDate` date NOT NULL,
  `customer_ID` varchar(9) DEFAULT NULL,
  PRIMARY KEY (`order_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_order`
--

LOCK TABLES `_order` WRITE;
/*!40000 ALTER TABLE `_order` DISABLE KEYS */;
INSERT INTO `_order` VALUES ('1001','2020-11-01','62001'),('1002','2020-11-01','62002'),('1003','2020-11-01','62003'),('1004','2020-11-01','62004'),('1005','2020-11-01','62005'),('1006','2020-11-02','62006'),('1007','2020-11-02','62007'),('1008','2020-11-03','62008'),('1009','2020-11-03','62009'),('1010','2020-11-03','62001'),('1011','2020-11-03','62001'),('1012','2020-11-03','62013'),('1013','2020-11-04','62014'),('1014','2020-11-04','62015'),('1015','2020-11-05','62016'),('1016','2020-11-05','62017'),('1017','2020-11-05','62004'),('1018','2020-11-05','62019'),('1019','2020-11-05','62020'),('1020','2020-11-05','62021'),('1021','2020-11-06','62012'),('1022','2020-11-07','62014'),('1023','2020-11-07','62024'),('1024','2020-11-07','62002'),('1025','2020-11-07','62002'),('1026','2020-11-07','62027'),('1027','2020-11-07','62028'),('1028','2020-11-07','62003'),('1029','2020-11-07','62010'),('1030','2020-11-08','62030'),('1031','2020-11-08','62030');
/*!40000 ALTER TABLE `_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `_orderline`
--

DROP TABLE IF EXISTS `_orderline`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `_orderline` (
  `OL_quantity` int(11) NOT NULL,
  `OL_no` int(11) NOT NULL,
  `OL_price` decimal(10,2) DEFAULT NULL,
  `OL_productName` varchar(100) DEFAULT NULL,
  `Pro_id` varchar(9) NOT NULL,
  `Or_id` varchar(9) NOT NULL,
  KEY `FK_product_id` (`Pro_id`),
  KEY `FK_order_id` (`Or_id`),
  CONSTRAINT `FK_order_id` FOREIGN KEY (`Or_id`) REFERENCES `_order` (`order_ID`),
  CONSTRAINT `FK_product_id` FOREIGN KEY (`Pro_id`) REFERENCES `product` (`prod_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_orderline`
--

LOCK TABLES `_orderline` WRITE;
/*!40000 ALTER TABLE `_orderline` DISABLE KEYS */;
INSERT INTO `_orderline` VALUES (1,1,20.00,'brownie','00001','1001'),(1,2,80.00,'strawberry daifuku','00004','1001'),(2,1,60.00,'strawberry pie','00031','1002'),(1,1,50.00,'cheese cake','00002','1003'),(1,2,3200.00,'tiramisu cake','00006','1003'),(1,3,320.00,'mouse gaming','00030','1003'),(3,1,255.00,'tiramisu cake','00003','1004'),(3,2,2100.00,'wood','00007','1004'),(1,1,80.00,'strawberry daifuku','00004','1005'),(1,1,260.00,'radio','00035','1006'),(2,1,60.00,'brownie baby','00005','1007'),(3,1,477.00,'keyboard','00008','1008'),(1,1,120.00,'minibag','00009','1009'),(1,2,490.00,'DYNAMITE','00014','1009'),(2,1,580.00,'bomb doll','00010','1010'),(1,1,250.00,'fuji film iso 200','00011','1011'),(2,2,40.00,'brownie','00001','1011'),(1,1,50.00,'mountainphoto','00012','1012'),(2,2,60.00,'strawberry pie','00031','1012'),(1,3,5.00,'baby crystal','00013','1013'),(2,1,1100.00,'BE album','00017','1014'),(1,1,490.00,'DYNAMITE','00014','1015'),(1,1,390.00,'butterfly keyboard','00040','1016'),(1,1,390.00,'RGB keyboard','00016','1017'),(3,2,45.00,'noodle','00019','1017'),(1,1,290.00,'mini dress','00018','1018'),(3,1,45.00,'noodle','00019','1019'),(1,1,150.00,'iPad pro case','00020','1020'),(1,1,1000.00,'headphone','00021','1021'),(1,1,599.00,'messenger bag','00022','1022'),(1,1,1599.00,'freitag bag','00045','1023'),(2,1,598.00,'sport shoes','00024','1024'),(1,1,100.00,'sport shoes','00025','1025'),(1,1,29000.00,'asus laptop','00026','1026'),(1,1,69000.00,'macbook air','00027','1027'),(1,1,1400.00,'eugeo sword','00039','1027'),(1,1,79000.00,'macbook pro','00049','1028'),(2,1,240.00,'bath bomb','00029','1029'),(1,2,550.00,'love yourself Album','00041','1029'),(1,1,320.00,'mouse gaming','00030','1030'),(4,2,80.00,'brownie','00001','1030');
/*!40000 ALTER TABLE `_orderline` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `credit_card`
--

DROP TABLE IF EXISTS `credit_card`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `credit_card` (
  `pay_id` int(11) NOT NULL,
  `cc_id` int(11) NOT NULL,
  `pay_datetime` datetime DEFAULT NULL,
  `cc_type` varchar(4) DEFAULT NULL,
  `serial_number` varchar(100) DEFAULT NULL,
  `pay_amount` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`pay_id`,`cc_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `credit_card`
--

LOCK TABLES `credit_card` WRITE;
/*!40000 ALTER TABLE `credit_card` DISABLE KEYS */;
INSERT INTO `credit_card` VALUES (1231,121,'2020-11-01 00:18:00','VISA','1212312121',20.00),(1232,122,'2020-11-01 07:34:00','MSTC','1345670988',50.00),(1232,123,'2020-11-01 06:42:00','VISA','3456789456',50.00),(1234,124,'2020-11-01 02:33:00','MSTC','6789076543',255.00),(1235,125,'2020-11-01 03:23:00','MSTC','1234598765',80.00),(1236,126,'2020-11-02 05:31:00','VISA','6392774036',80.00),(1237,127,'2020-11-02 07:53:00','MSTC','6402740334',60.00),(1238,128,'2020-11-03 02:50:00','VISA','4235246490',477.00),(1239,129,'2020-11-03 03:36:00','MSTC','5478785568',120.00),(1240,130,'2020-11-03 01:23:00','VISA','0364763745',580.00),(1241,131,'2020-11-03 04:54:00','VISA','5374563737',250.00),(1242,132,'2020-11-03 05:12:00','VISA','2345123870',250.00),(1243,133,'2020-11-04 06:34:00','MSTC','8694739271',270.00),(1244,134,'2020-11-04 03:12:00','VISA','2349876534',1600.00),(1245,135,'2020-11-05 04:56:00','VISA','2456374955',490.00),(1246,136,'2020-11-05 02:32:00','MSTC','5645864926',500.00),(1247,137,'2020-11-05 01:01:00','VISA','5649477432',390.00),(1248,138,'2020-11-05 03:05:00','VISA','0987654234',290.00),(1249,139,'2020-11-05 04:08:00','MSTC','5467380239',45.00),(1250,140,'2020-11-05 04:00:00','MSTC','7357463467',150.00),(1251,141,'2020-11-06 05:56:00','VISA','6573433466',180.00),(1252,142,'2020-11-07 06:01:00','MSTC','7396446383',1200.00),(1253,143,'2020-11-07 05:06:00','VISA','5474537353',299.00),(1254,144,'2020-11-07 02:07:00','MSTC','0982345987',640.00),(1255,145,'2020-11-07 06:45:00','MSTC','6584773091',3200.00),(1256,146,'2020-11-07 03:07:00','VISA','6782349834',30.00),(1257,147,'2020-11-07 01:08:00','MSTC','7027344832',5000.00),(1258,148,'2020-11-07 03:12:00','VISA','7895437448',750.00),(1259,149,'2020-11-07 04:03:00','MSTC','6372927493',1000.00),(1260,150,'2020-11-07 04:03:00','MSTC','6372927493',150.00);
/*!40000 ALTER TABLE `credit_card` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer` (
  `customer_ID` varchar(9) NOT NULL,
  `customer_fname` varchar(100) NOT NULL,
  `customer_lname` varchar(100) NOT NULL,
  PRIMARY KEY (`customer_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES ('62001','Pranungfun','Prapaenee'),('62002','Nopparat','Pengsuk'),('62003','Pongsakorn','Piboonpongpun'),('62004','Numjoon','Kim'),('62005','Seokjin','Kim'),('62006','Yoonki','Min'),('62007','Hoseok','Jung'),('62008','Jimin','Park'),('62009','Taehyung','Kim'),('62010','Jungkook','Jeon'),('62011','Izuku','Midoriya'),('62012','Shoto','Todoroki'),('62013','Bakugo','Katsuki'),('62014','Kirishima','Eijiro'),('62015','Denki','Kaminari'),('62016','Eren','Yeager'),('62017','Mikasa','Ackerman'),('62018','Levi','Ackerman'),('62019','Shoyo','Hinata'),('62020','Tooru','Oikawa'),('62021','Tobio','Kageyama'),('62022','Kazuto','Kirigaya'),('62023','Tanjiro','Kamado'),('62024','Nezuko','Kamado'),('62025','Zenitsu','Agatsuma'),('62026','Yuu','Nishinoya'),('62027','Koshi','Sugawara'),('62028','Kei','Tsukishima'),('62029','Jipyeong','Han'),('62030','Dalmi','Seo');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payment` (
  `pay_id` int(11) NOT NULL,
  `pay_datetime` datetime DEFAULT NULL,
  `pay_amount` decimal(10,2) DEFAULT NULL,
  `Or_id` varchar(9) DEFAULT NULL,
  PRIMARY KEY (`pay_id`),
  KEY `FK_order_id2` (`Or_id`),
  CONSTRAINT `FK_order_id2` FOREIGN KEY (`Or_id`) REFERENCES `_order` (`order_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
INSERT INTO `payment` VALUES (1231,'2020-11-01 00:18:00',100.00,'1001'),(1232,'2020-11-01 07:34:00',50.00,'1002'),(1233,'2020-11-01 06:42:00',3570.00,'1003'),(1234,'2020-11-01 02:33:00',2355.00,'1004'),(1235,'2020-11-01 03:23:00',80.00,'1005'),(1236,'2020-11-02 05:31:00',80.00,'1006'),(1237,'2020-11-02 07:53:00',60.00,'1007'),(1238,'2020-11-03 02:50:00',477.00,'1008'),(1239,'2020-11-03 03:36:00',610.00,'1009'),(1240,'2020-11-03 01:23:00',580.00,'1010'),(1241,'2020-11-03 04:54:00',290.00,'1011'),(1242,'2020-11-03 05:12:00',310.00,'1012'),(1243,'2020-11-04 06:34:00',270.00,'1013'),(1244,'2020-11-04 03:12:00',1600.00,'1014'),(1245,'2020-11-05 04:56:00',490.00,'1015'),(1246,'2020-11-05 02:32:00',500.00,'1016'),(1247,'2020-11-05 01:01:00',435.00,'1017'),(1248,'2020-11-05 03:05:00',290.00,'1018'),(1249,'2020-11-05 04:08:00',45.00,'1019'),(1250,'2020-11-05 04:00:00',150.00,'1020'),(1251,'2020-11-06 05:56:00',180.00,'1021'),(1252,'2020-11-07 06:01:00',1200.00,'1022'),(1253,'2020-11-07 05:06:00',299.00,'1023'),(1254,'2020-11-07 02:07:00',640.00,'1024'),(1255,'2020-11-07 06:45:00',3200.00,'1025'),(1256,'2020-11-07 03:07:00',30.00,'1026'),(1257,'2020-11-07 01:08:00',70400.00,'1027'),(1258,'2020-11-07 03:12:00',750.00,'1028'),(1259,'2020-11-07 04:03:00',1550.00,'1029'),(1260,'2020-11-08 04:03:00',230.00,'1030');
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product` (
  `prod_ID` varchar(9) NOT NULL,
  `prod_name` varchar(100) NOT NULL,
  `prod_price` decimal(12,2) NOT NULL,
  `prod_des` varchar(100) DEFAULT NULL,
  `prod_type` varchar(100) NOT NULL,
  `shop_id` varchar(9) NOT NULL,
  PRIMARY KEY (`prod_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES ('00001','brownie',20.00,'aroi makk','dessert','88001'),('00002','cheese cake',50.00,'must try','dessert','88002'),('00003','tiramisu cake',85.00,NULL,'dessert','88003'),('00004','strawberry daifuku',80.00,NULL,'dessert','88004'),('00005','brownie baby',30.00,NULL,'dessert','88005'),('00006','sofa so good',3200.00,NULL,'furniture','88006'),('00007','wood',700.00,NULL,'furniture','88007'),('00008','keyboard',159.00,NULL,'electronic','88008'),('00009','minibag',120.00,'This is very good','bag','88009'),('00010','bomb doll',290.00,NULL,'toy','88010'),('00011','fuji film iso 200',250.00,NULL,'photo','88011'),('00012','mountain photo',50.00,NULL,'photo','88012'),('00013','baby crystal',5.00,'blue','plant','88013'),('00014','DYNAMITE',490.00,'prod by BTS','song','88014'),('00015','black sword',1200.00,NULL,'sword','88015'),('00016','RGB keyboard',390.00,NULL,'electronic','88016'),('00017','BE Album',550.00,NULL,'album','88017'),('00018','mini dress',290.00,NULL,'cloth','88018'),('00019','noodle',15.00,NULL,'food','88019'),('00020','iPad pro case',150.00,'11 inches','case','88020'),('00021','headphone',1000.00,NULL,'electronic','88021'),('00022','messenger bag',599.00,NULL,'bag','88022'),('00023','tshirt',150.00,'pink','cloth','88023'),('00024','sport shoes',299.00,'sport','shoes','88024'),('00025','sport shoes',100.00,'sport','shoes','88025'),('00026','asus laptop',29000.00,NULL,'electronic','88026'),('00027','macbook laptop',69000.00,'13 inches','electronic','88027'),('00028','lipstick',290.00,'pink','cosmetic','88028'),('00029','bath bomb',120.00,NULL,'bath','88029'),('00030','mouse gaming',320.00,NULL,'electronic','88030'),('00031','strawberry pie',30.00,NULL,'dessert','88001'),('00032','cheese cake',50.00,'must try','dessert','88002'),('00033','apple pie',50.00,NULL,'dessert','88002'),('00034','Wardrobe',3300.00,NULL,'furniture','88006'),('00035','radio',260.00,NULL,'electronic','88008'),('00036','kodak film iso 200',250.00,NULL,'photo','88011'),('00037','kodak ultra film iso 400',350.00,NULL,'photo','88011'),('00038','beach photo',50.00,NULL,'photo','88012'),('00039','eugeo sword',1400.00,'Ice sword','sword','88015'),('00040','butterfly keyboard',390.00,NULL,'electronic','88016'),('00041','love yourself Album',550.00,NULL,'album','88017'),('00042','shirt',290.00,'white shirt','cloth','88018'),('00043','iPad pro case',150.00,'12 inches','case','88020'),('00044','headphone wireless',1500.00,NULL,'electronic','88021'),('00045','freitag bag',1599.00,NULL,'bag','88022'),('00046','tshirt',150.00,'black','cloth','88023'),('00047','adidatt shoes',299.00,'sport','shoes','88024'),('00048','asus mouse',800.00,NULL,'electronic','88026'),('00049','macbook laptop',79000.00,'15 inches','electronic','88027'),('00050','lipstick',290.00,'red','cosmetic','88028'),('00051','shower cream',130.00,'baby','bath','88029'),('00052','razor mouse',1800.00,NULL,'electronic','88030'),('00053','fuji film iso 100',250.00,NULL,'photo','88011'),('00055','chocolate cake',100.00,NULL,'dessert','88002');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `receipt`
--

DROP TABLE IF EXISTS `receipt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `receipt` (
  `rec_id` int(11) NOT NULL,
  `rec_createdDate` datetime DEFAULT NULL,
  `rec_deliveryDate` date DEFAULT NULL,
  `pay_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`rec_id`),
  KEY `FK_payment_id2` (`pay_id`),
  CONSTRAINT `FK_payment_id2` FOREIGN KEY (`pay_id`) REFERENCES `payment` (`pay_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `receipt`
--

LOCK TABLES `receipt` WRITE;
/*!40000 ALTER TABLE `receipt` DISABLE KEYS */;
INSERT INTO `receipt` VALUES (847,'2020-11-01 04:08:00','2020-11-08',1249),(976,'2020-11-11 03:07:00','2020-11-10',1256),(987,'2020-10-25 03:36:00','2020-11-06',1239),(1658,'2020-11-11 01:08:00','2020-11-10',1257),(2345,'2020-10-23 03:23:00','2020-11-04',1235),(2349,'2020-10-21 00:18:00','2020-11-04',1231),(3451,'2020-10-21 07:34:00','2020-11-04',1232),(3454,'2020-10-24 02:50:00','2020-11-06',1238),(4254,'2020-10-27 04:54:00','2020-11-06',1241),(4366,'2020-10-30 03:12:00','2020-11-07',1244),(4562,'2020-10-26 01:23:00','2020-11-06',1240),(4567,'2020-10-22 06:42:00','2020-11-04',1233),(4568,'2020-11-07 06:01:00','2020-11-10',1252),(5282,'2020-11-06 05:56:00','2020-11-09',1251),(5353,'2020-10-30 01:01:00','2020-11-08',1247),(5432,'2020-10-24 07:53:00','2020-11-05',1237),(5476,'2020-10-28 06:34:00','2020-11-07',1243),(5656,'2020-11-05 04:00:00','2020-11-08',1250),(6315,'2020-10-27 05:12:00','2020-11-06',1242),(6343,'2020-10-30 03:05:00','2020-11-08',1248),(6452,'2020-11-11 02:07:00','2020-11-10',1254),(7303,'2020-11-11 04:03:00','2020-11-10',1259),(7304,'2020-11-11 04:03:00','2020-11-10',1259),(7651,'2020-10-23 05:31:00','2020-11-05',1236),(8230,'2020-10-23 02:33:00','2020-11-04',1234),(8440,'2020-11-11 06:45:00','2020-11-10',1255),(9305,'2020-10-30 04:56:00','2020-11-08',1245),(9373,'2020-11-11 05:06:00','2020-11-10',1253),(9474,'2020-10-30 02:32:00','2020-11-08',1246),(9475,'2020-11-11 03:12:00','2020-11-10',1258),(9999,'2020-11-11 05:01:00','2020-11-11',1260);
/*!40000 ALTER TABLE `receipt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop`
--

DROP TABLE IF EXISTS `shop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shop` (
  `shop_ID` varchar(9) NOT NULL,
  `shop_name` varchar(100) NOT NULL,
  PRIMARY KEY (`shop_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop`
--

LOCK TABLES `shop` WRITE;
/*!40000 ALTER TABLE `shop` DISABLE KEYS */;
INSERT INTO `shop` VALUES ('88001','sheek bakery'),('88002','Mark bakery'),('88003','Pixelizu'),('88004','deku daifuku'),('88005','baby brownie'),('88006','toppy furniture'),('88007','pongsakorn khai mhai'),('88008','sampromtech'),('88009','noeyiii bag'),('88010','bakugo toy'),('88011','pranung film'),('88012','markki photo'),('88013','babycrystal plant'),('88014','jungkook CD'),('88015','kirito sword'),('88016','keyboard oreo'),('88017','BTS preoder'),('88018','eigth teen dress'),('88019','prom noodle'),('88020','ipad case'),('88021','mark sonie'),('88022','konkeng bag'),('88023','mupa tshirt'),('88024','nhai khee shoes'),('88025','adidatttt shoes'),('88026','asus kak'),('88027','macbook dee'),('88028','ping cosmetic'),('88029','bodyandbath'),('88030','mai tum ngan gaming');
/*!40000 ALTER TABLE `shop` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `vw_productandshop`
--

DROP TABLE IF EXISTS `vw_productandshop`;
/*!50001 DROP VIEW IF EXISTS `vw_productandshop`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vw_productandshop` AS SELECT 
 1 AS `prod_id`,
 1 AS `shop name`,
 1 AS `price`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `vw_productandshop`
--

/*!50001 DROP VIEW IF EXISTS `vw_productandshop`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_productandshop` AS select `p`.`prod_ID` AS `prod_id`,`s`.`shop_name` AS `shop name`,`p`.`prod_price` AS `price` from (`product` `p` join `shop` `s` on((`s`.`shop_ID` = `p`.`shop_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-12-05  3:03:30

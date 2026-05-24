-- MySQL dump 10.13  Distrib 8.0.45, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: cattleya
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.32-MariaDB

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
-- Table structure for table `menuingredient`
--

DROP TABLE IF EXISTS `menuingredient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menuingredient` (
  `MenuIngredientID` varchar(30) NOT NULL,
  `MenuID` varchar(30) NOT NULL,
  `IngredientID` varchar(30) NOT NULL,
  `IngredientQuantity` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`MenuIngredientID`),
  KEY `MenuIngredient_FK1` (`MenuID`),
  KEY `MenuIngredient_FK2` (`IngredientID`),
  CONSTRAINT `MenuIngredient_FK1` FOREIGN KEY (`MenuID`) REFERENCES `menu` (`MenuID`),
  CONSTRAINT `MenuIngredient_FK2` FOREIGN KEY (`IngredientID`) REFERENCES `ingredient` (`IngredientID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menuingredient`
--

LOCK TABLES `menuingredient` WRITE;
/*!40000 ALTER TABLE `menuingredient` DISABLE KEYS */;
INSERT INTO `menuingredient` VALUES ('MI001','C01','I01',1.00),('MI002','C01','I05',50.00),('MI003','C02','I01',2.00),('MI004','C02','I05',100.00),('MI005','C03','I01',1.00),('MI006','C03','I05',50.00),('MI007','C03','I07',150.00),('MI008','C04','I01',1.00),('MI009','C04','I11',0.20),('MI010','C04','I12',50.00),('MI011','C05','I01',1.00),('MI012','C05','I06',0.15),('MI013','C05','I05',50.00),('MI014','B01','I03',1.00),('MI015','B01','I04',1.00),('MI016','B01','I10',1.00),('MI017','B02','I03',1.00),('MI018','B02','I04',1.00),('MI019','B02','I08',20.00),('MI020','B02','I10',1.00),('MI021','B03','I02',1.00),('MI022','B03','I04',1.00),('MI023','B03','I10',1.00),('MI024','B04','I03',1.00),('MI025','B04','I04',1.00),('MI026','B04','I06',0.15),('MI027','B04','I10',1.00),('MI028','B05','I03',1.00),('MI029','B05','I04',1.00),('MI030','B05','I06',0.15),('MI031','B05','I08',20.00),('MI032','B05','I10',1.00),('MI033','B06','I02',1.00),('MI034','B06','I04',1.00),('MI035','B06','I06',0.15),('MI036','B06','I10',1.00),('MI037','S01','I06',0.20),('MI038','S02','I07',150.00),('MI039','S02','I08',20.00),('MI040','S02','I09',20.00),('MI041','S03','I07',200.00);
/*!40000 ALTER TABLE `menuingredient` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-05-24 10:20:56

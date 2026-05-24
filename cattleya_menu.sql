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
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu` (
  `MenuID` varchar(30) NOT NULL,
  `MenuItem` varchar(50) DEFAULT NULL,
  `Category` varchar(30) DEFAULT NULL,
  `Price` decimal(10,2) DEFAULT NULL,
  `Status` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`MenuID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu`
--

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
INSERT INTO `menu` VALUES ('B01','Burger and Drink','Burger',80.00,'Available'),('B02','Cheeseburger and Drink','Burger',100.00,'Available'),('B03','Chicken Burger with Drink','Burger',100.00,'Available'),('B04','Burger with Fries and Drink','Burger',110.00,'Available'),('B05','Cheeseburger with Fries and Drink','Burger',130.00,'Available'),('B06','Chicken Burger with Fries and Drink','Burger',130.00,'Available'),('B07','Classic Burger','Burger',59.00,'Available'),('B08','Cheese Burger','Burger',79.00,'Available'),('B09','BBQ Burger','Burger',89.00,'Available'),('B10','Mushroom Burger','Burger',109.00,'Available'),('B11','Double Burger','Burger',149.00,'Available'),('B12','Veggie Burger','Burger',119.00,'Available'),('C01','1PC Chicken with Drink','Chicken',99.00,'Available'),('C02','2PC Chicken with Drink','Chicken',199.00,'Available'),('C03','1PC Chicken with Soup and Drink','Chicken',160.00,'Available'),('C04','1 PC Chicken with Spaghetti and Drink','Chicken',190.00,'Available'),('C05','1PC Chicken with Fries and Drink','Chicken',130.00,'Available'),('C06','Original Chicken','Chicken',99.00,'Available'),('C07','Spicy Chicken','Chicken',109.00,'Available'),('C08','Grilled Chicken','Chicken',129.00,'Available'),('C09','Crispy Chicken','Chicken',99.00,'Available'),('C10','Butter Chicken','Chicken',149.00,'Available'),('S01','Fries','Sides',50.00,'Available'),('S02','Sundae','Sides',70.00,'Available'),('S03','Iced Coffee','Sides',70.00,'Available'),('S04','Garden Salad','Sides',89.00,'Available'),('S05','Fries','Sides',49.00,'Available'),('S06','Coleslaw','Sides',39.00,'Available');
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-05-24 10:20:57

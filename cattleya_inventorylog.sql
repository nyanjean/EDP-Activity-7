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
-- Table structure for table `inventorylog`
--

DROP TABLE IF EXISTS `inventorylog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inventorylog` (
  `InventoryLogID` varchar(30) NOT NULL,
  `TransactionType` varchar(30) DEFAULT NULL,
  `TransactionQuantity` int(11) DEFAULT NULL,
  `TransactionDate` date DEFAULT NULL,
  `MenuID` varchar(30) DEFAULT NULL,
  `InventoryID` varchar(30) NOT NULL,
  `CustomerName` varchar(100) DEFAULT 'Walk-In Customer',
  `TransactionNotes` text DEFAULT NULL,
  PRIMARY KEY (`InventoryLogID`),
  KEY `InventoryLog_FK1` (`MenuID`),
  KEY `InventoryLog_FK2` (`InventoryID`),
  CONSTRAINT `InventoryLog_FK1` FOREIGN KEY (`MenuID`) REFERENCES `menu` (`MenuID`),
  CONSTRAINT `InventoryLog_FK2` FOREIGN KEY (`InventoryID`) REFERENCES `inventory` (`InventoryID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventorylog`
--

LOCK TABLES `inventorylog` WRITE;
/*!40000 ALTER TABLE `inventorylog` DISABLE KEYS */;
INSERT INTO `inventorylog` VALUES ('IL001','Sale',3,'2026-02-28','C01','INV01','Walk-In Customer',NULL),('IL002','Sale',150,'2026-02-28','C01','INV05','Walk-In Customer',NULL),('IL003','Sale',3,'2026-02-28','B01','INV03','Walk-In Customer',NULL),('IL004','Sale',3,'2026-02-28','B01','INV04','Walk-In Customer',NULL),('IL005','Sale',3,'2026-02-28','B01','INV10','Walk-In Customer',NULL),('IL006','Sale',1,'2026-02-28','S01','INV06','Walk-In Customer',NULL),('IL007','Restock',100,'2026-02-28',NULL,'INV01','Walk-In Customer',NULL),('IL008','Restock',100,'2026-02-28',NULL,'INV05','Walk-In Customer',NULL),('IL009','Restock',100,'2026-02-28',NULL,'INV06','Walk-In Customer',NULL),('IL010','Restock',100,'2026-02-28',NULL,'INV07','Walk-In Customer',NULL),('IL011','Restock',100,'2026-02-28',NULL,'INV08','Walk-In Customer',NULL),('IL012','Sale',3,'2026-03-11','C01','INV01','Walk-In Customer',NULL),('IL013','Sale',3,'2026-03-11','C01','INV01','Walk-In Customer',NULL),('IL014','Sale',3,'2026-03-11','C01','INV01','Walk-In Customer',NULL),('IL015','Restock',5,'2026-03-11','C01','INV01','Walk-In Customer',NULL),('IL07412','Sale',100,'2026-02-28','C01','INV05','Walk-In Customer',NULL),('IL18849','Sale',2,'2026-02-28','C01','INV01','Walk-In Customer',NULL),('IL80347','Sale',100,'2026-02-28','C01','INV05','Walk-In Customer',NULL),('IL80517','Sale',2,'2026-02-28','C01','INV01','Walk-In Customer',NULL);
/*!40000 ALTER TABLE `inventorylog` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_after_insert_inventorylog`
AFTER INSERT ON `inventorylog`
FOR EACH ROW
BEGIN
  IF NEW.TransactionType = 'Sale' THEN
    UPDATE inventory
    SET StockQuantity = StockQuantity - NEW.TransactionQuantity
    WHERE InventoryID = NEW.InventoryID;
  ELSEIF NEW.TransactionType = 'Restock' THEN
    UPDATE inventory
    SET StockQuantity = StockQuantity + NEW.TransactionQuantity
    WHERE InventoryID = NEW.InventoryID;
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
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_after_update_inventorylog`
AFTER UPDATE ON `inventorylog`
FOR EACH ROW
BEGIN
  IF OLD.TransactionType = 'Sale' THEN
    UPDATE inventory SET StockQuantity = StockQuantity + OLD.TransactionQuantity WHERE InventoryID = OLD.InventoryID;
  ELSEIF OLD.TransactionType = 'Restock' THEN
    UPDATE inventory SET StockQuantity = StockQuantity - OLD.TransactionQuantity WHERE InventoryID = OLD.InventoryID;
  END IF;
  IF NEW.TransactionType = 'Sale' THEN
    UPDATE inventory SET StockQuantity = StockQuantity - NEW.TransactionQuantity WHERE InventoryID = NEW.InventoryID;
  ELSEIF NEW.TransactionType = 'Restock' THEN
    UPDATE inventory SET StockQuantity = StockQuantity + NEW.TransactionQuantity WHERE InventoryID = NEW.InventoryID;
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
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_after_delete_inventorylog`
AFTER DELETE ON `inventorylog`
FOR EACH ROW
BEGIN
  IF OLD.TransactionType = 'Sale' THEN
    UPDATE inventory SET StockQuantity = StockQuantity + OLD.TransactionQuantity WHERE InventoryID = OLD.InventoryID;
  ELSEIF OLD.TransactionType = 'Restock' THEN
    UPDATE inventory SET StockQuantity = StockQuantity - OLD.TransactionQuantity WHERE InventoryID = OLD.InventoryID;
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-05-24 10:20:57

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
-- Temporary view structure for view `vw_menuwithingredients`
--

DROP TABLE IF EXISTS `vw_menuwithingredients`;
/*!50001 DROP VIEW IF EXISTS `vw_menuwithingredients`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_menuwithingredients` AS SELECT 
 1 AS `MenuID`,
 1 AS `MenuItem`,
 1 AS `Category`,
 1 AS `Price`,
 1 AS `Status`,
 1 AS `IngredientID`,
 1 AS `IngredientName`,
 1 AS `IngredientQuantity`,
 1 AS `Unit`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_saleslog`
--

DROP TABLE IF EXISTS `vw_saleslog`;
/*!50001 DROP VIEW IF EXISTS `vw_saleslog`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_saleslog` AS SELECT 
 1 AS `InventoryLogID`,
 1 AS `TransactionDate`,
 1 AS `MenuID`,
 1 AS `MenuItem`,
 1 AS `InventoryID`,
 1 AS `IngredientName`,
 1 AS `TransactionQuantity`,
 1 AS `Unit`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_inventorystock`
--

DROP TABLE IF EXISTS `vw_inventorystock`;
/*!50001 DROP VIEW IF EXISTS `vw_inventorystock`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_inventorystock` AS SELECT 
 1 AS `IngredientID`,
 1 AS `IngredientName`,
 1 AS `Unit`,
 1 AS `StockQuantity`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `vw_menuwithingredients`
--

/*!50001 DROP VIEW IF EXISTS `vw_menuwithingredients`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_menuwithingredients` AS select `m`.`MenuID` AS `MenuID`,`m`.`MenuItem` AS `MenuItem`,`m`.`Category` AS `Category`,`m`.`Price` AS `Price`,`m`.`Status` AS `Status`,`mi`.`IngredientID` AS `IngredientID`,`i`.`IngredientName` AS `IngredientName`,`mi`.`IngredientQuantity` AS `IngredientQuantity`,`i`.`Unit` AS `Unit` from ((`menu` `m` join `menuingredient` `mi` on(`m`.`MenuID` = `mi`.`MenuID`)) join `ingredient` `i` on(`mi`.`IngredientID` = `i`.`IngredientID`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_saleslog`
--

/*!50001 DROP VIEW IF EXISTS `vw_saleslog`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_saleslog` AS select `il`.`InventoryLogID` AS `InventoryLogID`,`il`.`TransactionDate` AS `TransactionDate`,`il`.`MenuID` AS `MenuID`,`m`.`MenuItem` AS `MenuItem`,`il`.`InventoryID` AS `InventoryID`,`i`.`IngredientName` AS `IngredientName`,`il`.`TransactionQuantity` AS `TransactionQuantity`,`i`.`Unit` AS `Unit` from ((`inventorylog` `il` left join `menu` `m` on(`il`.`MenuID` = `m`.`MenuID`)) left join `ingredient` `i` on(`il`.`InventoryID` = `i`.`IngredientID`)) where `il`.`TransactionType` = 'Sale' */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_inventorystock`
--

/*!50001 DROP VIEW IF EXISTS `vw_inventorystock`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_inventorystock` AS select `i`.`IngredientID` AS `IngredientID`,`i`.`IngredientName` AS `IngredientName`,`i`.`Unit` AS `Unit`,`inv`.`StockQuantity` AS `StockQuantity` from (`inventory` `inv` join `ingredient` `i` on(`inv`.`IngredientID` = `i`.`IngredientID`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Dumping events for database 'cattleya'
--

--
-- Dumping routines for database 'cattleya'
--
/*!50003 DROP FUNCTION IF EXISTS `fn_GetStock` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_GetStock`(p_IngredientID VARCHAR(30)) RETURNS decimal(10,2)
    READS SQL DATA
    DETERMINISTIC
BEGIN
  DECLARE v_Stock DECIMAL(10,2);
  SELECT StockQuantity INTO v_Stock
  FROM inventory
  WHERE IngredientID = p_IngredientID;
  RETURN v_Stock;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_RecordSale` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_RecordSale`(
  IN p_MenuID VARCHAR(30),
  IN p_Quantity DECIMAL(10,2),
  IN p_TransactionDate DATE
)
BEGIN
  DECLARE done INT DEFAULT 0;
  DECLARE v_IngredientID VARCHAR(30);
  DECLARE v_Quantity DECIMAL(10,2);
  DECLARE cur CURSOR FOR
    SELECT IngredientID, IngredientQuantity
    FROM menuingredient WHERE MenuID = p_MenuID;
  DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

  OPEN cur;
  read_loop: LOOP
    FETCH cur INTO v_IngredientID, v_Quantity;
    IF done THEN LEAVE read_loop; END IF;
    INSERT INTO inventorylog
      (InventoryLogID, TransactionType, TransactionQuantity, TransactionDate, MenuID, InventoryID)
    VALUES (
      CONCAT('IL', LPAD(FLOOR(RAND()*100000),5,'0')),
      'Sale', v_Quantity * p_Quantity, p_TransactionDate, p_MenuID,
      (SELECT InventoryID FROM inventory WHERE IngredientID = v_IngredientID)
    );
  END LOOP;
  CLOSE cur;
END ;;
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

-- Dump completed on 2026-05-24 10:20:58

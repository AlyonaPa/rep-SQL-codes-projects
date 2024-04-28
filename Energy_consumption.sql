-- MySQL dump 10.13  Distrib 8.0.36, for macos14 (arm64)
--
-- Host: localhost    Database: energy
-- ------------------------------------------------------
-- Server version	8.0.36

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
-- Temporary view structure for view `energy_combined_view`
--

DROP TABLE IF EXISTS `energy_combined_view`;
/*!50001 DROP VIEW IF EXISTS `energy_combined_view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `energy_combined_view` AS SELECT 
 1 AS `region`,
 1 AS `quantity_ej_2012`,
 1 AS `quantity_ej_2022`,
 1 AS `primary_growth_rate`,
 1 AS `quantity_gj_1965`,
 1 AS `quantity_gj_2012`,
 1 AS `quantity_gj_2022`,
 1 AS `per_capita_growth_rate`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `energy_consumption_per_capita`
--

DROP TABLE IF EXISTS `energy_consumption_per_capita`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `energy_consumption_per_capita` (
  `region` varchar(50) NOT NULL,
  `quantity_gj_1965` float DEFAULT NULL,
  `quantity_gj_2012` float DEFAULT NULL,
  `quantity_gj_2022` float DEFAULT NULL,
  `growth_per_annum_pct` float DEFAULT NULL,
  PRIMARY KEY (`region`),
  CONSTRAINT `energy_consumption_per_capita_ibfk_1` FOREIGN KEY (`region`) REFERENCES `primary_energy_consumption` (`region`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `energy_consumption_per_capita`
--

LOCK TABLES `energy_consumption_per_capita` WRITE;
/*!40000 ALTER TABLE `energy_consumption_per_capita` DISABLE KEYS */;
INSERT INTO `energy_consumption_per_capita` VALUES ('Africa',8,15.1,14.2,-0.6),('CIS',108.1,159.3,154.9,-0.03),('Europe',94,131.9,118,-1.1),('Middle East',33.7,135.8,140.4,0.03),('North America',230.2,240.4,235.6,-0.02),('S. & Cent. America',23.5,58.7,56.5,-0.04),('Total Asia Pacific',10.5,53.9,64.4,1.8),('Total World',46.7,73.7,75.7,0.03);
/*!40000 ALTER TABLE `energy_consumption_per_capita` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `primary_energy_consumption`
--

DROP TABLE IF EXISTS `primary_energy_consumption`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `primary_energy_consumption` (
  `region` varchar(50) NOT NULL,
  `quantity_ej_2012` float DEFAULT NULL,
  `quantity_ej_2022` float DEFAULT NULL,
  `growth_per_annum_pct` float DEFAULT NULL,
  PRIMARY KEY (`region`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `primary_energy_consumption`
--

LOCK TABLES `primary_energy_consumption` WRITE;
/*!40000 ALTER TABLE `primary_energy_consumption` DISABLE KEYS */;
INSERT INTO `primary_energy_consumption` VALUES ('Africa',16.8,20.26,1.9),('CIS',37.42,38.36,0.2),('Europe',87.34,79.81,-0.9),('Middle East',31.75,39.13,2.1),('North America',112.3,118.78,0.6),('S. & Cent. America',28.63,30.11,0.5),('Total Asia Pacific',213.72,277.6,2.6),('Total World',527.96,604.04,1.4);
/*!40000 ALTER TABLE `primary_energy_consumption` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `renewables_by_source`
--

DROP TABLE IF EXISTS `renewables_by_source`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `renewables_by_source` (
  `source_id` int NOT NULL,
  `source_name` varchar(10) NOT NULL,
  PRIMARY KEY (`source_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `renewables_by_source`
--

LOCK TABLES `renewables_by_source` WRITE;
/*!40000 ALTER TABLE `renewables_by_source` DISABLE KEYS */;
INSERT INTO `renewables_by_source` VALUES (1,'wind'),(2,'solar'),(3,'other');
/*!40000 ALTER TABLE `renewables_by_source` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `solar_generation_twh`
--

DROP TABLE IF EXISTS `solar_generation_twh`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `solar_generation_twh` (
  `fk_source_id` int NOT NULL,
  `region` varchar(20) NOT NULL,
  `year_2012` float NOT NULL,
  `year_2022` float NOT NULL,
  `growth_rate_per_annum_pct` float DEFAULT NULL,
  KEY `fk_source_id` (`fk_source_id`),
  CONSTRAINT `solar_generation_twh_ibfk_1` FOREIGN KEY (`fk_source_id`) REFERENCES `renewables_by_source` (`source_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `solar_generation_twh`
--

LOCK TABLES `solar_generation_twh` WRITE;
/*!40000 ALTER TABLE `solar_generation_twh` DISABLE KEYS */;
INSERT INTO `solar_generation_twh` VALUES (2,'North America',10,231.5,36.9),(2,'S. & Cent. America',0.3,54.8,66.3),(2,'Europe',72.2,246.4,13.1),(2,'CIS',0.01,4.9,94.4),(2,'Middle East',0.4,23.7,49.3),(2,'Africa',1,18.2,33.7),(2,'Asia Pacific',17.6,743.2,45.4),(2,'Total World',101.5,1322.6,29.3);
/*!40000 ALTER TABLE `solar_generation_twh` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wind_generation_twh`
--

DROP TABLE IF EXISTS `wind_generation_twh`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wind_generation_twh` (
  `fk_source_id` int NOT NULL,
  `region` varchar(20) NOT NULL,
  `year_2012` float NOT NULL,
  `year_2022` float NOT NULL,
  `growth_rate_per_annum_pct` float DEFAULT NULL,
  KEY `fk_source_id` (`fk_source_id`),
  CONSTRAINT `wind_generation_twh_ibfk_1` FOREIGN KEY (`fk_source_id`) REFERENCES `renewables_by_source` (`source_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wind_generation_twh`
--

LOCK TABLES `wind_generation_twh` WRITE;
/*!40000 ALTER TABLE `wind_generation_twh` DISABLE KEYS */;
INSERT INTO `wind_generation_twh` VALUES (1,'North America',157.2,497,12.2),(1,'S. & Cent. America',7.7,118.4,5.6),(1,'Europe',215,554.5,9.9),(1,'CIS',0.1,7.1,81.7),(1,'Middle East',0.3,3,26),(1,'Africa',2.5,23.9,25.2),(1,'Asia Pacific',147.7,900.9,19.8),(1,'Total World',530.5,2104.8,14.8);
/*!40000 ALTER TABLE `wind_generation_twh` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `energy_combined_view`
--

/*!50001 DROP VIEW IF EXISTS `energy_combined_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `energy_combined_view` AS select `pec`.`region` AS `region`,`pec`.`quantity_ej_2012` AS `quantity_ej_2012`,`pec`.`quantity_ej_2022` AS `quantity_ej_2022`,`pec`.`growth_per_annum_pct` AS `primary_growth_rate`,`ecp`.`quantity_gj_1965` AS `quantity_gj_1965`,`ecp`.`quantity_gj_2012` AS `quantity_gj_2012`,`ecp`.`quantity_gj_2022` AS `quantity_gj_2022`,`ecp`.`growth_per_annum_pct` AS `per_capita_growth_rate` from (`primary_energy_consumption` `pec` join `energy_consumption_per_capita` `ecp` on((`pec`.`region` = `ecp`.`region`))) */;
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

-- Dump completed on 2024-04-03  2:39:57

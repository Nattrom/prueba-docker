-- MySQL dump 10.13  Distrib 8.0.36, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: bd_natalia_romerin_cortissoz
-- ------------------------------------------------------
-- Server version	8.0.44

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
-- Table structure for table `riwi_cities`
--

DROP TABLE IF EXISTS `riwi_cities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `riwi_cities` (
  `riwi_id_city` int NOT NULL,
  `riwi_city_name` varchar(100) NOT NULL,
  PRIMARY KEY (`riwi_id_city`),
  UNIQUE KEY `riwi_city_name` (`riwi_city_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `riwi_customers`
--

DROP TABLE IF EXISTS `riwi_customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `riwi_customers` (
  `riwi_id_customer` int NOT NULL,
  `riwi_customer_name` varchar(150) NOT NULL,
  PRIMARY KEY (`riwi_id_customer`),
  UNIQUE KEY `riwi_customer_name` (`riwi_customer_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `riwi_equipment`
--

DROP TABLE IF EXISTS `riwi_equipment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `riwi_equipment` (
  `riwi_id_equipment` int NOT NULL,
  `riwi_id_category` int NOT NULL,
  `riwi_equipment_model` varchar(150) NOT NULL,
  PRIMARY KEY (`riwi_id_equipment`),
  KEY `riwi_id_category` (`riwi_id_category`),
  CONSTRAINT `riwi_equipment_ibfk_1` FOREIGN KEY (`riwi_id_category`) REFERENCES `riwi_equipment_categories` (`riwi_id_category`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `riwi_equipment_categories`
--

DROP TABLE IF EXISTS `riwi_equipment_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `riwi_equipment_categories` (
  `riwi_id_category` int NOT NULL,
  `riwi_category_name` varchar(100) NOT NULL,
  PRIMARY KEY (`riwi_id_category`),
  UNIQUE KEY `riwi_category_name` (`riwi_category_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `riwi_service_branches`
--

DROP TABLE IF EXISTS `riwi_service_branches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `riwi_service_branches` (
  `riwi_id_branch` int NOT NULL,
  `riwi_id_customer` int NOT NULL,
  `riwi_id_city` int NOT NULL,
  `riwi_branch_name` varchar(100) NOT NULL,
  PRIMARY KEY (`riwi_id_branch`),
  KEY `riwi_id_customer` (`riwi_id_customer`),
  KEY `riwi_id_city` (`riwi_id_city`),
  CONSTRAINT `riwi_service_branches_ibfk_1` FOREIGN KEY (`riwi_id_customer`) REFERENCES `riwi_customers` (`riwi_id_customer`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `riwi_service_branches_ibfk_2` FOREIGN KEY (`riwi_id_city`) REFERENCES `riwi_cities` (`riwi_id_city`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `riwi_service_orders`
--

DROP TABLE IF EXISTS `riwi_service_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `riwi_service_orders` (
  `riwi_id_order` int NOT NULL,
  `riwi_wo_code` varchar(20) NOT NULL,
  `riwi_id_branch` int NOT NULL,
  `riwi_id_technician` int NOT NULL,
  `riwi_id_equipment` int NOT NULL,
  `riwi_id_service_type` int NOT NULL,
  `riwi_service_date` date NOT NULL,
  `riwi_hours` int NOT NULL,
  `riwi_cost` decimal(10,2) NOT NULL,
  PRIMARY KEY (`riwi_id_order`),
  UNIQUE KEY `riwi_wo_code` (`riwi_wo_code`),
  KEY `riwi_id_branch` (`riwi_id_branch`),
  KEY `riwi_id_technician` (`riwi_id_technician`),
  KEY `riwi_id_equipment` (`riwi_id_equipment`),
  KEY `riwi_id_service_type` (`riwi_id_service_type`),
  CONSTRAINT `riwi_service_orders_ibfk_1` FOREIGN KEY (`riwi_id_branch`) REFERENCES `riwi_service_branches` (`riwi_id_branch`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `riwi_service_orders_ibfk_2` FOREIGN KEY (`riwi_id_technician`) REFERENCES `riwi_technicians` (`riwi_id_technician`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `riwi_service_orders_ibfk_3` FOREIGN KEY (`riwi_id_equipment`) REFERENCES `riwi_equipment` (`riwi_id_equipment`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `riwi_service_orders_ibfk_4` FOREIGN KEY (`riwi_id_service_type`) REFERENCES `riwi_service_types` (`riwi_id_service_type`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `riwi_service_orders_chk_1` CHECK ((`riwi_hours` > 0)),
  CONSTRAINT `riwi_service_orders_chk_2` CHECK ((`riwi_cost` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `riwi_service_types`
--

DROP TABLE IF EXISTS `riwi_service_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `riwi_service_types` (
  `riwi_id_service_type` int NOT NULL,
  `riwi_service_name` varchar(100) NOT NULL,
  PRIMARY KEY (`riwi_id_service_type`),
  UNIQUE KEY `riwi_service_name` (`riwi_service_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `riwi_technicians`
--

DROP TABLE IF EXISTS `riwi_technicians`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `riwi_technicians` (
  `riwi_id_technician` int NOT NULL,
  `riwi_full_name` varchar(150) NOT NULL,
  PRIMARY KEY (`riwi_id_technician`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-07-06 15:26:05

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
-- Dumping data for table `riwi_cities`
--

LOCK TABLES `riwi_cities` WRITE;
/*!40000 ALTER TABLE `riwi_cities` DISABLE KEYS */;
INSERT INTO `riwi_cities` VALUES (4,'Barranquilla'),(1,'Bogotá'),(7,'Bucaramanga'),(3,'Cali'),(5,'Cartagena'),(8,'Cúcuta'),(9,'Manizales'),(2,'Medellín'),(6,'Pereira'),(10,'Santa Marta');
/*!40000 ALTER TABLE `riwi_cities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `riwi_customers`
--

LOCK TABLES `riwi_customers` WRITE;
/*!40000 ALTER TABLE `riwi_customers` DISABLE KEYS */;
INSERT INTO `riwi_customers` VALUES (1,'Acme Ltd'),(4,'BioHealth'),(8,'EduCenter'),(9,'Health plus'),(2,'Innova SAS'),(10,'MegaFoods'),(3,'NovaTech'),(7,'RetailOne'),(5,'SoftCorp'),(6,'Vision SA');
/*!40000 ALTER TABLE `riwi_customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `riwi_equipment`
--

LOCK TABLES `riwi_equipment` WRITE;
/*!40000 ALTER TABLE `riwi_equipment` DISABLE KEYS */;
INSERT INTO `riwi_equipment` VALUES (1,1,'Dell Latitude 5420'),(2,2,'HP ProDesk'),(3,3,'Cisco 2960 Switch'),(4,4,'Canon Pixma Pinter'),(5,1,'Lenovo ThinkPad');
/*!40000 ALTER TABLE `riwi_equipment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `riwi_equipment_categories`
--

LOCK TABLES `riwi_equipment_categories` WRITE;
/*!40000 ALTER TABLE `riwi_equipment_categories` DISABLE KEYS */;
INSERT INTO `riwi_equipment_categories` VALUES (2,'Desktop'),(1,'Laptop'),(3,'Networking'),(4,'Printer');
/*!40000 ALTER TABLE `riwi_equipment_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `riwi_service_branches`
--

LOCK TABLES `riwi_service_branches` WRITE;
/*!40000 ALTER TABLE `riwi_service_branches` DISABLE KEYS */;
INSERT INTO `riwi_service_branches` VALUES (1,1,1,'North Branch'),(2,2,2,'Headquarters(HQ)'),(3,3,3,'West District'),(4,4,4,'Main Station'),(5,5,5,'Coastal Office'),(6,6,6,'Coffee Belt Zone'),(7,7,7,'East Department'),(8,8,8,'Northeast Hub'),(9,9,9,'Central Facility'),(10,10,10,'Caribbean Point');
/*!40000 ALTER TABLE `riwi_service_branches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `riwi_service_orders`
--

LOCK TABLES `riwi_service_orders` WRITE;
/*!40000 ALTER TABLE `riwi_service_orders` DISABLE KEYS */;
INSERT INTO `riwi_service_orders` VALUES (1,'WO1001',1,1,1,1,'2026-05-01',2,210.00),(2,'WO1002',1,1,1,1,'2026-05-02',3,180.00),(3,'WO1003',2,2,2,2,'2026-05-03',4,250.00),(4,'WO1004',2,2,2,2,'2026-05-04',2,150.00),(5,'WO1005',3,3,3,3,'2026-05-05',5,500.00),(6,'WO1006',3,3,3,3,'2026-05-06',4,450.00),(7,'WO1007',4,4,4,2,'2026-05-07',2,130.00),(8,'WO1008',4,4,4,2,'2026-05-08',3,200.00),(9,'WO1009',5,5,5,1,'2026-05-09',2,140.00),(10,'WO1010',5,5,5,1,'2026-05-10',3,190.00),(11,'WO1011',6,1,2,3,'2026-05-11',6,550.00),(12,'WO1012',6,1,2,3,'2026-05-12',5,520.00),(13,'WO1013',7,2,1,2,'2026-05-13',2,160.00),(14,'WO1014',7,2,1,2,'2026-05-14',3,210.00),(15,'WO1015',8,3,3,1,'2026-05-15',2,125.00),(16,'WO1016',8,3,3,1,'2026-05-16',2,135.00),(17,'WO1017',9,4,4,3,'2026-05-17',4,400.00),(18,'WO1018',9,4,4,3,'2026-05-18',5,430.00),(19,'WO1019',10,5,5,2,'2026-05-19',3,220.00),(20,'WO1020',10,5,5,2,'2026-05-20',4,260.00);
/*!40000 ALTER TABLE `riwi_service_orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `riwi_service_types`
--

LOCK TABLES `riwi_service_types` WRITE;
/*!40000 ALTER TABLE `riwi_service_types` DISABLE KEYS */;
INSERT INTO `riwi_service_types` VALUES (2,'Corrective'),(3,'Installation'),(1,'Preventive');
/*!40000 ALTER TABLE `riwi_service_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `riwi_technicians`
--

LOCK TABLES `riwi_technicians` WRITE;
/*!40000 ALTER TABLE `riwi_technicians` DISABLE KEYS */;
INSERT INTO `riwi_technicians` VALUES (1,'Juan Perez'),(2,'Maria Gomez'),(3,'Carlos Ruiz'),(4,'Laura Diaz'),(5,'Andres Mora ');
/*!40000 ALTER TABLE `riwi_technicians` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-07-06 15:24:10

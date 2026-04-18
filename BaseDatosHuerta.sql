-- MySQL dump 10.13  Distrib 8.0.43, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: huerta
-- ------------------------------------------------------
-- Server version	8.0.43

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
-- Table structure for table `actividad`
--

DROP TABLE IF EXISTS `actividad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `actividad` (
  `idActividad` int NOT NULL AUTO_INCREMENT,
  `actividades` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`idActividad`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `actividad`
--

LOCK TABLES `actividad` WRITE;
/*!40000 ALTER TABLE `actividad` DISABLE KEYS */;
INSERT INTO `actividad` VALUES (1,'Preparación del suelo'),(2,'Siembra'),(3,'Raleo'),(4,'Abono'),(5,'Cosecha'),(6,'Riego');
/*!40000 ALTER TABLE `actividad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estacion`
--

DROP TABLE IF EXISTS `estacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estacion` (
  `idEstacion` int NOT NULL AUTO_INCREMENT,
  `estacion` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idEstacion`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estacion`
--

LOCK TABLES `estacion` WRITE;
/*!40000 ALTER TABLE `estacion` DISABLE KEYS */;
INSERT INTO `estacion` VALUES (1,'Primavera-Verano'),(2,'Otoño-Invierno');
/*!40000 ALTER TABLE `estacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `familia`
--

DROP TABLE IF EXISTS `familia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `familia` (
  `idfamilia` int NOT NULL AUTO_INCREMENT,
  `familia` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`idfamilia`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `familia`
--

LOCK TABLES `familia` WRITE;
/*!40000 ALTER TABLE `familia` DISABLE KEYS */;
INSERT INTO `familia` VALUES (1,'Solanaceas'),(2,'Asteraceas'),(3,'Apiaceas');
/*!40000 ALTER TABLE `familia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `labores`
--

DROP TABLE IF EXISTS `labores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `labores` (
  `idLabores` int NOT NULL AUTO_INCREMENT,
  `variedad` int DEFAULT NULL,
  `actividad` int DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `parcela` int DEFAULT NULL,
  PRIMARY KEY (`idLabores`),
  KEY `variedad` (`variedad`),
  KEY `actividad` (`actividad`),
  KEY `parcela` (`parcela`),
  CONSTRAINT `labores_ibfk_1` FOREIGN KEY (`variedad`) REFERENCES `variedad` (`idvariedad`),
  CONSTRAINT `labores_ibfk_2` FOREIGN KEY (`actividad`) REFERENCES `actividad` (`idActividad`),
  CONSTRAINT `labores_ibfk_3` FOREIGN KEY (`parcela`) REFERENCES `parcela` (`idParcela`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `labores`
--

LOCK TABLES `labores` WRITE;
/*!40000 ALTER TABLE `labores` DISABLE KEYS */;
INSERT INTO `labores` VALUES (1,1,1,'2026-03-12',1),(2,1,2,'2026-04-06',1);
/*!40000 ALTER TABLE `labores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `parcela`
--

DROP TABLE IF EXISTS `parcela`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `parcela` (
  `idParcela` int NOT NULL AUTO_INCREMENT,
  `parcela` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idParcela`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `parcela`
--

LOCK TABLES `parcela` WRITE;
/*!40000 ALTER TABLE `parcela` DISABLE KEYS */;
INSERT INTO `parcela` VALUES (1,'Lote 1'),(2,'Lote 2'),(3,'Lote 3');
/*!40000 ALTER TABLE `parcela` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `variedad`
--

DROP TABLE IF EXISTS `variedad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `variedad` (
  `idvariedad` int NOT NULL AUTO_INCREMENT,
  `nombreVariedad` varchar(100) DEFAULT NULL,
  `familia` int DEFAULT NULL,
  `estacion` int DEFAULT NULL,
  `resistenciaHeladas` tinyint(1) DEFAULT NULL,
  `produccionXMcuadKG` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`idvariedad`),
  KEY `familia` (`familia`),
  KEY `estacion` (`estacion`),
  CONSTRAINT `variedad_ibfk_1` FOREIGN KEY (`familia`) REFERENCES `familia` (`idfamilia`),
  CONSTRAINT `variedad_ibfk_2` FOREIGN KEY (`estacion`) REFERENCES `estacion` (`idEstacion`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `variedad`
--

LOCK TABLES `variedad` WRITE;
/*!40000 ALTER TABLE `variedad` DISABLE KEYS */;
INSERT INTO `variedad` VALUES (1,'Tomate',1,1,0,5.50),(2,'Lechuga',2,1,0,3.20),(3,'Zanahoria',3,2,1,4.00);
/*!40000 ALTER TABLE `variedad` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-04-18 16:54:36

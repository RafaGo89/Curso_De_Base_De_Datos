CREATE DATABASE  IF NOT EXISTS `dbreservas` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `dbreservas`;
-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: localhost    Database: dbreservas
-- ------------------------------------------------------
-- Server version	8.0.31

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
-- Table structure for table `agencias`
--

DROP TABLE IF EXISTS `agencias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `agencias` (
  `codAge` char(10) NOT NULL,
  `nomAge` char(40) DEFAULT NULL,
  PRIMARY KEY (`codAge`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agencias`
--

LOCK TABLES `agencias` WRITE;
/*!40000 ALTER TABLE `agencias` DISABLE KEYS */;
INSERT INTO `agencias` VALUES ('AGE-01','DAOSA PLAZA PALOMAR'),('AGE-02','AUTOMOTORES CHAPALITA'),('AGE-03','COVAL');
/*!40000 ALTER TABLE `agencias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes` (
  `codCli` char(5) NOT NULL,
  `DNI` int unsigned NOT NULL AUTO_INCREMENT,
  `nomCli` char(40) DEFAULT NULL,
  `domCli` char(45) DEFAULT NULL,
  `telCli` char(15) DEFAULT NULL,
  `codAval` char(5) DEFAULT NULL,
  PRIMARY KEY (`codCli`),
  KEY `DNI` (`DNI`),
  KEY `codAval` (`codAval`),
  CONSTRAINT `clientes_ibfk_1` FOREIGN KEY (`codAval`) REFERENCES `clientes` (`codCli`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES ('CL001',3,'Gerardo Lopez','Juarez 322','32-42342354',NULL),('CL002',4,'Carlos fuentes','Alcalde 444','444-456-456',NULL),('CL003',1,'Francisco Gomez','Hidalgo 345','123-456-456',NULL);
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coches`
--

DROP TABLE IF EXISTS `coches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `coches` (
  `matricula` char(10) NOT NULL,
  `modelo` char(20) DEFAULT NULL,
  `color` enum('ROJO','VERDE','NEGRO','AZUL','BLANCO') DEFAULT NULL,
  `marca` char(12) DEFAULT NULL,
  `precio_alquiler` float DEFAULT NULL,
  `codRes` int unsigned DEFAULT NULL,
  `l_gasolina` int DEFAULT '10',
  `garaje` enum('A','B','C') DEFAULT NULL,
  PRIMARY KEY (`matricula`),
  KEY `codRes` (`codRes`),
  CONSTRAINT `coches_ibfk_1` FOREIGN KEY (`codRes`) REFERENCES `reservas` (`codRes`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coches`
--

LOCK TABLES `coches` WRITE;
/*!40000 ALTER TABLE `coches` DISABLE KEYS */;
INSERT INTO `coches` VALUES ('ABC-123','MONZA 2003','NEGRO','CHRYSLER',300,NULL,10,'B'),('DEF-123','PICKUP 2004','ROJO','CHRYSLER',500,NULL,45,'B'),('HGF-123','STRATUS 2015','ROJO','CHRYSLER',570,NULL,10,'A');
/*!40000 ALTER TABLE `coches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservas`
--

DROP TABLE IF EXISTS `reservas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reservas` (
  `codRes` int unsigned NOT NULL AUTO_INCREMENT,
  `fec_ini` date DEFAULT NULL,
  `fec_fin` date DEFAULT NULL,
  `pag_total` double(12,2) DEFAULT NULL,
  `indicador` enum('S','N') DEFAULT 'N',
  `codCli` char(5) DEFAULT NULL,
  `codAge` char(10) DEFAULT NULL,
  PRIMARY KEY (`codRes`),
  KEY `codAge` (`codAge`),
  KEY `codCli` (`codCli`),
  CONSTRAINT `reservas_ibfk_2` FOREIGN KEY (`codAge`) REFERENCES `agencias` (`codAge`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `reservas_ibfk_3` FOREIGN KEY (`codCli`) REFERENCES `clientes` (`codCli`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservas`
--

LOCK TABLES `reservas` WRITE;
/*!40000 ALTER TABLE `reservas` DISABLE KEYS */;
INSERT INTO `reservas` VALUES (1,'2021-09-01','2021-09-22',NULL,'N','CL003','AGE-01'),(2,'2021-08-15','2021-09-30',NULL,'N','CL001','AGE-01'),(3,'2021-08-17','2021-08-30',NULL,'N','CL002','AGE-01');
/*!40000 ALTER TABLE `reservas` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-02-02 13:11:40

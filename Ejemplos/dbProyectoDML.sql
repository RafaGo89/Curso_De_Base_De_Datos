CREATE DATABASE  IF NOT EXISTS `dbproyecto` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `dbproyecto`;
-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: localhost    Database: dbproyecto
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
-- Table structure for table `j`
--

DROP TABLE IF EXISTS `j`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `j` (
  `jno` char(2) NOT NULL,
  `jnombre` varchar(40) DEFAULT NULL,
  `jciudad` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`jno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `j`
--

LOCK TABLES `j` WRITE;
/*!40000 ALTER TABLE `j` DISABLE KEYS */;
INSERT INTO `j` VALUES ('J1','Clasificador','Paris'),('J2','Perforadora','Roma'),('J3','LECTORA','ATENAS'),('J4','CONSOLA','ATENAS'),('J5','COMPAGINADOR','LONDRES'),('J6','TERMINAL','OSLO'),('J7','CINTA','LONDRES'),('J8','GRABADORA','ROMA');
/*!40000 ALTER TABLE `j` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `p`
--

DROP TABLE IF EXISTS `p`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `p` (
  `pno` char(2) NOT NULL,
  `pnombre` varchar(40) DEFAULT NULL,
  `color` char(15) DEFAULT NULL,
  `peso` int DEFAULT NULL,
  `pciudad` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`pno`),
  KEY `pnombre` (`pnombre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `p`
--

LOCK TABLES `p` WRITE;
/*!40000 ALTER TABLE `p` DISABLE KEYS */;
INSERT INTO `p` VALUES ('P1','TUERCA','ROJO',12,'LONDRES'),('P2','PERNO','VERDE',17,'PARIS'),('P3','BIRLO','AZUL',17,'ROMA'),('P4','BIRLO','ROJO',14,'LONDRES'),('P5','LEVA','AZUL',12,'PARIS'),('P6','ENGRANE','ROJO',19,'LONDRES');
/*!40000 ALTER TABLE `p` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s`
--

DROP TABLE IF EXISTS `s`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `s` (
  `sno` char(2) NOT NULL,
  `snombre` varchar(40) DEFAULT NULL,
  `sciudad` varchar(30) DEFAULT NULL,
  `situacion` int DEFAULT NULL,
  PRIMARY KEY (`sno`),
  KEY `snombre` (`snombre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s`
--

LOCK TABLES `s` WRITE;
/*!40000 ALTER TABLE `s` DISABLE KEYS */;
INSERT INTO `s` VALUES ('S1','SALAZAR','LONDRES',20),('S2','JAIMES','PARIS',10),('S3','BERNAL','PARIS',30),('S4','CORONA','LONDRES',20),('S5','ALDANA','ATENAS',30);
/*!40000 ALTER TABLE `s` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sp`
--

DROP TABLE IF EXISTS `sp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sp` (
  `sno` char(2) NOT NULL,
  `pno` char(2) NOT NULL,
  `cant` int DEFAULT NULL,
  KEY `sno` (`sno`),
  KEY `pno` (`pno`),
  CONSTRAINT `sp_ibfk_1` FOREIGN KEY (`sno`) REFERENCES `s` (`sno`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `sp_ibfk_2` FOREIGN KEY (`pno`) REFERENCES `p` (`pno`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sp`
--

LOCK TABLES `sp` WRITE;
/*!40000 ALTER TABLE `sp` DISABLE KEYS */;
INSERT INTO `sp` VALUES ('S1','P1',500),('S2','P2',700),('S2','P3',850),('S3','P4',900),('S2','P5',1100),('S5','P6',650),('S5','P1',890),('S5','P2',500),('S3','P2',60),('S4','P2',1200),('S5','P4',1115),('S5','P5',2005),('S5','P3',1510),('S2','P6',990);
/*!40000 ALTER TABLE `sp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spj`
--

DROP TABLE IF EXISTS `spj`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `spj` (
  `sno` char(2) NOT NULL,
  `pno` char(2) NOT NULL,
  `jno` char(2) NOT NULL,
  `cant` int DEFAULT NULL,
  PRIMARY KEY (`sno`,`pno`,`jno`),
  KEY `pno` (`pno`),
  KEY `jno` (`jno`),
  CONSTRAINT `spj_ibfk_1` FOREIGN KEY (`sno`) REFERENCES `s` (`sno`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `spj_ibfk_2` FOREIGN KEY (`pno`) REFERENCES `p` (`pno`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `spj_ibfk_3` FOREIGN KEY (`jno`) REFERENCES `j` (`jno`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spj`
--

LOCK TABLES `spj` WRITE;
/*!40000 ALTER TABLE `spj` DISABLE KEYS */;
INSERT INTO `spj` VALUES ('S1','P1','J1',200),('S1','P1','J4',700),('S1','P1','J8',450),('S2','P3','J1',400),('S2','P3','J2',200),('S2','P3','J3',200),('S2','P3','J4',500),('S2','P3','J5',600),('S2','P3','J6',400),('S2','P3','J7',800),('S2','P5','J2',100),('S3','P3','J1',200),('S3','P4','J2',500),('S4','P6','J3',300),('S4','P6','J7',300),('S5','P1','J4',100),('S5','P2','J2',200),('S5','P2','J4',100),('S5','P3','J4',200),('S5','P4','J4',800),('S5','P5','J4',400),('S5','P5','J5',500),('S5','P5','J7',100),('S5','P6','J4',500);
/*!40000 ALTER TABLE `spj` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `temporal`
--

DROP TABLE IF EXISTS `temporal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `temporal` (
  `sno` char(2) NOT NULL,
  `snombre` varchar(40) DEFAULT NULL,
  `sciudad` varchar(30) DEFAULT NULL,
  `situacion` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `temporal`
--

LOCK TABLES `temporal` WRITE;
/*!40000 ALTER TABLE `temporal` DISABLE KEYS */;
/*!40000 ALTER TABLE `temporal` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-02-02 13:10:55

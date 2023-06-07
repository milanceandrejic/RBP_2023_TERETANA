CREATE DATABASE  IF NOT EXISTS `teretana_rbp` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci */;
USE `teretana_rbp`;
-- MySQL dump 10.13  Distrib 8.0.33, for macos13 (arm64)
--
-- Host: 127.0.0.1    Database: teretana_rbp
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.28-MariaDB

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
-- Table structure for table `clan`
--

DROP TABLE IF EXISTS `clan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clan` (
  `id_clan` int(11) NOT NULL AUTO_INCREMENT,
  `clanski_broj` varchar(20) NOT NULL,
  `ime` varchar(30) NOT NULL,
  `prezime` varchar(30) NOT NULL,
  `mail` varchar(50) NOT NULL,
  `telefon` varchar(20) NOT NULL,
  `datum_rodjenja` date NOT NULL,
  `pol` int(11) NOT NULL,
  `id_tip_clanarine` int(11) DEFAULT NULL,
  `datum_uplate` date DEFAULT NULL,
  `datum_isteka` date DEFAULT NULL,
  PRIMARY KEY (`id_clan`),
  UNIQUE KEY `id_clan` (`id_clan`),
  KEY `clan_fk0` (`id_tip_clanarine`),
  CONSTRAINT `clan_fk0` FOREIGN KEY (`id_tip_clanarine`) REFERENCES `tip_clanarine` (`id_tip`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clan`
--

LOCK TABLES `clan` WRITE;
/*!40000 ALTER TABLE `clan` DISABLE KEYS */;
INSERT INTO `clan` VALUES (1,'M1','Milan','Gavrilov','milannrt2320@gs.viser.edu.rs','0658804295','2001-07-09',1,NULL,NULL,NULL),(2,'M2','Milanče','Andrejić','milancenrt820@gs.viser.edu.rs','0631909652','2002-02-02',1,NULL,NULL,NULL),(13,'M3','Milan','Stankovic','milan.stanke@gmail.com','0600202683','2002-02-17',1,NULL,NULL,NULL),(14,'Z4','Jovana','Radojkovic','jovanajokaa@gmail.com','0601449447','2002-09-19',0,NULL,NULL,NULL),(15,'M5','Ilija','Radosavljevic','ilajdza94@gmail.com','0621437023','1994-08-01',1,NULL,NULL,NULL);
/*!40000 ALTER TABLE `clan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `korisnik`
--

DROP TABLE IF EXISTS `korisnik`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `korisnik` (
  `id_korisnik` int(11) NOT NULL AUTO_INCREMENT,
  `ime` varchar(30) NOT NULL,
  `prezime` varchar(30) NOT NULL,
  `mail` varchar(50) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(64) NOT NULL,
  PRIMARY KEY (`id_korisnik`),
  UNIQUE KEY `id_korisnik` (`id_korisnik`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `korisnik`
--

LOCK TABLES `korisnik` WRITE;
/*!40000 ALTER TABLE `korisnik` DISABLE KEYS */;
INSERT INTO `korisnik` VALUES (1,'Milanče','Andrejić','milanceandrejic02@gmail.com','milance','b08a7c3d7095ed6bf3719c2394e78a04cc3d1b6e0491ae404ededa7189a183fc'),(2,'Administrator','Administrator','Administrator@Administrator.com','admin','8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918');
/*!40000 ALTER TABLE `korisnik` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tip_clanarine`
--

DROP TABLE IF EXISTS `tip_clanarine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tip_clanarine` (
  `id_tip` int(11) NOT NULL AUTO_INCREMENT,
  `naziv_tipa` varchar(30) NOT NULL,
  `period_trajanja` int(11) NOT NULL,
  `cena` float NOT NULL,
  PRIMARY KEY (`id_tip`),
  UNIQUE KEY `id_tip` (`id_tip`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tip_clanarine`
--

LOCK TABLES `tip_clanarine` WRITE;
/*!40000 ALTER TABLE `tip_clanarine` DISABLE KEYS */;
INSERT INTO `tip_clanarine` VALUES (1,'Mesecna',30,3000),(2,'Dnevna',1,400),(3,'Godisnja',365,27000),(4,'Tromesecna',90,8100),(5,'Studentska',30,2400);
/*!40000 ALTER TABLE `tip_clanarine` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uplate`
--

DROP TABLE IF EXISTS `uplate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `uplate` (
  `id_uplate` int(11) NOT NULL AUTO_INCREMENT,
  `id_clana` int(11) NOT NULL,
  `iznos` float NOT NULL,
  `vreme_uplate` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `id_korisnik` int(11) NOT NULL,
  PRIMARY KEY (`id_uplate`),
  UNIQUE KEY `id_uplate` (`id_uplate`),
  KEY `uplate_fk0` (`id_clana`),
  KEY `uplate_fk1` (`id_korisnik`),
  CONSTRAINT `uplate_fk0` FOREIGN KEY (`id_clana`) REFERENCES `clan` (`id_clan`),
  CONSTRAINT `uplate_fk1` FOREIGN KEY (`id_korisnik`) REFERENCES `korisnik` (`id_korisnik`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uplate`
--

LOCK TABLES `uplate` WRITE;
/*!40000 ALTER TABLE `uplate` DISABLE KEYS */;
/*!40000 ALTER TABLE `uplate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `view_clanovi`
--

DROP TABLE IF EXISTS `view_clanovi`;
/*!50001 DROP VIEW IF EXISTS `view_clanovi`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `view_clanovi` AS SELECT 
 1 AS `clanski_broj`,
 1 AS `ime`,
 1 AS `prezime`,
 1 AS `datum_isteka`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping routines for database 'teretana_rbp'
--
/*!50003 DROP PROCEDURE IF EXISTS `sp_pretrazi` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_pretrazi`(keyword nchar(30))
BEGIN
select * FROM VIEW_CLANOVI where 
ime like CONCAT("%",keyword,"%") or
prezime like CONCAT("%",keyword,"%") or
clanski_broj like CONCAT("%",keyword,"%");
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_update_view` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_update_view`()
BEGIN

drop view if exists view_clanovi;
create view view_clanovi as
select clanski_broj, ime, prezime, datum_isteka from clan;
commit;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `view_clanovi`
--

/*!50001 DROP VIEW IF EXISTS `view_clanovi`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_clanovi` AS select `clan`.`clanski_broj` AS `clanski_broj`,`clan`.`ime` AS `ime`,`clan`.`prezime` AS `prezime`,`clan`.`datum_isteka` AS `datum_isteka` from `clan` */;
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

-- Dump completed on 2023-06-07 19:12:32

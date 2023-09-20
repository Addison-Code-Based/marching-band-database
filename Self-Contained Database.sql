-- MySQL dump 10.13  Distrib 5.6.24, for Win64 (x86_64)
--
-- Host: sis-teach-01.sis.pitt.edu    Database: ams539
-- ------------------------------------------------------
-- Server version	5.1.73

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `administrators`
--

DROP TABLE IF EXISTS `administrators`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `administrators` (
  `administrator_id` int(11) NOT NULL,
  `first_name` varchar(20) NOT NULL,
  `last_name` varchar(20) NOT NULL,
  PRIMARY KEY (`administrator_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `administrators`
--

LOCK TABLES `administrators` WRITE;
/*!40000 ALTER TABLE `administrators` DISABLE KEYS */;
INSERT INTO `administrators` VALUES (1,'Heather','Lyke'),(2,'Wendy','Myers'),(3,'Raul','Mendes'),(4,'Roger','Temple'),(5,'Catherine','Manns');
/*!40000 ALTER TABLE `administrators` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `directors`
--

DROP TABLE IF EXISTS `directors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `directors` (
  `director_id` int(11) NOT NULL,
  `first_name` varchar(20) NOT NULL,
  `last_name` varchar(20) NOT NULL,
  PRIMARY KEY (`director_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `directors`
--

LOCK TABLES `directors` WRITE;
/*!40000 ALTER TABLE `directors` DISABLE KEYS */;
INSERT INTO `directors` VALUES (1,'Bradley','Townsend'),(2,'Mathew','Alosi'),(3,'Mel','Orange'),(4,'Paul','Rush'),(5,'Jessica','Kennedy');
/*!40000 ALTER TABLE `directors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `instruments`
--

DROP TABLE IF EXISTS `instruments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `instruments` (
  `instrument_id` int(11) NOT NULL,
  `instrument_name` varchar(20) NOT NULL,
  `instrument_condition` varchar(20) NOT NULL,
  `fk_section_id` int(11) NOT NULL,
  PRIMARY KEY (`instrument_id`),
  KEY `fk_section_id` (`fk_section_id`),
  CONSTRAINT `instruments_ibfk_1` FOREIGN KEY (`fk_section_id`) REFERENCES `sections` (`section_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `instruments`
--

LOCK TABLES `instruments` WRITE;
/*!40000 ALTER TABLE `instruments` DISABLE KEYS */;
INSERT INTO `instruments` VALUES (1,'Snare Drum1','Average',1),(2,'Trumpet1','Good',2),(3,'Sousaphone1','Poor',3),(4,'Saxophone1','Average',4),(5,'Melophone1','Good',5);
/*!40000 ALTER TABLE `instruments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `leaders`
--

DROP TABLE IF EXISTS `leaders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `leaders` (
  `leader_id` int(11) NOT NULL,
  `first_name` varchar(20) NOT NULL,
  `last_name` varchar(20) NOT NULL,
  `leader_year` year(4) NOT NULL,
  PRIMARY KEY (`leader_id`),
  KEY `leaderName` (`last_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leaders`
--

LOCK TABLES `leaders` WRITE;
/*!40000 ALTER TABLE `leaders` DISABLE KEYS */;
INSERT INTO `leaders` VALUES (1,'Connor','Stewart',2018),(2,'Michael','Buckstein',2018),(3,'Tina','Rogers',2018),(4,'Joe','Kitching',2018),(5,'Michelle','Pfahles',2018);
/*!40000 ALTER TABLE `leaders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `members`
--

DROP TABLE IF EXISTS `members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `members` (
  `member_id` int(11) NOT NULL,
  `first_name` varchar(20) NOT NULL,
  `last_name` varchar(20) NOT NULL,
  `fk_instrument_id` int(11) NOT NULL,
  `fk_leader_id` int(11) NOT NULL,
  PRIMARY KEY (`member_id`),
  KEY `fk_instrument_id` (`fk_instrument_id`),
  KEY `fk_leader_id` (`fk_leader_id`),
  KEY `memberName` (`last_name`),
  CONSTRAINT `members_ibfk_1` FOREIGN KEY (`fk_instrument_id`) REFERENCES `instruments` (`instrument_id`),
  CONSTRAINT `members_ibfk_2` FOREIGN KEY (`fk_leader_id`) REFERENCES `leaders` (`leader_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `members`
--

LOCK TABLES `members` WRITE;
/*!40000 ALTER TABLE `members` DISABLE KEYS */;
INSERT INTO `members` VALUES (1,'Addison','Shroyer',1,1),(2,'Luke','Barone',2,2),(3,'Paige','Oswald',3,3),(4,'Rachel','Hines',4,4),(5,'Noah','Crawford',5,5);
/*!40000 ALTER TABLE `members` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `membersWithInstruments`
--

DROP TABLE IF EXISTS `membersWithInstruments`;
/*!50001 DROP VIEW IF EXISTS `membersWithInstruments`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `membersWithInstruments` AS SELECT 
 1 AS `last_name`,
 1 AS `first_name`,
 1 AS `instrument_name`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `scholarships`
--

DROP TABLE IF EXISTS `scholarships`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `scholarships` (
  `scholarship_id` int(11) NOT NULL,
  `amount` int(11) NOT NULL,
  PRIMARY KEY (`scholarship_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scholarships`
--

LOCK TABLES `scholarships` WRITE;
/*!40000 ALTER TABLE `scholarships` DISABLE KEYS */;
INSERT INTO `scholarships` VALUES (1,50),(2,100),(3,150),(4,200),(5,250);
/*!40000 ALTER TABLE `scholarships` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sections`
--

DROP TABLE IF EXISTS `sections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sections` (
  `section_id` int(11) NOT NULL,
  `section_name` varchar(20) NOT NULL,
  PRIMARY KEY (`section_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sections`
--

LOCK TABLES `sections` WRITE;
/*!40000 ALTER TABLE `sections` DISABLE KEYS */;
INSERT INTO `sections` VALUES (1,'Drumline'),(2,'Trumpets'),(3,'Sousaphones'),(4,'Saxophones'),(5,'Melophones');
/*!40000 ALTER TABLE `sections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff_techs_sections`
--

DROP TABLE IF EXISTS `staff_techs_sections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `staff_techs_sections` (
  `fk_tech_id` int(11) NOT NULL,
  `fk_section_id` int(11) NOT NULL,
  KEY `fk_tech_id` (`fk_tech_id`),
  KEY `fk_section_id` (`fk_section_id`),
  CONSTRAINT `staff_techs_sections_ibfk_1` FOREIGN KEY (`fk_tech_id`) REFERENCES `tech_staff` (`tech_id`),
  CONSTRAINT `staff_techs_sections_ibfk_2` FOREIGN KEY (`fk_section_id`) REFERENCES `sections` (`section_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff_techs_sections`
--

LOCK TABLES `staff_techs_sections` WRITE;
/*!40000 ALTER TABLE `staff_techs_sections` DISABLE KEYS */;
INSERT INTO `staff_techs_sections` VALUES (1,1),(2,2),(3,3),(4,4),(5,5);
/*!40000 ALTER TABLE `staff_techs_sections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `support_staff`
--

DROP TABLE IF EXISTS `support_staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `support_staff` (
  `support_id` int(11) NOT NULL,
  `first_name` varchar(20) NOT NULL,
  `last_name` varchar(20) NOT NULL,
  PRIMARY KEY (`support_id`),
  KEY `supportName` (`last_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `support_staff`
--

LOCK TABLES `support_staff` WRITE;
/*!40000 ALTER TABLE `support_staff` DISABLE KEYS */;
INSERT INTO `support_staff` VALUES (1,'Jean','Wilts'),(2,'Calvin','Harris'),(3,'Jefferey','Goods'),(4,'Wilbur','Manns'),(5,'Jullian','Wooter');
/*!40000 ALTER TABLE `support_staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tech_staff`
--

DROP TABLE IF EXISTS `tech_staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tech_staff` (
  `tech_id` int(11) NOT NULL,
  `first_name` varchar(20) NOT NULL,
  `last_name` varchar(20) NOT NULL,
  PRIMARY KEY (`tech_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tech_staff`
--

LOCK TABLES `tech_staff` WRITE;
/*!40000 ALTER TABLE `tech_staff` DISABLE KEYS */;
INSERT INTO `tech_staff` VALUES (1,'Cory','Chamberlain'),(2,'Mel','Orange'),(3,'Alex','Faulds'),(4,'Maxwell','Goodman'),(5,'Gary','Cox');
/*!40000 ALTER TABLE `tech_staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `techsOfSections`
--

DROP TABLE IF EXISTS `techsOfSections`;
/*!50001 DROP VIEW IF EXISTS `techsOfSections`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `techsOfSections` AS SELECT 
 1 AS `last_name`,
 1 AS `first_name`,
 1 AS `section_name`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `trips`
--

DROP TABLE IF EXISTS `trips`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trips` (
  `trip_id` int(11) NOT NULL,
  `location` varchar(20) NOT NULL,
  `trip_year` year(4) NOT NULL,
  PRIMARY KEY (`trip_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trips`
--

LOCK TABLES `trips` WRITE;
/*!40000 ALTER TABLE `trips` DISABLE KEYS */;
INSERT INTO `trips` VALUES (1,'Duke',2018),(2,'Notre Dame',2018),(3,'ACC Championship',2018),(4,'NCAA Mens Tournament',2019),(5,'NCAA Womens Tourname',2019);
/*!40000 ALTER TABLE `trips` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `membersWithInstruments`
--

/*!50001 DROP VIEW IF EXISTS `membersWithInstruments`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`ams539`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `membersWithInstruments` AS select `m`.`last_name` AS `last_name`,`m`.`first_name` AS `first_name`,`i`.`instrument_name` AS `instrument_name` from (`members` `m` join `instruments` `i` on((`i`.`instrument_id` = `m`.`fk_instrument_id`))) group by `i`.`instrument_name` order by `m`.`last_name` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `techsOfSections`
--

/*!50001 DROP VIEW IF EXISTS `techsOfSections`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`ams539`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `techsOfSections` AS select `t`.`last_name` AS `last_name`,`t`.`first_name` AS `first_name`,`s`.`section_name` AS `section_name` from ((`tech_staff` `t` join `staff_techs_sections` `ts` on((`t`.`tech_id` = `ts`.`fk_tech_id`))) join `sections` `s` on((`ts`.`fk_section_id` = `s`.`section_id`))) group by `s`.`section_name` order by `t`.`last_name` */;
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

-- Dump completed on 2019-04-18 23:34:26

-- MySQL dump 10.13  Distrib 5.6.32, for osx10.8 (x86_64)
--
-- Host: localhost    Database: dbatools
-- ------------------------------------------------------
-- Server version	5.6.32

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
-- Table structure for table `innodb_lock_monitor`
--

DROP TABLE IF EXISTS `innodb_lock_monitor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `innodb_lock_monitor` (
  `innodb_lock_monitor_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`innodb_lock_monitor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `innodb_lock_monitor`
--

LOCK TABLES `innodb_lock_monitor` WRITE;
/*!40000 ALTER TABLE `innodb_lock_monitor` DISABLE KEYS */;
/*!40000 ALTER TABLE `innodb_lock_monitor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `revision`
--

DROP TABLE IF EXISTS `revision`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `revision` (
  `revision_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `revision_num` char(8) NOT NULL,
  `github_commit_hash` varchar(255) NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Timestamp of initial creation.',
  `modified` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'Timestamp of modification.',
  PRIMARY KEY (`revision_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `revision`
--

LOCK TABLES `revision` WRITE;
/*!40000 ALTER TABLE `revision` DISABLE KEYS */;
INSERT INTO `revision` VALUES (1,'0.0.5','0a44a7a','2016-08-31 18:08:09',NULL),(2,'0.0.6','f6a38ea','2016-09-01 23:45:09',NULL),(3,'0.0.7','4dbe296','2016-09-12 23:10:00',NULL),(4,'0.0.8','efae195','2016-09-26 23:00:00',NULL),(5,'0.0.9','8014e02','2016-09-27 21:00:00',NULL);
/*!40000 ALTER TABLE `revision` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'dbatools'
--
/*!50003 DROP PROCEDURE IF EXISTS `AUTH_USER_PASS_UPDATE` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `AUTH_USER_PASS_UPDATE`(
  IN q_username CHAR(64),
  IN q_passwd VARCHAR(64))
    COMMENT 'Update password for a user ARGV1, with specified password as ARGV2. mysql> call AUTH_USER_PASS_UPDATE("user","newpass")'
proc_label:BEGIN

IF q_username IS NULL OR q_username = '' THEN
  SELECT "ERROR: ARGV1 not set. Syntax: AUTH_USER_PASS_UPDATE('username','newpass');" AS error;
  LEAVE proc_label;
END IF;

IF q_passwd IS NULL OR q_passwd = '' THEN
  SELECT "ERROR: ARGV2 not set. Syntax: AUTH_USER_PASS_UPDATE('username','newpass');" AS error;
  LEAVE proc_label;
END IF;

UPDATE mysql.user SET Password=PASSWORD(q_passwd) WHERE User=q_username;
SELECT CONCAT("Updated user [",q_username, "] to password [", q_passwd,"]") AS output;
FLUSH PRIVILEGES;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AUTH_USER_SEARCH` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `AUTH_USER_SEARCH`(
  IN q_username CHAR(64))
    COMMENT 'Lists permissions for a given username. mysql> call AUTH_USER_SEARCH("foo")'
proc_label:BEGIN

IF q_username IS NULL OR q_username = '' THEN
  SELECT "ERROR: ARGV1 not set. Specify a username via mysql> call AUTH_USER_SEARCH('foo');" AS error;
  LEAVE proc_label;

ELSE
  SELECT * FROM mysql.user WHERE User LIKE CONCAT('%', q_username , '%') ORDER BY User,Host;
END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `HELP` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `HELP`()
    COMMENT 'Show the help menu for dbatools schema. mysql> call HELP()'
proc_label:BEGIN

SELECT ROUTINE_NAME, ROUTINE_COMMENT
  FROM INFORMATION_SCHEMA.ROUTINES
  WHERE ROUTINE_SCHEMA = 'dbatools'
  ORDER BY ROUTINE_NAME;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `INNODB_BUFFER_POOL_RECOMMEND` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `INNODB_BUFFER_POOL_RECOMMEND`()
    COMMENT 'Calcs recommended innodb_buffer_pool_size. mysql> call INNODB_BUFFER_POOL_RECOMMEND()'
proc_label:BEGIN

SELECT CONCAT(CEILING(RIBPS/POWER(1024,pw)),SUBSTR(' KMGT',pw+1,1))
  recommended_innodb_buffer_pool_size FROM
    (
      SELECT RIBPS,FLOOR(LOG(RIBPS)/LOG(1024)) pw
      FROM
        (
          SELECT SUM(data_length+index_length)*1.1*growth RIBPS
          FROM information_schema.tables AAA,
          (SELECT 1.25 growth) BBB
            WHERE ENGINE='InnoDB'
          ) AA
        ) A;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `REPORT_CONNECTION_SUMMARY` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `REPORT_CONNECTION_SUMMARY`()
    COMMENT 'Improved version of "show processlist". mysql> call REPORT_CONNECTION_SUMMARY()'
proc_label:BEGIN

SELECT user AS username, SUBSTRING_INDEX(host, ':', 1) AS hostname, COUNT(id) AS connections
  FROM information_schema.processlist
  GROUP BY CONCAT(user,'@',(SUBSTRING_INDEX(host, ':', 1)))
  ORDER BY connections DESC;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `REPORT_ENGINE_STATS` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `REPORT_ENGINE_STATS`()
    COMMENT 'Generates engine usage repoprt (MyISAM, INNODB, MEMORY). mysql> call REPORT_ENGINE_STATS()'
proc_label:BEGIN

SELECT
-- TOTALS
ROUND(((data_size + index_size) / gb),4) AS total_size_gb,
ROUND((index_size / gb),4) AS index_size_gb,
ROUND((data_size / gb),4) AS data_size_gb,
ROUND((index_size / (data_size + index_size)),2) * 100 AS perc_index,
ROUND((data_size / (data_size + index_size)),2) * 100 AS perc_data,
--
-- InnoDB ENGINE REPORTING
ROUND((SUM(innodb_index_size + innodb_data_size) / gb),4) AS innodb_total_size_gb,
ROUND((innodb_data_size / gb),4) AS innodb_data_size_gb,
ROUND((innodb_index_size / gb),4) AS innodb_index_size_gb,
ROUND(innodb_index_size / (innodb_data_size + innodb_index_size),2) * 100 AS innodb_perc_index,
ROUND(innodb_data_size / (innodb_data_size + innodb_index_size),2) * 100 AS innodb_perc_data,
ROUND(innodb_index_size / index_size,2) * 100 AS innodb_perc_total_index,
ROUND(innodb_data_size / data_size,2) * 100 AS innodb_perc_total_data,
--
-- MyISAM ENGINE REPORTING
ROUND((SUM(myisam_index_size + myisam_data_size) / gb),4) AS myisam_total_size_gb,
ROUND((myisam_data_size / gb),4) AS myisam_data_size_gb,
ROUND((myisam_index_size / gb),4) AS myisam_index_size_gb,
ROUND(myisam_index_size / (myisam_data_size + myisam_index_size),2) * 100 AS myisam_perc_index,
ROUND(myisam_data_size / (myisam_data_size + myisam_index_size),2) * 100 AS myisam_perc_data,
ROUND(myisam_index_size / index_size,2) * 100 AS myisam_perc_total_index,
ROUND(myisam_data_size / data_size,2) * 100 AS myisam_perc_total_data,
--
-- MEMORY ENGINE REPORTING
ROUND((SUM(memory_index_size + memory_data_size) / gb),4) AS memory_total_size_gb,
ROUND((memory_data_size / gb),4) AS memory_data_size_gb,
ROUND((memory_index_size / gb),4) AS memory_index_size_gb,
ROUND(memory_index_size / (memory_data_size + memory_index_size),2) * 100 AS memory_perc_index,
ROUND(memory_data_size / (memory_data_size + memory_index_size),2) * 100 AS memory_perc_data,
ROUND(memory_index_size / index_size,2) * 100 AS memory_perc_total_index,
ROUND(memory_data_size / data_size,2) * 100 AS memory_perc_total_data
--
-- Generate summaries from which to analyze
FROM (
  SELECT
  SUM(data_length) data_size,
  SUM(index_length) index_size,
  SUM(if(engine = 'innodb', data_length, 0)) AS innodb_data_size,
  SUM(if(engine = 'innodb', index_length, 0)) AS innodb_index_size,
  SUM(if(engine = 'myisam', data_length, 0)) AS myisam_data_size,
  SUM(if(engine = 'myisam', index_length, 0)) AS myisam_index_size,
  SUM(if(engine = 'memory', data_length, 0)) AS memory_data_size,
  SUM(if(engine = 'memory', index_length, 0)) AS memory_index_size,
  POW(1024, 3) gb
  FROM information_schema.tables
  WHERE table_type = 'BASE TABLE') a;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `REPORT_SLOW_QUERIES` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `REPORT_SLOW_QUERIES`()
    COMMENT 'Lists top 50 long running queries. mysql> call REPORT_SLOW_QUERIES()'
proc_label:BEGIN

SELECT id,state,command,time,left(replace(info,'\n','<lf>'),120) as Query
FROM information_schema.processlist
WHERE command <> 'Sleep'
AND info NOT LIKE '%PROCESSLIST%'
ORDER BY time DESC LIMIT 50;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `REPORT_TABLE_SIZES` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `REPORT_TABLE_SIZES`()
    COMMENT 'Lists all tables on the server. Ordered by schema, total_size. mysql> call REPORT_TABLE_SIZES()'
proc_label:BEGIN
SELECT
   table_schema as `schema`,
   table_name AS `table`,
   round((data_length / POW(1024,2)), 2) `data_size_mb`,
   round((index_length / POW(1024,2)), 2) `index_size_mb`,
   round(((data_length + index_length) / POW(1024,2)), 2) `total_size_mb`,
   table_rows AS `rows`
FROM information_schema.TABLES
WHERE table_schema NOT IN ('information_schema','mysql','performance_schema')
ORDER BY table_schema, (data_length + index_length) DESC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ROUTINE_LIST_ALL` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ROUTINE_LIST_ALL`()
    COMMENT 'Lists all ROUTINES on the server. mysql> call ROUTINE_LIST_ALL()'
proc_label:BEGIN
  SELECT ROUTINE_NAME, ROUTINE_SCHEMA, DEFINER FROM INFORMATION_SCHEMA.ROUTINES ORDER BY ROUTINE_SCHEMA, ROUTINE_NAME;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ROUTINE_LIST_SCHEMA` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ROUTINE_LIST_SCHEMA`(
  IN q_schema CHAR(64))
    COMMENT 'Lists all ROUTINES in a schema. mysql> call ROUTINE_LIST_SCHEMA("foo")'
proc_label:BEGIN

IF q_schema IS NULL OR q_schema = '' THEN
  SELECT "ERROR: ARGV1 not set. Specify a schema via 'call ROUTINE_LIST_SCHEMA('foo');'" AS error;
  LEAVE proc_label;

 ELSE
  SELECT ROUTINE_NAME, ROUTINE_SCHEMA, DEFINER FROM INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA = q_schema ORDER BY ROUTINE_SCHEMA, ROUTINE_NAME;
 END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ROUTINE_SEARCH` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ROUTINE_SEARCH`(
  IN q_proc CHAR(64))
    COMMENT 'Searches for a ROUTINE by name. mysql> call ROUTINE_SEARCH("foo")'
proc_label:BEGIN

IF q_proc IS NULL OR q_proc = '' THEN
  SELECT "ERROR: ARGV1 not set. Specify a trigger via 'call ROUTINE_SEARCH('foo');'" AS error;
  LEAVE proc_label;

 ELSE
  SELECT ROUTINE_NAME, ROUTINE_SCHEMA, DEFINER FROM INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_NAME LIKE CONCAT('%', q_proc , '%') ORDER BY ROUTINE_SCHEMA, ROUTINE_NAME;
 END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ROUTINE_SEARCH_DEFINER` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ROUTINE_SEARCH_DEFINER`(
  IN q_definer CHAR(64))
    COMMENT 'Lists all ROUTINES owned by a definer. mysql> call ROUTINE_SEARCH_DEFINER("foo")'
proc_label:BEGIN

IF q_definer IS NULL OR q_definer = '' THEN
  SELECT "ERROR: ARGV1 not set. Specify a definer via 'call ROUTINE_SEARCH_DEFINER('foo');'" AS error;
  LEAVE proc_label;

 ELSE
  SELECT ROUTINE_NAME, ROUTINE_SCHEMA, DEFINER FROM INFORMATION_SCHEMA.ROUTINES WHERE DEFINER LIKE CONCAT('%', q_definer , '%') ORDER BY ROUTINE_SCHEMA, ROUTINE_NAME;
 END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `TRIGGER_LIST_ALL` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `TRIGGER_LIST_ALL`()
    COMMENT 'Lists all triggers on the server. mysql> call TRIGGER_LIST_ALL()'
proc_label:BEGIN
  SELECT TRIGGER_NAME, TRIGGER_SCHEMA, DEFINER FROM INFORMATION_SCHEMA.TRIGGERS ORDER BY TRIGGER_SCHEMA, TRIGGER_NAME;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `TRIGGER_LIST_SCHEMA` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `TRIGGER_LIST_SCHEMA`(
  IN q_schema CHAR(64))
    COMMENT 'Lists all triggers in a schema. mysql> call TRIGGER_LIST_SCHEMA("foo");'
proc_label:BEGIN

IF q_schema IS NULL OR q_schema = '' THEN
  SELECT "ERROR: ARGV1 not set. Specify a schema via 'call TRIGGER_LIST_SCHEMA('foo')'" AS error;
  LEAVE proc_label;

 ELSE
  SELECT TRIGGER_NAME, TRIGGER_SCHEMA, DEFINER FROM INFORMATION_SCHEMA.TRIGGERS WHERE TRIGGER_SCHEMA = q_schema ORDER BY TRIGGER_NAME, TRIGGER_SCHEMA;
 END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `TRIGGER_SEARCH` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `TRIGGER_SEARCH`(
  IN q_trigger CHAR(64))
    COMMENT 'Searches for a trigger by name. mysql> call TRIGGER_SEARCH("foo");'
proc_label:BEGIN

IF q_trigger IS NULL OR q_trigger = '' THEN
  SELECT "ERROR: ARGV1 not set. Specify a trigger via 'call TRIGGER_SEARCH('foo')'" AS error;
  LEAVE proc_label;

 ELSE
  SELECT TRIGGER_NAME, TRIGGER_SCHEMA, DEFINER FROM INFORMATION_SCHEMA.TRIGGERS WHERE TRIGGER_NAME LIKE CONCAT('%', q_trigger , '%') ORDER BY TRIGGER_NAME, TRIGGER_SCHEMA;
 END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `VERSION` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `VERSION`()
    COMMENT 'Show the help menu for dbatools schema. mysql> call VERSION()'
proc_label:BEGIN

SELECT * FROM dbatools.revision
  ORDER BY revision_id DESC LIMIT 1;

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

-- Dump completed on 2016-09-27 13:48:24

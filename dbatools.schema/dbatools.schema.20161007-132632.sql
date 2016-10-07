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
-- Table structure for table `log`
--

DROP TABLE IF EXISTS `log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `log` (
  `a` varchar(50) DEFAULT NULL,
  `b` varchar(50) DEFAULT NULL,
  `c` varchar(50) DEFAULT NULL,
  `d` varchar(50) DEFAULT NULL,
  `e` varchar(50) DEFAULT NULL,
  `f` varchar(50) DEFAULT NULL,
  `g` varchar(50) DEFAULT NULL,
  `h` varchar(50) DEFAULT NULL,
  `i` varchar(50) DEFAULT NULL,
  `j` varchar(50) DEFAULT NULL,
  `k` varchar(50) DEFAULT NULL,
  `l` varchar(50) DEFAULT NULL,
  `m` varchar(50) DEFAULT NULL,
  `n` varchar(50) DEFAULT NULL,
  `o` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log`
--

LOCK TABLES `log` WRITE;
/*!40000 ALTER TABLE `log` DISABLE KEYS */;
/*!40000 ALTER TABLE `log` ENABLE KEYS */;
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
  PRIMARY KEY (`revision_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `revision`
--

LOCK TABLES `revision` WRITE;
/*!40000 ALTER TABLE `revision` DISABLE KEYS */;
INSERT INTO `revision` VALUES (1,'0.0.5','0a44a7a','2016-08-31 18:08:09'),(2,'0.0.6','f6a38ea','2016-09-01 23:45:09'),(3,'0.0.7','4dbe296','2016-09-12 23:10:00'),(4,'0.0.8','efae195','2016-09-26 23:00:00'),(5,'0.0.9','8014e02','2016-09-27 21:00:00'),(6,'0.1.0','bae02eb','2016-10-03 18:15:00'),(7,'0.1.1','fd2ed71','2016-10-07 18:02:00');
/*!40000 ALTER TABLE `revision` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stats_table_deltas`
--

DROP TABLE IF EXISTS `stats_table_deltas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stats_table_deltas` (
  `STATS_TABLE_DELTAS_ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `SERVER_HOSTNAME` varchar(64) NOT NULL DEFAULT '',
  `TABLE_SCHEMA` varchar(64) NOT NULL DEFAULT '',
  `TABLE_NAME` varchar(64) NOT NULL DEFAULT '',
  `ROWS_DELTA` bigint(21) DEFAULT NULL,
  `DATA_DELTA` bigint(21) DEFAULT NULL,
  `INDEX_DELTA` bigint(21) DEFAULT NULL,
  `STATS_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Timestamp of data collection.',
  PRIMARY KEY (`STATS_TABLE_DELTAS_ID`),
  UNIQUE KEY `ux_stats_date_table_schema_table_name` (`STATS_DATE`,`TABLE_SCHEMA`,`TABLE_NAME`),
  KEY `ix_table_schema_table_name` (`TABLE_SCHEMA`,`TABLE_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stats_table_deltas`
--

LOCK TABLES `stats_table_deltas` WRITE;
/*!40000 ALTER TABLE `stats_table_deltas` DISABLE KEYS */;
/*!40000 ALTER TABLE `stats_table_deltas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stats_table_sizes`
--

DROP TABLE IF EXISTS `stats_table_sizes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stats_table_sizes` (
  `STATS_TABLE_SIZES_ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `SERVER_HOSTNAME` varchar(64) NOT NULL DEFAULT '',
  `TABLE_SCHEMA` varchar(64) NOT NULL DEFAULT '',
  `TABLE_NAME` varchar(64) NOT NULL DEFAULT '',
  `ENGINE` varchar(64) DEFAULT NULL,
  `TABLE_ROWS` bigint(21) unsigned DEFAULT NULL,
  `DATA_LENGTH` bigint(21) unsigned DEFAULT NULL,
  `INDEX_LENGTH` bigint(21) unsigned DEFAULT NULL,
  `DATA_FREE` bigint(21) unsigned DEFAULT NULL,
  `AUTO_INCREMENT` bigint(21) unsigned DEFAULT NULL,
  `STATS_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Timestamp of data collection.',
  PRIMARY KEY (`STATS_TABLE_SIZES_ID`),
  UNIQUE KEY `ux_stats_date_table_schema_table_name` (`STATS_DATE`,`TABLE_SCHEMA`,`TABLE_NAME`),
  KEY `ix_table_schema_table_name` (`TABLE_SCHEMA`,`TABLE_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stats_table_sizes`
--

LOCK TABLES `stats_table_sizes` WRITE;
/*!40000 ALTER TABLE `stats_table_sizes` DISABLE KEYS */;
/*!40000 ALTER TABLE `stats_table_sizes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'dbatools'
--
/*!50106 SET @save_time_zone= @@TIME_ZONE */ ;
/*!50106 DROP EVENT IF EXISTS `ev_hourly_analyze_table_deltas` */;
DELIMITER ;;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;;
/*!50003 SET character_set_client  = utf8 */ ;;
/*!50003 SET character_set_results = utf8 */ ;;
/*!50003 SET collation_connection  = utf8_general_ci */ ;;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;;
/*!50003 SET @saved_time_zone      = @@time_zone */ ;;
/*!50003 SET time_zone             = 'SYSTEM' */ ;;
/*!50106 CREATE*/ /*!50117 DEFINER=`root`@`localhost`*/ /*!50106 EVENT `ev_hourly_analyze_table_deltas` ON SCHEDULE EVERY 1 HOUR STARTS '2016-10-07 13:17:39' ON COMPLETION NOT PRESERVE ENABLE COMMENT 'Executes ANALYZE_TABLE_DELTAS() to populates the stats_table_del' DO CALL ANALYZE_TABLE_DELTAS() */ ;;
/*!50003 SET time_zone             = @saved_time_zone */ ;;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;;
/*!50003 SET character_set_client  = @saved_cs_client */ ;;
/*!50003 SET character_set_results = @saved_cs_results */ ;;
/*!50003 SET collation_connection  = @saved_col_connection */ ;;
/*!50106 DROP EVENT IF EXISTS `ev_hourly_stats_table_sizes` */;;
DELIMITER ;;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;;
/*!50003 SET character_set_client  = utf8 */ ;;
/*!50003 SET character_set_results = utf8 */ ;;
/*!50003 SET collation_connection  = utf8_general_ci */ ;;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;;
/*!50003 SET @saved_time_zone      = @@time_zone */ ;;
/*!50003 SET time_zone             = 'SYSTEM' */ ;;
/*!50106 CREATE*/ /*!50117 DEFINER=`root`@`localhost`*/ /*!50106 EVENT `ev_hourly_stats_table_sizes` ON SCHEDULE EVERY 1 HOUR STARTS '2016-10-07 13:17:39' ON COMPLETION NOT PRESERVE ENABLE COMMENT 'Populates the stats_table_sizes table to track growth.' DO INSERT INTO stats_table_sizes
        SELECT NULL,
            @@hostname,
            TABLE_SCHEMA,
            TABLE_NAME,
            ENGINE,
            TABLE_ROWS,
            DATA_LENGTH,
            INDEX_LENGTH,
            DATA_FREE,
            AUTO_INCREMENT,
            TIMESTAMP(NOW())
            FROM INFORMATION_SCHEMA.TABLES
              WHERE TABLE_TYPE = 'BASE TABLE'
              AND TABLE_SCHEMA NOT IN ('information_schema','performance_schema') */ ;;
/*!50003 SET time_zone             = @saved_time_zone */ ;;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;;
/*!50003 SET character_set_client  = @saved_cs_client */ ;;
/*!50003 SET character_set_results = @saved_cs_results */ ;;
/*!50003 SET collation_connection  = @saved_col_connection */ ;;
DELIMITER ;
/*!50106 SET TIME_ZONE= @save_time_zone */ ;

--
-- Dumping routines for database 'dbatools'
--
/*!50003 DROP PROCEDURE IF EXISTS `ANALYZE_TABLE_DELTAS` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ANALYZE_TABLE_DELTAS`()
    COMMENT 'Generate table growth stats. [inserts into stats_table_deltas] mysql> call ANALYZE_TABLE_DELTAS()'
proc_label:BEGIN

-- VARIABLES... yep.
DECLARE v_SERVER_HOSTNAME VARCHAR(255);
DECLARE v_TABLE_SCHEMA VARCHAR(255);
DECLARE v_TABLE_NAME VARCHAR(255);
DECLARE v_itertable VARCHAR(255);
DECLARE v_finished INTEGER DEFAULT 0;

DECLARE v_later_TABLE_ROWS BIGINT(21) unsigned;
DECLARE v_later_DATA_LENGTH BIGINT(21) unsigned;
DECLARE v_later_INDEX_LENGTH BIGINT(21) unsigned;
DECLARE v_later_STATS_DATE TIMESTAMP;

DECLARE v_former_TABLE_ROWS BIGINT(21) unsigned;
DECLARE v_former_DATA_LENGTH BIGINT(21) unsigned;
DECLARE v_former_INDEX_LENGTH BIGINT(21) unsigned;

DECLARE v_delta_TABLE_ROWS BIGINT(21) signed;
DECLARE v_delta_DATA_LENGTH BIGINT(21) signed;
DECLARE v_delta_INDEX_LENGTH BIGINT(21) signed;

-- CURSOR: populate the list of distinct table names for our loop
DECLARE cur_iterable CURSOR FOR
  SELECT
      DISTINCT(CONCAT(SERVER_HOSTNAME,':',TABLE_SCHEMA,':',TABLE_NAME)) as itertable
  FROM stats_table_sizes
  WHERE SERVER_HOSTNAME = @@hostname
  ORDER BY itertable;

-- HANDLER: ends the loop
DECLARE CONTINUE HANDLER FOR NOT FOUND SET v_finished = 1;

-- START CURSOR
OPEN cur_iterable;
  get_data: LOOP
    -- Populate list of tables to iterate
    FETCH cur_iterable INTO v_itertable;

    -- Nothing left, exit loop.
    IF v_finished = 1 THEN
      LEAVE get_data;
    END IF;

    -- DELTA CALC for DATA_LENGTH
    SELECT
    -- ROWS 0day
    (SELECT ((TABLE_ROWS / 1024) / 1024) AS curr_size FROM stats_table_sizes
    WHERE CONCAT(SERVER_HOSTNAME,':',TABLE_SCHEMA,':',TABLE_NAME) = v_itertable
    AND CURDATE() <= STATS_DATE
    ORDER BY STATS_DATE ASC LIMIT 1)
    AS ROWS_0DAY,
    -- ROWS 1day
    (SELECT ((TABLE_ROWS / 1024) / 1024) AS curr_size FROM stats_table_sizes
    WHERE CONCAT(SERVER_HOSTNAME,':',TABLE_SCHEMA,':',TABLE_NAME) = v_itertable
    AND DATE_SUB(CURDATE(),INTERVAL 1 DAY) <= STATS_DATE
    ORDER BY STATS_DATE ASC LIMIT 1)
    AS ROWS_1DAY,
    -- ROWS difference
    ((SELECT ((TABLE_ROWS / 1024) / 1024) AS curr_size FROM stats_table_sizes
    WHERE CONCAT(SERVER_HOSTNAME,':',TABLE_SCHEMA,':',TABLE_NAME) = v_itertable AND CURDATE() <= STATS_DATE ORDER by STATS_DATE ASC LIMIT 1) -
    (SELECT ((TABLE_ROWS / 1024) / 1024) AS curr_size FROM stats_table_sizes
    WHERE CONCAT(SERVER_HOSTNAME,':',TABLE_SCHEMA,':',TABLE_NAME) = v_itertable AND DATE_SUB(CURDATE(),INTERVAL 1 DAY) <= STATS_DATE ORDER BY STATS_DATE ASC LIMIT 1)) AS ROWS_DELTA,
    -- DATA 0day
    (SELECT ((DATA_LENGTH / 1024) / 1024) AS curr_size FROM stats_table_sizes
    WHERE CONCAT(SERVER_HOSTNAME,':',TABLE_SCHEMA,':',TABLE_NAME) = v_itertable
    AND CURDATE() <= STATS_DATE
    ORDER BY STATS_DATE ASC LIMIT 1)
    AS DATA_0DAY,
    -- DATA 1day
    (SELECT ((DATA_LENGTH / 1024) / 1024) AS curr_size FROM stats_table_sizes
    WHERE CONCAT(SERVER_HOSTNAME,':',TABLE_SCHEMA,':',TABLE_NAME) = v_itertable
    AND DATE_SUB(CURDATE(),INTERVAL 1 DAY) <= STATS_DATE
    ORDER BY STATS_DATE ASC LIMIT 1)
    AS DATA_1DAY,
    -- DATA difference
    ((SELECT ((DATA_LENGTH / 1024) / 1024) AS curr_size FROM stats_table_sizes
    WHERE CONCAT(SERVER_HOSTNAME,':',TABLE_SCHEMA,':',TABLE_NAME) = v_itertable AND CURDATE() <= STATS_DATE ORDER by STATS_DATE ASC LIMIT 1) -
    (SELECT ((DATA_LENGTH / 1024) / 1024) AS curr_size FROM stats_table_sizes
    WHERE CONCAT(SERVER_HOSTNAME,':',TABLE_SCHEMA,':',TABLE_NAME) = v_itertable AND DATE_SUB(CURDATE(),INTERVAL 1 DAY) <= STATS_DATE ORDER BY STATS_DATE ASC LIMIT 1)) AS DATA_DELTA,
    -- INDEX 0day
    (SELECT ((INDEX_LENGTH / 1024) / 1024) AS curr_size FROM stats_table_sizes
    WHERE CONCAT(SERVER_HOSTNAME,':',TABLE_SCHEMA,':',TABLE_NAME) = v_itertable
    AND CURDATE() <= STATS_DATE
    ORDER BY STATS_DATE ASC LIMIT 1)
    AS INDEX_0DAY,
    -- INDEX 1 day
    (SELECT ((INDEX_LENGTH / 1024) / 1024) AS curr_size FROM stats_table_sizes
    WHERE CONCAT(SERVER_HOSTNAME,':',TABLE_SCHEMA,':',TABLE_NAME) = v_itertable
    AND DATE_SUB(CURDATE(),INTERVAL 1 DAY) <= STATS_DATE
    ORDER BY STATS_DATE ASC LIMIT 1)
    AS INDEX_1DAY,
    -- INDEX difference
    ((SELECT ((INDEX_LENGTH / 1024) / 1024) AS curr_size FROM stats_table_sizes
    WHERE CONCAT(SERVER_HOSTNAME,':',TABLE_SCHEMA,':',TABLE_NAME) = v_itertable AND CURDATE() <= STATS_DATE ORDER by STATS_DATE ASC LIMIT 1) -
    (SELECT ((INDEX_LENGTH / 1024) / 1024) AS curr_size FROM stats_table_sizes
    WHERE CONCAT(SERVER_HOSTNAME,':',TABLE_SCHEMA,':',TABLE_NAME) = v_itertable AND DATE_SUB(CURDATE(),INTERVAL 1 DAY) <= STATS_DATE ORDER BY STATS_DATE ASC LIMIT 1)) AS INDEX_DELTA
    -- POPULATE VARIABLES
    INTO
    v_later_TABLE_ROWS, v_former_TABLE_ROWS, v_delta_TABLE_ROWS,
    v_later_DATA_LENGTH, v_former_DATA_LENGTH, v_delta_DATA_LENGTH,
    v_later_INDEX_LENGTH, v_former_INDEX_LENGTH, v_delta_INDEX_LENGTH;

    -- STRING MANIPULATION TO GET VARS FOR INSERT
    SELECT
      SUBSTRING_INDEX(v_itertable, ':', 1) AS SERVER_HOST,
      SUBSTRING_INDEX(SUBSTRING_INDEX(v_itertable, ':', 2),':',-1) AS SCHEMA_NAME,
      SUBSTRING_INDEX(SUBSTRING_INDEX(v_itertable, ':', -2),':',-1) AS TABLE_NAME
    INTO v_SERVER_HOSTNAME, v_TABLE_SCHEMA, v_TABLE_NAME;

    -- LOGGING, OPTIONAL
    INSERT INTO log VALUES ( v_itertable,
      v_SERVER_HOSTNAME, v_TABLE_SCHEMA, v_TABLE_NAME,
      v_later_TABLE_ROWS, v_former_TABLE_ROWS, v_delta_TABLE_ROWS,
      v_later_DATA_LENGTH, v_former_DATA_LENGTH, v_delta_DATA_LENGTH,
      v_later_INDEX_LENGTH, v_former_INDEX_LENGTH, v_delta_INDEX_LENGTH,
      NULL, NULL);

    -- INSERT TO DELTA TABLE
    INSERT INTO stats_table_deltas (STATS_TABLE_DELTAS_ID,
        SERVER_HOSTNAME,
        TABLE_SCHEMA,
        TABLE_NAME,
        ROWS_DELTA,
        DATA_DELTA,
        INDEX_DELTA,
        STATS_DATE)
      VALUES (NULL,
        v_SERVER_HOSTNAME,
        v_TABLE_SCHEMA,
        v_TABLE_NAME,
        v_delta_TABLE_ROWS,
        v_delta_DATA_LENGTH,
        v_delta_INDEX_LENGTH,
        NOW());

  END LOOP get_data;
CLOSE cur_iterable;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
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
/*!50003 DROP PROCEDURE IF EXISTS `REPORT_TABLE_SIZES_ALPHA` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `REPORT_TABLE_SIZES_ALPHA`()
    COMMENT 'Lists all tables on the server. Ordered by schema, table_name. mysql> call REPORT_TABLE_SIZES_ALPHA()'
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
ORDER BY table_schema, table_name ASC;
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

-- Dump completed on 2016-10-07 13:26:32

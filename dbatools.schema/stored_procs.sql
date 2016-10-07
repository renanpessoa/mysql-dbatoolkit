DROP DATABASE IF EXISTS dbatools;
CREATE DATABASE `dbatools` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci */;
USE dbatools;

-- EVENTS: this must be enabled for functionality of reports
SET GLOBAL event_scheduler = ON;

-- Create the revision table --
DROP TABLE IF EXISTS dbatools.revision;
CREATE TABLE `dbatools`.`revision` (
  `revision_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `revision_num` CHAR(8) NOT NULL,
  `github_commit_hash` VARCHAR(255) NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Timestamp of initial creation.',
  PRIMARY KEY (revision_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
-- END

-- INSERT REVISION HISTORY INTO revision TABLE --------------------------------------------------------------#
INSERT INTO `dbatools`.`revision` VALUES(NULL,'0.0.5','0a44a7a','2016-08-31 11:08:09');
INSERT INTO `dbatools`.`revision` VALUES(NULL,'0.0.6','f6a38ea','2016-09-01 16:45:09');
INSERT INTO `dbatools`.`revision` VALUES(NULL,'0.0.7','4dbe296','2016-09-12 16:10:00');
INSERT INTO `dbatools`.`revision` VALUES(NULL,'0.0.8','efae195','2016-09-26 16:00:00');
INSERT INTO `dbatools`.`revision` VALUES(NULL,'0.0.9','8014e02','2016-09-27 14:00:00');
INSERT INTO `dbatools`.`revision` VALUES(NULL,'0.1.0','bae02eb','2016-10-03 11:15:00');
INSERT INTO `dbatools`.`revision` VALUES(NULL,'0.1.1','','2016-10-07 11:02:00');
-- END ------------------------------------------------------------------------------------------------------#

-- LOG TABLE
DROP TABLE IF EXISTS `log`;
CREATE TABLE `log` (
  `a` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `b` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `c` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `d` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `e` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `f` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `g` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `h` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `i` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `j` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `k` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `l` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `m` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `n` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `o` varchar(50) CHARACTER SET utf8 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Create InnoDB Lock Monitoring table --
--  Note: This logs a lot of extra lock information in the SHOW ENGINE INNODB STATUS output --
-- DROP TABLE IF EXISTS dbatools.innodb_lock_monitor;
-- CREATE TABLE `dbatools`.`innodb_lock_monitor` (
-- `innodb_lock_monitor_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
-- PRIMARY KEY (innodb_lock_monitor_id)
-- ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
-- END

-- Create deltas table for tracking table size/row changes over time.
--  Note: this table receives inserts from PROC ANALYZE_TABLE_DELTAS()
--  Note: to utilize this, ensure the event scheduler item is enabled.
--  Note: we don't issue a drop table first, so that deltas are not wiped out during a dbatools schema version upgrade. --
-- DROP TABLE IF EXISTS `stats_table_deltas`;
CREATE TABLE `stats_table_deltas` (
  `STATS_TABLE_DELTAS_ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `SERVER_HOSTNAME` varchar(64) NOT NULL DEFAULT '',
  `TABLE_SCHEMA` varchar(64) NOT NULL DEFAULT '',
  `TABLE_NAME` varchar(64) NOT NULL DEFAULT '',
  `ROWS_DELTA` bigint(21) signed DEFAULT NULL,
  `DATA_DELTA` bigint(21) signed DEFAULT NULL,
  `INDEX_DELTA` bigint(21) signed DEFAULT NULL,
  `STATS_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Timestamp of data collection.',
  PRIMARY KEY (`STATS_TABLE_DELTAS_ID`),
  UNIQUE KEY `ux_stats_date_table_schema_table_name` (`STATS_DATE`,`TABLE_SCHEMA`,`TABLE_NAME`),
  KEY `ix_table_schema_table_name` (`TABLE_SCHEMA`,`TABLE_NAME`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8;

-- Create Stats table for collecting trend data --
--  Note: this will require the query below run as an event or cron job to populate data on schedule. --
--  Note: we don't issue a drop table first, so that stats are not wiped out during a dbatools schema version upgrade. --
-- DROP TABLE IF EXISTS `stats_table_deltas`;
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
PRIMARY KEY (STATS_TABLE_SIZES_ID),
UNIQUE KEY `ux_stats_date_table_schema_table_name` (STATS_DATE,TABLE_SCHEMA,TABLE_NAME),
INDEX `ix_table_schema_table_name` (TABLE_SCHEMA,TABLE_NAME)
) ENGINE=INNODB DEFAULT CHARSET=utf8;

-- EVENT to generate hourly collection of stats_table_sizes
DROP EVENT IF EXISTS `dbatools`.`ev_hourly_stats_table_sizes`;
CREATE EVENT IF NOT EXISTS `dbatools`.`ev_hourly_stats_table_sizes`
    ON SCHEDULE
      EVERY 1 HOUR
    COMMENT 'Populates the stats_table_sizes table to track growth.'
    DO
      INSERT INTO stats_table_sizes
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
              AND TABLE_SCHEMA NOT IN ('information_schema','performance_schema');
-- END

-- EVENT to generate daily computation of table growth delta stats
DROP EVENT IF EXISTS `dbatools`.`ev_hourly_analyze_table_deltas`;
CREATE EVENT IF NOT EXISTS `dbatools`.`ev_hourly_analyze_table_deltas`
    ON SCHEDULE
      EVERY 1 HOUR
    COMMENT 'Executes ANALYZE_TABLE_DELTAS() to populates the stats_table_deltas table.'
    DO
      CALL ANALYZE_TABLE_DELTAS();
-- END

-- PROCEDURE TO SHOW HELP FOR OUR PROCEDURES --
DROP PROCEDURE IF EXISTS `dbatools`.`HELP`;
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `HELP`()
  COMMENT 'Show the help menu for dbatools schema. mysql> call HELP()'
proc_label:BEGIN

SELECT ROUTINE_NAME, ROUTINE_COMMENT
  FROM INFORMATION_SCHEMA.ROUTINES
  WHERE ROUTINE_SCHEMA = 'dbatools'
  ORDER BY ROUTINE_NAME;

END$$
DELIMITER ;
-- END

-- PROCEDURE TO SHOW VERSION FOR OUR PROCEDURES --
DROP PROCEDURE IF EXISTS `dbatools`.`VERSION`;
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `VERSION`()
  COMMENT 'Show the help menu for dbatools schema. mysql> call VERSION()'
proc_label:BEGIN

SELECT * FROM dbatools.revision
  ORDER BY revision_id DESC LIMIT 1;

END$$
DELIMITER ;
-- END

-- PROCEDURE TO LIST ALL TRIGGERS ON THE SERVER --
DROP PROCEDURE IF EXISTS `dbatools`.`TRIGGER_LIST_ALL`;
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `TRIGGER_LIST_ALL`()
  COMMENT 'Lists all triggers on the server. mysql> call TRIGGER_LIST_ALL()'
proc_label:BEGIN
  SELECT TRIGGER_NAME, TRIGGER_SCHEMA, DEFINER FROM INFORMATION_SCHEMA.TRIGGERS ORDER BY TRIGGER_SCHEMA, TRIGGER_NAME;
END$$
DELIMITER ;
-- END

-- PROCEDURE TO LIST ALL TRIGGERS IN A SCHEMA --
DROP PROCEDURE IF EXISTS `dbatools`.`TRIGGER_LIST_SCHEMA`;
DELIMITER $$
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

END$$
DELIMITER ;
-- END

-- PROCEDURE TO SEARCH ONE TRIGGER BY NAME --
DROP PROCEDURE IF EXISTS `dbatools`.`TRIGGER_SEARCH`;
DELIMITER $$
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

END$$
DELIMITER ;
-- END

-- PROCEDURE TO LIST ALL PROCEDURE ON THE SERVER --
DROP PROCEDURE IF EXISTS `dbatools`.`ROUTINE_LIST_ALL`;
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `ROUTINE_LIST_ALL`()
  COMMENT 'Lists all ROUTINES on the server. mysql> call ROUTINE_LIST_ALL()'
proc_label:BEGIN
  SELECT ROUTINE_NAME, ROUTINE_SCHEMA, DEFINER FROM INFORMATION_SCHEMA.ROUTINES ORDER BY ROUTINE_SCHEMA, ROUTINE_NAME;
END$$
DELIMITER ;
-- END

-- PROCEDURE TO LIST ALL PROCEDURES IN A SCHEMA --
DROP PROCEDURE IF EXISTS `dbatools`.`ROUTINE_LIST_SCHEMA`;
DELIMITER $$
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

END$$
DELIMITER ;
-- END

-- PROCEDURE TO LIST ALL PROCEDURES OWNED BY A USER
DROP PROCEDURE IF EXISTS `dbatools`.`ROUTINE_SEARCH_DEFINER`;
DELIMITER $$
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

END$$
DELIMITER ;
-- END

-- PROCEDURE TO SEARCH ONE TRIGGER BY NAME --
DROP PROCEDURE IF EXISTS `dbatools`.`ROUTINE_SEARCH`;
DELIMITER $$
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

END$$
DELIMITER ;
-- END

-- PROCEDURE TO REPORT ON ENGINE USAGE --
DROP PROCEDURE IF EXISTS `dbatools`.`REPORT_ENGINE_STATS`;
DELIMITER $$
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

END$$
DELIMITER ;
-- END

-- PROCEDURE TO SEARCH PRIVS FOR A USER
DROP PROCEDURE IF EXISTS `dbatools`.`AUTH_USER_SEARCH`;
DELIMITER $$
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

END$$
DELIMITER ;
-- END

-- PROCEDURE TO UPDATE A USER PASSWORD
DROP PROCEDURE IF EXISTS `dbatools`.`AUTH_USER_PASS_UPDATE`;
DELIMITER $$
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

END$$
DELIMITER ;
-- END

-- PROCEDURE TO REPORT TABLE SIZES. ORDERED BY SCHEMA, TOTAL SIZE, DESCENDING --
DROP PROCEDURE IF EXISTS `dbatools`.`REPORT_TABLE_SIZES`;
DELIMITER $$
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
END$$
DELIMITER ;
-- END

-- PROCEDURE TO REPORT TABLE SIZES. ORDERED BY SCHEMA, TABLE_NAME, DESCENDING --
DROP PROCEDURE IF EXISTS `dbatools`.`REPORT_TABLE_SIZES_ALPHA`;
DELIMITER $$
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
END$$
DELIMITER ;
-- END

-- PROCEDURE TO REPORT SLOW QUERIES --
DROP PROCEDURE IF EXISTS `dbatools`.`REPORT_SLOW_QUERIES`;
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `REPORT_SLOW_QUERIES`()
  COMMENT 'Lists top 50 long running queries. mysql> call REPORT_SLOW_QUERIES()'
proc_label:BEGIN

SELECT id,state,command,time,left(replace(info,'\n','<lf>'),120) as Query
FROM information_schema.processlist
WHERE command <> 'Sleep'
AND info NOT LIKE '%PROCESSLIST%'
ORDER BY time DESC LIMIT 50;

END$$
DELIMITER ;
-- END

-- PROCEDURE TO REPORT CONNECTION SUMMARIES, LIKE PROCESS LIST BUT BETTER --
DROP PROCEDURE IF EXISTS `dbatools`.`REPORT_CONNECTION_SUMMARY`;
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `REPORT_CONNECTION_SUMMARY`()
  COMMENT 'Improved version of "show processlist". mysql> call REPORT_CONNECTION_SUMMARY()'
proc_label:BEGIN

SELECT user AS username, SUBSTRING_INDEX(host, ':', 1) AS hostname, COUNT(id) AS connections
  FROM information_schema.processlist
  GROUP BY CONCAT(user,'@',(SUBSTRING_INDEX(host, ':', 1)))
  ORDER BY connections DESC;

END$$
DELIMITER ;
-- END

-- PROCEDURE TO REPORT INNODB BUFFER POOL RECOMMENDED SIZE BASED ON GROWTH --
DROP PROCEDURE IF EXISTS `dbatools`.`INNODB_BUFFER_POOL_RECOMMEND`;
DELIMITER $$
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

END$$
DELIMITER ;
-- END

-- PROCEDURE TO GENERATE TABLE STATISTICS FOR ROWS, DATA, INDEX GROWTH
DROP PROCEDURE IF EXISTS `ANALYZE_TABLE_DELTAS`;
DELIMITER $$
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

END$$
DELIMITER ;
-- END

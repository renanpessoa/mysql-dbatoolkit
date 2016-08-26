-- PROCEDURE TO LIST ALL TRIGGERS ON THE SERVER --
DROP PROCEDURE IF EXISTS `dbatools`.`TRIGGER_LIST_ALL`;
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `TRIGGER_LIST_ALL`()
  COMMENT 'Lists all triggers on the server.'
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
  COMMENT 'Lists all triggers in a schema.'
proc_label:BEGIN

IF q_schema IS NULL OR q_schema = '' THEN
  SELECT "ERROR: ARGV1 not set. Specify a schema via 'call TRIGGER_LIST_SCHEMA('foo');'" AS error;
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
  COMMENT 'Searches for a trigger by name.'
proc_label:BEGIN

IF q_trigger IS NULL OR q_trigger = '' THEN
  SELECT "ERROR: ARGV1 not set. Specify a trigger via 'call TRIGGER_SEARCH('foo');'" AS error;
  LEAVE proc_label;

 ELSE
  SELECT TRIGGER_NAME, TRIGGER_SCHEMA, DEFINER FROM INFORMATION_SCHEMA.TRIGGERS WHERE TRIGGER_NAME LIKE CONCAT('%', q_trigger , '%') ORDER BY TRIGGER_NAME, TRIGGER_SCHEMA;
 END IF;

END$$
DELIMITER ;
-- END

-- PROCEDURE TO LIST ALL PROCEDURE ON THE SERVER --
DROP PROCEDURE IF EXISTS `dbatools`.`PROC_LIST_ALL`;
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `PROC_LIST_ALL`()
  COMMENT 'Lists all PROCEDURES on the server.'
proc_label:BEGIN
  SELECT ROUTINE_NAME, ROUTINE_SCHEMA, DEFINER FROM INFORMATION_SCHEMA.ROUTINES ORDER BY ROUTINE_SCHEMA, ROUTINE_NAME;
END$$
DELIMITER ;
-- END

-- PROCEDURE TO LIST ALL TRIGGERS IN A SCHEMA --
DROP PROCEDURE IF EXISTS `dbatools`.`PROC_LIST_SCHEMA`;
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `PROC_LIST_SCHEMA`(
  IN q_schema CHAR(64))
  COMMENT 'Lists all PROCEDURES in a schema.'
proc_label:BEGIN

IF q_schema IS NULL OR q_schema = '' THEN
  SELECT "ERROR: ARGV1 not set. Specify a schema via 'call PROC_LIST_SCHEMA('foo');'" AS error;
  LEAVE proc_label;

 ELSE
  SELECT ROUTINE_NAME, ROUTINE_SCHEMA, DEFINER FROM INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA = q_schema ORDER BY ROUTINE_SCHEMA, ROUTINE_NAME;
 END IF;

END$$
DELIMITER ;
-- END

-- PROCEDURE TO SEARCH ONE TRIGGER BY NAME --
DROP PROCEDURE IF EXISTS `dbatools`.`PROC_SEARCH`;
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `PROC_SEARCH`(
  IN q_proc CHAR(64))
  COMMENT 'Searches for a PROCEDURE by name.'
proc_label:BEGIN

IF q_proc IS NULL OR q_proc = '' THEN
  SELECT "ERROR: ARGV1 not set. Specify a trigger via 'call PROC_SEARCH('foo');'" AS error;
  LEAVE proc_label;

 ELSE
  SELECT ROUTINE_NAME, ROUTINE_SCHEMA, DEFINER FROM INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_NAME LIKE CONCAT('%', q_proc , '%') ORDER BY ROUTINE_SCHEMA, ROUTINE_NAME;
 END IF;

END$$
DELIMITER ;
-- END

-- PROCEDURE TO REPORT ON ENGINE USAGE --
DROP PROCEDURE IF EXISTS `dbatools`.`ENGINE_REPORT`;
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `ENGINE_REPORT`()
  COMMENT 'Generates a report for table engine usage (MyISAM, INNODB, MEMORY).'
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
  COMMENT 'Lists permissions for a given username.'
proc_label:BEGIN

IF q_username IS NULL OR q_username = '' THEN
  SELECT "ERROR: ARGV1 not set. Specify a username via mysql> call AUTH_USER_SEARCH('foo');" AS error;
  LEAVE proc_label;

ELSE
  SELECT "SQL HERE SQL HERE SQL HERE" AS ToDo;
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
  COMMENT 'Update password for a user ARGV1, with specified password as ARGV2.'
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

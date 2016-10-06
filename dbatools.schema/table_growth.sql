DROP PROCEDURE IF EXISTS `REPORT_TABLE_GROWTH`;
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `REPORT_TABLE_GROWTH`()
  COMMENT 'Generate table growth report. mysql> call REPORT_TABLE_GROWTH()'

proc_label:BEGIN

-- Variables for our stats
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

-- Variables for cursor and loop control
-- DECLARE no_more_rows BOOLEAN;
-- DECLARE loop_cntr INT DEFAULT 0;
-- DECLARE num_rows INT DEFAULT 0;

-- Cursor to get the list of distinct table names for our loop
declare cur_iterable cursor for
  SELECT
      DISTINCT(CONCAT(SERVER_HOSTNAME,':',TABLE_SCHEMA,'.',TABLE_NAME)) as itertable
  FROM stats_table_sizes
  WHERE SERVER_HOSTNAME = @@hostname
  ORDER BY itertable;

-- Handler to end the loop
DECLARE CONTINUE HANDLER FOR NOT FOUND SET v_finished = 1;

-- Start cursoring
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

    -- INDEX
    (SELECT ((TABLE_ROWS / 1024) / 1024) AS curr_size FROM stats_table_sizes
    WHERE CONCAT(SERVER_HOSTNAME,':',TABLE_SCHEMA,'.',TABLE_NAME) = v_itertable
    AND CURDATE() <= STATS_DATE
    ORDER BY STATS_DATE ASC LIMIT 1)
    AS ROWS_0DAY,

    (SELECT ((TABLE_ROWS / 1024) / 1024) AS curr_size FROM stats_table_sizes
    WHERE CONCAT(SERVER_HOSTNAME,':',TABLE_SCHEMA,'.',TABLE_NAME) = v_itertable
    AND DATE_SUB(CURDATE(),INTERVAL 1 DAY) <= STATS_DATE
    ORDER BY STATS_DATE ASC LIMIT 1)
    AS ROWS_1DAY,

    ((SELECT ((TABLE_ROWS / 1024) / 1024) AS curr_size FROM stats_table_sizes
    WHERE CONCAT(SERVER_HOSTNAME,':',TABLE_SCHEMA,'.',TABLE_NAME) = v_itertable AND CURDATE() <= STATS_DATE ORDER by STATS_DATE ASC LIMIT 1) -
    (SELECT ((TABLE_ROWS / 1024) / 1024) AS curr_size FROM stats_table_sizes
    WHERE CONCAT(SERVER_HOSTNAME,':',TABLE_SCHEMA,'.',TABLE_NAME) = v_itertable AND DATE_SUB(CURDATE(),INTERVAL 1 DAY) <= STATS_DATE ORDER BY STATS_DATE ASC LIMIT 1)) AS ROWS_DELTA,

    -- DATA
    (SELECT ((DATA_LENGTH / 1024) / 1024) AS curr_size FROM stats_table_sizes
    WHERE CONCAT(SERVER_HOSTNAME,':',TABLE_SCHEMA,'.',TABLE_NAME) = v_itertable
    AND CURDATE() <= STATS_DATE
    ORDER BY STATS_DATE ASC LIMIT 1)
    AS DATA_0DAY,

    (SELECT ((DATA_LENGTH / 1024) / 1024) AS curr_size FROM stats_table_sizes
    WHERE CONCAT(SERVER_HOSTNAME,':',TABLE_SCHEMA,'.',TABLE_NAME) = v_itertable
    AND DATE_SUB(CURDATE(),INTERVAL 1 DAY) <= STATS_DATE
    ORDER BY STATS_DATE ASC LIMIT 1)
    AS DATA_1DAY,

    ((SELECT ((DATA_LENGTH / 1024) / 1024) AS curr_size FROM stats_table_sizes
    WHERE CONCAT(SERVER_HOSTNAME,':',TABLE_SCHEMA,'.',TABLE_NAME) = v_itertable AND CURDATE() <= STATS_DATE ORDER by STATS_DATE ASC LIMIT 1) -
    (SELECT ((DATA_LENGTH / 1024) / 1024) AS curr_size FROM stats_table_sizes
    WHERE CONCAT(SERVER_HOSTNAME,':',TABLE_SCHEMA,'.',TABLE_NAME) = v_itertable AND DATE_SUB(CURDATE(),INTERVAL 1 DAY) <= STATS_DATE ORDER BY STATS_DATE ASC LIMIT 1)) AS DATA_DELTA,

    -- INDEX
    (SELECT ((INDEX_LENGTH / 1024) / 1024) AS curr_size FROM stats_table_sizes
    WHERE CONCAT(SERVER_HOSTNAME,':',TABLE_SCHEMA,'.',TABLE_NAME) = v_itertable
    AND CURDATE() <= STATS_DATE
    ORDER BY STATS_DATE ASC LIMIT 1)
    AS INDEX_0DAY,

    (SELECT ((INDEX_LENGTH / 1024) / 1024) AS curr_size FROM stats_table_sizes
    WHERE CONCAT(SERVER_HOSTNAME,':',TABLE_SCHEMA,'.',TABLE_NAME) = v_itertable
    AND DATE_SUB(CURDATE(),INTERVAL 1 DAY) <= STATS_DATE
    ORDER BY STATS_DATE ASC LIMIT 1)
    AS INDEX_1DAY,

    ((SELECT ((INDEX_LENGTH / 1024) / 1024) AS curr_size FROM stats_table_sizes
    WHERE CONCAT(SERVER_HOSTNAME,':',TABLE_SCHEMA,'.',TABLE_NAME) = v_itertable AND CURDATE() <= STATS_DATE ORDER by STATS_DATE ASC LIMIT 1) -
    (SELECT ((INDEX_LENGTH / 1024) / 1024) AS curr_size FROM stats_table_sizes
    WHERE CONCAT(SERVER_HOSTNAME,':',TABLE_SCHEMA,'.',TABLE_NAME) = v_itertable AND DATE_SUB(CURDATE(),INTERVAL 1 DAY) <= STATS_DATE ORDER BY STATS_DATE ASC LIMIT 1)) AS INDEX_DELTA

    INTO
    v_later_TABLE_ROWS, v_former_TABLE_ROWS, v_delta_TABLE_ROWS,
    v_later_DATA_LENGTH, v_former_DATA_LENGTH, v_delta_DATA_LENGTH,
    v_later_INDEX_LENGTH, v_former_INDEX_LENGTH, v_delta_INDEX_LENGTH;

    -- INSERT INTO log (a,b,c,d,e) VALUES (v_table, NULL, NULL, NULL, NULL);
    INSERT INTO log VALUES ( v_itertable,
      v_later_TABLE_ROWS, v_former_TABLE_ROWS, v_delta_TABLE_ROWS,
      v_later_DATA_LENGTH, v_former_DATA_LENGTH, v_delta_DATA_LENGTH,
      v_later_INDEX_LENGTH, v_former_INDEX_LENGTH, v_delta_INDEX_LENGTH,
      NULL, NULL, NULL,
      NULL, NULL);

  END LOOP get_data;
CLOSE cur_iterable;

END$$
DELIMITER ;

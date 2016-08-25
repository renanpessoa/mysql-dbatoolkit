
## Total potential
per_thread_buffers = ((read_buffer_size + read_rnd_buffer_size + sort_buffer_size + thread_stack + join_buffer_size + binlog_cache_size) * max_connections)
global_buffers = (innodb_buffer_pool_size + innodb_additional_mem_pool_size + innodb_log_buffer_size + key_buffer_size + query_cache_size)

## Historical max used
per_thread_max_buffers = ((read_buffer_size + read_rnd_buffer_size + sort_buffer_size + thread_stack + join_buffer_size + binlog_cache_size) * Max_used_connections)

## Max used, total possible
max_memory = (global_buffers + per_thread_max_buffers)
total_memory = (global_buffers + per_thread_buffers)

## max allocatable
mem_perthread_maxalloc = (read_buffer_size + read_rnd_buffer_size + sort_buffer_size + thread_stack + join_buffer_size + binlog_cache_size) * max_connections
mem_global_maxalloc = innodb_buffer_pool_size + innodb_additional_mem_pool_size + innodb_log_buffer_size + key_buffer_size + query_cache_size

## engine data
SELECT
ROUND(((data_size + index_size) / gb),4) AS total_size_gb,
ROUND((index_size / gb),4) AS index_size_gb,
ROUND((data_size / gb),4) AS data_size_gb,
ROUND((SUM(innodb_index_size + innodb_data_size) / gb),4) AS innodb_total_size_gb,
ROUND((innodb_data_size / gb),4) AS innodb_data_size_gb,
ROUND((innodb_index_size / gb),4) AS innodb_index_size_gb ,
ROUND((SUM(myisam_index_size + myisam_data_size) / gb),4) AS myisam_total_size_gb,
ROUND((myisam_data_size / gb),4) AS myisam_data_size_gb,
ROUND((myisam_index_size / gb),4) AS myisam_index_size_gb,
ROUND((index_size / (data_size + index_size)),2) * 100 AS perc_index,
ROUND((data_size / (data_size + index_size)),2) * 100 AS perc_data,
ROUND(innodb_index_size / (innodb_data_size + innodb_index_size),2) * 100 AS innodb_perc_index,
ROUND(innodb_data_size / (innodb_data_size + innodb_index_size),2) * 100 AS innodb_perc_data,
ROUND(myisam_index_size / (myisam_data_size + myisam_index_size),2) * 100 AS myisam_perc_index,
ROUND(myisam_data_size / (myisam_data_size + myisam_index_size),2) * 100 AS myisam_perc_data,
ROUND(innodb_index_size / index_size,2) * 100 AS innodb_perc_total_index,
ROUND(innodb_data_size / data_size,2) * 100 AS innodb_perc_total_data,
ROUND(myisam_index_size / index_size,2) * 100 AS myisam_perc_total_index,
ROUND(myisam_data_size / data_size,2) * 100 AS myisam_perc_total_data
FROM (
  SELECT
  SUM(data_length) data_size,
  SUM(index_length) index_size,
  SUM(if(engine = 'innodb', data_length, 0)) AS innodb_data_size,
  SUM(if(engine = 'innodb', index_length, 0)) AS innodb_index_size,
  SUM(if(engine = 'myisam', data_length, 0)) AS myisam_data_size,
  SUM(if(engine = 'myisam', index_length, 0)) AS myisam_index_size,
  POW(1024, 3) gb
  FROM information_schema.tables
  WHERE table_type = 'BASE TABLE') a

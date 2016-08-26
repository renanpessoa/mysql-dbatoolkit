
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

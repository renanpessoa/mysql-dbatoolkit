# Madeline's MySQL DBA Toolkit
Tools, scripts, and standardized configuration files for MySQL. Things I've written to enable me to be lazier, or more productive... not sure which. 

## Installation
mysql> create database dbatools;
linux/osx/bsd> mysql dbatools < dbatools.schema/stored_procs.sql
mysql> use dbatools;
mysql> show procedure status;
mysql> "call some of the procedures... most are self explanatory by name"

## Standardized my.cnf files for mysqld
- These are ordered by RAM sizes. 

## Scripts directory
- Various files that have different purposes. 

## Current procedure list

| AUTH_USER_PASS_UPDATE        | Update password for a user.
| AUTH_USER_SEARCH             | Lists permissions for a given username.
| HELP                         | Show the help menu for dbatools schema.
| INNODB_BUFFER_POOL_RECOMMEND | Calcs recommended innodb_buffer_pool_size.
| REPORT_CONNECTION_SUMMARY    | Improved version of "show processlist".
| REPORT_ENGINE_STATS          | Generates engine usage repoprt (MyISAM, INNODB, MEMORY).
| REPORT_SLOW_QUERIES          | Lists top 50 long running queries.
| REPORT_TABLE_SIZES           | Lists all tables on the server. Ordered by schema, total_size.
| ROUTINE_LIST_ALL             | Lists all ROUTINES on the server.
| ROUTINE_LIST_SCHEMA          | Lists all ROUTINES in a schema.
| ROUTINE_SEARCH               | Searches for a ROUTINE by name.
| ROUTINE_SEARCH_DEFINER       | Lists all ROUTINES owned by a definer.
| TRIGGER_LIST_ALL             | Lists all triggers on the server.
| TRIGGER_LIST_SCHEMA          | Lists all triggers in a schema.
| TRIGGER_SEARCH               | Searches for a trigger by name.

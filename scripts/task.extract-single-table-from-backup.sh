sed -n -e '/DROP TABLE.*'mytable'/,/UNLOCK TABLES/p’ backup.sql > mytable.sql

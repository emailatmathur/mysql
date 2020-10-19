How to purge MySQL logs files. 
------------------------------------------------
The MySQL binary logs contains all the database changes details such as DDL or DML or events for statements. The logs also have duration for each SQL statements.
So if you have urgent issue with diskspace and would like to clean up some free space. You can use the PURGE BINARY LOGS command on mysql. 
"Make sure to have replicas in sync before purging the binlogs on master."

Based on purging criteria, The purge logfile will delete all the logs listed in the log index files prior to name or date. it also removes the entries from index log files.

mysql > PURGE BINARY LOGS BEFORE '2020-10-19 14:00:00';

To avoid such issue, make sure to set the proper retention parameters in my.cnf files to auto expire the binlogs and restart the mysql service.

expire-logs-days = <number of days>
expire-logs-days = 28

or you can also set the parameter if you have no downtime available immediately,Set the parameter as and later of edit the my.cnf when you have downtime.

mysql > SET GLOBAL expire_logs_days = 28;

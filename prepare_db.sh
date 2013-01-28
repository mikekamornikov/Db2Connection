#!/bin/sh

export PATH=/opt/ibm/db2/V9.7/bin:/opt/ibm/db2/V9.7/adm:$PATH

. /home/db2inst1/sqllib/db2profile

# create sugarult db
export DB2DBDFT=sugarult # set sugarult as the default branch
db2 "FORCE APPLICATION ALL"
db2stop
db2start
db2 "FORCE APPLICATION ALL"
db2 "DROP DATABASE SUGARULT"
db2 "CREATE DATABASE SUGARULT USING CODESET UTF-8 TERRITORY US COLLATE USING UCA500R1_LEN_S2 PAGESIZE 32 K"
db2 "CONNECT TO SUGARULT"
db2 "UPDATE database configuration for SUGARULT using applheapsz 32768 app_ctl_heap_sz 8192"
db2 "UPDATE database configuration for SUGARULT using stmtheap 60000"
db2 "UPDATE database configuration for SUGARULT using locklist 50000"
db2 "UPDATE database configuration for SUGARULT using indexrec RESTART"
db2 "UPDATE database configuration for SUGARULT using logfilsiz 1000"
db2 "UPDATE database configuration for SUGARULT using logprimary 12"
db2 "UPDATE database configuration for SUGARULT using logsecond 10"
db2 "UPDATE database configuration for SUGARULT using DATABASE_MEMORY AUTOMATIC"
db2set DB2_COMPATIBILITY_VECTOR=4008
db2 "CREATE BUFFERPOOL SUGARBP IMMEDIATE  SIZE 1000 AUTOMATIC PAGESIZE 32 K"
db2 "CREATE  LARGE  TABLESPACE SUGARTS PAGESIZE 32 K  MANAGED BY AUTOMATIC STORAGE EXTENTSIZE 32 OVERHEAD 10.5 PREFETCHSIZE 32 TRANSFERRATE 0.14 BUFFERPOOL SUGARBP"
db2 "FORCE APPLICATION ALL"
db2stop
db2start
db2 "CONNECT TO SUGARULT"
db2ts "DISABLE DATABASE FOR TEXT CONNECT TO SUGARULT"
db2ts "ENABLE DATABASE FOR TEXT AUTOGRANT CONNECT TO SUGARULT"
db2ts "START FOR TEXT"

exit 0


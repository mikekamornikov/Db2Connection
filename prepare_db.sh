#!/bin/sh

# create sugarult db
export DB2DBDFT=sugarult # set sugarult as the default branch
db2 "FORCE APPLICATION ALL" # flush all connections
db2stop # stop DB2
db2start # start DB2
db2 "FORCE APPLICATION ALL" # flush all connections
db2 "DROP DATABASE SUGARULT" # drop the previously existing database if it exists
db2 "CREATE DATABASE SUGARULT USING CODESET UTF-8 TERRITORY US COLLATE USING UCA500R1_LEN_S2 PAGESIZE 32 K" # create the database from scratch and enable case-insensitive collation
db2 "CONNECT TO SUGARULT" # make a connection to update the parameters below
db2 "UPDATE database configuration for SUGARULT using applheapsz 32768 app_ctl_heap_sz 8192"
db2 "UPDATE database configuration for SUGARULT using stmtheap 60000"
db2 "UPDATE database configuration for SUGARULT using locklist 50000"
db2 "UPDATE database configuration for SUGARULT using indexrec RESTART"
db2 "UPDATE database configuration for SUGARULT using logfilsiz 1000"
db2 "UPDATE database configuration for SUGARULT using logprimary 12"
db2 "UPDATE database configuration for SUGARULT using logsecond 10"
db2 "UPDATE database configuration for SUGARULT using DATABASE_MEMORY AUTOMATIC" #Prevent memory exceeding
db2set DB2_COMPATIBILITY_VECTOR=4008
db2 "CREATE BUFFERPOOL SUGARBP IMMEDIATE  SIZE 1000 AUTOMATIC PAGESIZE 32 K"
db2 "CREATE  LARGE  TABLESPACE SUGARTS PAGESIZE 32 K  MANAGED BY AUTOMATIC STORAGE EXTENTSIZE 32 OVERHEAD 10.5 PREFETCHSIZE 32 TRANSFERRATE 0.14 BUFFERPOOL SUGARBP"
db2 "FORCE APPLICATION ALL" # close all conections to restart DB2 below
db2stop
db2start
db2 "CONNECT TO SUGARULT"
db2ts DISABLE DATABASE FOR TEXT CONNECT TO SUGARULT
db2ts ENABLE DATABASE FOR TEXT AUTOGRANT CONNECT TO SUGARULT
db2ts START FOR TEXT

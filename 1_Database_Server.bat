@echo off
SET NAME=SingleCore Database
TITLE %NAME%
set mainfolder=%CD%
set fulldb_name=TDB_full_world_335.19111_2019_11_16.sql

:check
cls
if not exist "%mainfolder%\Database\connection.cnf" goto extract_db
goto check_2

:check_2
if not exist "%mainfolder%\%fulldb_name%" goto extract_fulldb
goto launch_db

:launch_db
"%mainfolder%\Database\bin\mysqld" --defaults-file="%mainfolder%\Database\SPP-Database.ini" --console --standalone --explicit_defaults_for_timestamp --sql-mode=""
exit

:extract_db
"%mainfolder%\Tools\7za.exe" x "%mainfolder%\Tools\Database.7z"
goto check

:extract_fulldb
"%mainfolder%\Tools\7za.exe" x "%mainfolder%\Tools\FullDB.7z"
goto check
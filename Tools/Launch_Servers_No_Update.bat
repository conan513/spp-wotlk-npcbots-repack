@echo off
SET NAME=SingleCore Server Launcher
TITLE %NAME%
set mainfolder=%CD%

:start_server
cd "%mainfolder%\SPP_Classics_Collection"
Launcher.bat
exit
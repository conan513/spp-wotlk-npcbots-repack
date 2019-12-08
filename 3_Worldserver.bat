@echo off
set mainfolder=%CD%

cd "%mainfolder%\Servers"
start "" "worldserver.exe"
exit
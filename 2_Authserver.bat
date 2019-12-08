@echo off
set mainfolder=%CD%

cd "%mainfolder%\Servers"
start "" "authserver.exe"
exit
@echo off
SET NAME=SingleCore_TC Updater
TITLE %NAME%
set mainfolder=%CD%

taskkill /f /im bnetserver.exe
taskkill /f /im worldserver.exe
taskkill /f /im spp-httpd.exe
taskkill /f /im node.exe

:repack
set name=Single Player Project - Classics Collection
set installpath=SPP_Classics_Collection
set branch=master
goto start_restore

:start_restore
cls
if not exist "%mainfolder%\%installpath%\launcher.bat" goto not_installed_error
cd "%mainfolder%\%installpath%"
..\git\cmd\git.exe reset --hard
echo.
pause
exit

:not_installed_error
cls
echo Looks like %name% repack is not installed.
echo Please use the "Update.bat" to install it first.
echo.
pause
goto menu
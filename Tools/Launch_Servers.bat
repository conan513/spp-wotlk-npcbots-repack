@echo off
SET NAME=SingleCore Server Launcher
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
goto install

:install
if exist "%mainfolder%\launcher.bat" goto update_process
cls
echo Downloading the base files for the repack...
echo.
"%mainfolder%\git\cmd\git.exe" clone --depth=1 https://github.com/conan513/SPP-Classics_Collection.git %installpath% --branch=%branch%
goto update_process

:update_process
cls
echo.
echo Create local git config file...
echo.
cd "%mainfolder%\%installpath%"
..\git\cmd\git.exe config user.name "SPP User"
..\git\cmd\git.exe config user.email sppuser@spp.com
echo.
echo Add realm settings to git system...
echo.
..\git\cmd\git.exe add Settings
..\git\cmd\git.exe commit -m "Custom Changes"
cls
echo.
echo Downloading the latest %name% update...
echo.
..\git\cmd\git.exe pull https://github.com/conan513/SPP-Classics_Collection.git %branch%
echo.
echo Update done!
echo Please run Update_fix_if_error.bat if you see merge error above.
echo.
ping -n 5 127.0.0.1>nul
cd "%mainfolder%"
copy "%mainfolder%\%installpath%\Server\Tools\Update_fix_if_error.bat" . /Y
copy "%mainfolder%\%installpath%\Server\Tools\Launch_Servers.bat" . /Y
copy "%mainfolder%\%installpath%\Server\Tools\Launch_Servers_No_Update.bat" . /Y
echo.
goto start_server

:start_server
cd "%mainfolder%\SPP_Classics_Collection"
Launcher.bat
exit
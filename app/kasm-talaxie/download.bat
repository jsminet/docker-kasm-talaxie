@echo off
setlocal EnableDelayedExpansion
chcp 65001 >nul
title Downloading Talaxie

set "NAME1=Talaxie Data Integration (DI)"
set "URL1=https://deilink.fr/deilink/TOS_DI-20261020_1824-V8.9.0SNAPSHOT-linux.gtk.x86_64.tar.gz"
set "FILE1=TOS_DI-20261020_1824-V8.9.0SNAPSHOT-linux.gtk.x86_64.tar.gz"

set "NAME2=Talaxie Enterprise Service bus (ESB)"
set "URL2=https://deilink.fr/deilink/TOS_ESB-20261020_1824-V8.9.0SNAPSHOT-linux.gtk.x86_64.tar.gz"
set "FILE2=TOS_ESB-20261020_1824-V8.9.0SNAPSHOT-linux.gtk.x86_64.tar.gz"

set "NAME3=Talaxie Big Data (BD)"
set "URL3=https://deilink.fr/deilink/TOS_BD-20261020_1824-V8.9.0SNAPSHOT-linux.gtk.x86_64.tar.gz"
set "FILE3=TOS_BD-20261020_1824-V8.9.0SNAPSHOT-linux.gtk.x86_64.tar.gz"

rem Destination folder (default: current)
set "DEST=%~dp0"
rem ============================================================

where curl >nul 2>&1
if errorlevel 1 (
    echo [ERROR] curl not found, should be in Windows >= 10
    pause
    exit /b 1
)

cls
echo ==============================================
echo   Talaxie download
echo ==============================================
echo.
echo   1 - !NAME1!
echo   2 - !NAME2!
echo   3 - !NAME3!
echo.

choice /c 123 /n /m "Talaxie version selector (1-3): "
set "SEL=%errorlevel%"

set "NAME=!NAME%SEL%!"
set "URL=!URL%SEL%!"
set "FILE=!FILE%SEL%!"

echo.
echo Downloading : !NAME!
echo Source      : !URL!
echo Destination : !DEST!!FILE!
echo.

curl -L -f --retry 3 --progress-bar -o "!DEST!!FILE!" "!URL!"

if errorlevel 1 (
    echo.
    echo [ERROR] Downloading failed, check the URL
    if exist "!DEST!!FILE!" del "!DEST!!FILE!"
    pause
    exit /b 1
)

echo.
echo [OK] Downloaded file: !DEST!!FILE!
pause
endlocal
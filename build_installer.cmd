@echo off
title Build JustSoft Installer

echo ============================================
echo Creation de l'installateur JustSoft
echo ============================================

if not exist "dist\JustSoft.exe" (
    echo ERREUR: dist\JustSoft.exe introuvable.
    echo Compile d'abord JustSoft avec build.cmd.
    pause
    exit /b
)

set INNO1="C:\Program Files (x86)\Inno Setup 6\ISCC.exe"
set INNO2="C:\Program Files\Inno Setup 6\ISCC.exe"

if exist %INNO1% (
    %INNO1% "JustSoft_Installer.iss"
    goto done
)

if exist %INNO2% (
    %INNO2% "JustSoft_Installer.iss"
    goto done
)

echo ERREUR: Inno Setup n'est pas installe.
echo Telecharge Inno Setup ici :
echo https://jrsoftware.org/isdl.php
pause
exit /b

:done
echo.
echo Termine.
echo Ton installateur est ici :
echo installer_output\JustSoft_Setup.exe
pause

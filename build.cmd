@echo off
:: ============================================================
::  JUSTSOFT - Build propre avec les dependances du Dosoft original
::  Communication Internet retiree : pas de requests ici
:: ============================================================
setlocal enabledelayedexpansion

set APP_NAME=JustSoft
set MAIN_FILE=main.py
set ICON_FILE=logo.ico
set OUT_DIR=dist

echo.
echo  ============================
echo   Compilation PyInstaller - JUSTSOFT
echo  ============================
echo.

echo [*] Installation des dependances du projet original...
py -m pip install --upgrade -r requirements.txt
if %ERRORLEVEL% NEQ 0 (
    echo.
    echo [ERREUR] Installation des dependances echouee.
    pause
    exit /b 1
)

if exist "%OUT_DIR%" (
    echo [*] Nettoyage du dossier dist...
    rmdir /s /q "%OUT_DIR%"
)
if exist "build" (
    echo [*] Nettoyage du dossier build...
    rmdir /s /q "build"
)
if exist "%APP_NAME%.spec" (
    del "%APP_NAME%.spec"
)

echo [*] Lancement de PyInstaller...
py -m PyInstaller ^
    --onefile ^
    --noconsole ^
    --icon="%ICON_FILE%" ^
    --name="%APP_NAME%" ^
    --distpath="%OUT_DIR%" ^
    --add-data="skin;skin" ^
    --add-data="sounds;sounds" ^
    --add-data="resources\\i18n;resources\\i18n" ^
    --add-data="resources\\keyboards;resources\\keyboards" ^
    --add-data="logo.ico;." ^
    --add-data="logo.png;." ^
    --hidden-import=customtkinter ^
    --hidden-import=PIL ^
    --hidden-import=PIL.Image ^
    --hidden-import=PIL.ImageTk ^
    --hidden-import=pystray ^
    --hidden-import=pygame ^
    --hidden-import=win32api ^
    --hidden-import=win32con ^
    --hidden-import=win32gui ^
    --hidden-import=win32process ^
    --hidden-import=win32timezone ^
    --hidden-import=keyboard ^
    --collect-all=customtkinter ^
    "%MAIN_FILE%"

if %ERRORLEVEL% NEQ 0 (
    echo.
    echo [ERREUR] La compilation a echoue. Verifiez les logs ci-dessus.
    pause
    exit /b 1
)

echo.
echo [OK] Compilation reussie !
echo [OK] Executable : %OUT_DIR%\%APP_NAME%.exe
echo [REMARQUE ICONES WINDOWS] Si l'ancien logo reste visible sur le bureau, supprime l'ancien raccourci puis recrée-le avec le nouvel installateur.
echo.
pause

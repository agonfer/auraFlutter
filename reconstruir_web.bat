@echo off
echo ===================================================
echo Reconstruyendo Aura para la Web
echo ===================================================

echo Paso 1: Verificando si Flutter esta instalado...
if not exist "C:\flutter\bin\flutter.bat" (
    echo ERROR: No se encontro Flutter en C:\flutter\bin\flutter.bat
    echo Asegurate de haber instalado Flutter correctamente
    pause
    exit /b 1
)

echo Paso 2: Limpiando la build anterior...
C:\flutter\bin\flutter clean

echo Paso 3: Reconstruyendo la aplicacion para web...
C:\flutter\bin\flutter build web --web-renderer canvaskit

echo ===================================================
echo Reconstruccion completada! Ahora ejecuta:
echo .\ejecutar_web_local.bat
echo ===================================================
pause 
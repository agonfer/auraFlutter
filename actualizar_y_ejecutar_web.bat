@echo off
echo ===================================================
echo Actualizando archivos web de Aura
echo ===================================================

echo Paso 1: Verificando si existe la carpeta build/web...
if not exist "build\web" (
    echo ERROR: No se encuentra la carpeta build/web
    echo Primero debe construir la aplicacion web
    pause
    exit /b 1
)

echo Paso 2: Copiando los archivos JavaScript modificados...
echo // Actualizacion forzada - %DATE% %TIME% > build\web\temp.js
type build\web\main.dart.js >> build\web\temp.js
del build\web\main.dart.js
rename build\web\temp.js main.dart.js

echo Paso 3: Iniciando servidor web local...
echo Iniciando servidor web en http://localhost:8000
echo Presiona Ctrl+C para detener el servidor

cd build\web
start http://localhost:8000
python -m http.server 8000

echo ===================================================
pause 
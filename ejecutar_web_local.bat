@echo off
echo ===================================================
echo Ejecutando Aura en un servidor web local
echo ===================================================
echo.

echo Paso 1: Verificando si existe una carpeta build/web...
if exist "build\web\" (
    echo La carpeta build/web existe. Continuando...
) else (
    echo La carpeta build/web no existe.
    echo.
    echo Necesitas compilar la aplicación para web primero.
    echo Si tienes Flutter instalado, puedes ejecutar:
    echo flutter build web
    echo.
    echo Alternativamente, puedes crear la carpeta build/web manualmente
    echo y colocar los archivos web compilados allí.
    echo.
    echo Creando carpetas build/web para continuar...
    mkdir "build\web" 2>nul
    
    echo.
    echo Copiando archivos web básicos...
    mkdir "build\web\icons" 2>nul
    copy "web\index.html" "build\web\" 2>nul
    copy "web\manifest.json" "build\web\" 2>nul
    copy "web\favicon.png" "build\web\" 2>nul
    copy "web\icons\*.*" "build\web\icons\" 2>nul
    
    echo.
    echo ADVERTENCIA: Estos son solo archivos básicos.
    echo La aplicación no funcionará completamente sin los archivos compilados.
    echo.
)

echo.
echo Paso 2: Iniciando servidor web local con Python...
echo.
echo Iniciando servidor web local en http://localhost:8000
echo.
echo Presiona Ctrl+C para detener el servidor
echo.

cd build\web
start http://localhost:8000
python -m http.server 8000 
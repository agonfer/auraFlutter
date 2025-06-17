@echo off
echo ==============================================
echo    DIAGNOSTICO COMPLETO DEL ASISTENTE
echo ==============================================
echo.

echo 1. Verificando Python...
python --version 2>NUL
if %errorlevel% neq 0 (
    echo [ADVERTENCIA] Python no instalado
) else (
    echo [OK] Python detectado
)

echo.
echo 2. Abriendo páginas de prueba...
echo.

REM Abrir todas las páginas de prueba
echo Abriendo test_orbe_minimo.html - PRUEBA ESTA PRIMERO
start http://localhost:8000/test_orbe_minimo.html
timeout /t 2 /nobreak > nul

start http://localhost:8000/prueba_rapida.html
timeout /t 2 /nobreak > nul

start http://localhost:8000/test_voz_simple.html
timeout /t 2 /nobreak > nul

start http://localhost:8000/test_asistente.html
timeout /t 2 /nobreak > nul

start http://localhost:8000/index.html

echo.
echo 3. Iniciando servidor...
echo.
echo IMPORTANTE:
echo - EMPIEZA CON test_orbe_minimo.html (la más simple)
echo - Mira el panel de estado en la página
echo - Verifica que el navegador te pida permisos de micrófono
echo - Revisa la consola del navegador (F12) para más detalles
echo.
echo En cada página:
echo 1. Permite acceso al micrófono cuando se solicite
echo 2. Haz clic en el orbe azul
echo 3. Di "hola" cuando veas "Escuchando..."
echo 4. Revisa el panel de estado para ver qué está pasando
echo.
echo Si test_orbe_minimo.html funciona pero index.html no,
echo hay un problema con el código principal.
echo.

cd /d "%~dp0"
python -m http.server 8000 
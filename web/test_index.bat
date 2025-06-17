@echo off
echo ====================================
echo   PROBANDO INDEX.HTML
echo ====================================
echo.

cd /d "%~dp0"
echo Abriendo index.html...
start http://localhost:8000/index.html

echo.
echo Iniciando servidor en http://localhost:8000
echo.
echo INSTRUCCIONES:
echo 1. Abre la consola del navegador (F12)
echo 2. Haz clic en el orbe azul
echo 3. Di "hola" cuando veas "Escuchando..."
echo 4. Mira los mensajes en la consola
echo.
echo Si no funciona, prueba con:
echo - test_voz_simple.html (que si funciona)
echo - diagnostico_voz.html
echo.

python -m http.server 8000 
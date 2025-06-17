@echo off
echo ==============================================
echo    INICIANDO ASISTENTE DE VOZ PARA CIEGOS
echo ==============================================
echo.

REM Verificar si Node.js está instalado
node --version > nul 2>&1
if %errorlevel% neq 0 (
    echo [ERROR] Node.js no está instalado. Por favor, instala Node.js
    pause
    exit /b 1
)

echo [OK] Node.js detectado
echo.

REM Instalar http-server si no está instalado
echo Verificando http-server...
call npx http-server --version > nul 2>&1
if %errorlevel% neq 0 (
    echo Instalando http-server...
    call npm install -g http-server
)

echo.
echo Iniciando servidor web en http://localhost:8080
echo.
echo IMPORTANTE: 
echo - Permite el acceso a la cámara y micrófono cuando el navegador lo solicite
echo - Usa Chrome o Edge para mejor compatibilidad
echo - Presiona Ctrl+C para detener el servidor
echo.
echo Abriendo navegador...
timeout /t 2 /nobreak > nul

REM Abrir el navegador automáticamente
start http://localhost:8080

REM Iniciar servidor
cd /d "%~dp0"
call npx http-server -p 8080 --cors 
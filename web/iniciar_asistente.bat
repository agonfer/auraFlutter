@echo off
echo ==============================================
echo    INICIANDO ASISTENTE DE VOZ PARA CIEGOS
echo ==============================================
echo.

REM Verificar si Python está instalado
python --version > nul 2>&1
if %errorlevel% neq 0 (
    echo [ERROR] Python no está instalado. Por favor, instala Python 3.x
    pause
    exit /b 1
)

echo [OK] Python detectado
echo.

REM Crear servidor HTTP simple
echo Iniciando servidor web en http://localhost:8000
echo.
echo IMPORTANTE: 
echo - Permite el acceso a la cámara y micrófono cuando el navegador lo solicite
echo - Usa Chrome o Edge para mejor compatibilidad
echo - Presiona Ctrl+C para detener el servidor
echo.
echo Abriendo navegador...
timeout /t 2 /nobreak > nul

REM Abrir el navegador automáticamente
start http://localhost:8000

REM Iniciar servidor Python
cd /d "%~dp0"
python -m http.server 8000 
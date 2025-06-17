@echo off
echo ===================================================
echo Instalador y ejecutor de Aura para Android
echo ===================================================
echo.

echo Paso 1: Creando directorio para Flutter...
if not exist C:\flutter (
    mkdir C:\flutter
    echo Directorio creado: C:\flutter
) else (
    echo El directorio C:\flutter ya existe
)

echo.
echo Paso 2: Descargando Flutter SDK...
echo Este proceso puede tardar varios minutos dependiendo de tu conexión a Internet.
echo.
echo Por favor, sigue estos pasos manualmente:
echo 1. Abre tu navegador y ve a: https://flutter.dev/docs/get-started/install/windows
echo 2. Descarga el último paquete de Flutter SDK (flutter_windows_3.x.x-stable.zip)
echo 3. Extrae el contenido del archivo ZIP en C:\flutter
echo.
echo Presiona cualquier tecla cuando hayas completado estos pasos...
pause > nul

echo.
echo Paso 3: Verificando la instalación de Flutter...
if exist C:\flutter\bin\flutter.bat (
    echo Flutter encontrado en C:\flutter\bin\flutter.bat
) else (
    echo ERROR: No se encontró Flutter en C:\flutter\bin\flutter.bat
    echo Asegúrate de haber extraído correctamente el archivo ZIP en C:\flutter
    echo.
    echo Presiona cualquier tecla para salir...
    pause > nul
    exit /b 1
)

echo.
echo Paso 4: Añadiendo Flutter al PATH temporalmente...
set PATH=%PATH%;C:\flutter\bin

echo.
echo Paso 5: Ejecutando Flutter doctor...
C:\flutter\bin\flutter doctor

echo.
echo Paso 6: Verificando dispositivos Android conectados...
echo Asegúrate de que tu dispositivo Android está conectado por USB
echo y que la depuración USB está habilitada.
echo.
C:\flutter\bin\flutter devices

echo.
echo Paso 7: Ejecutando la aplicación Aura...
echo Este proceso puede tardar varios minutos la primera vez.
echo.
cd /d %~dp0
C:\flutter\bin\flutter run

echo.
echo Si la aplicación no se inició correctamente, verifica que:
echo 1. Tu dispositivo Android está conectado y aparece en la lista de dispositivos
echo 2. La depuración USB está habilitada en tu dispositivo
echo 3. Has aceptado el diálogo de "Permitir depuración USB" en tu dispositivo
echo.
echo Presiona cualquier tecla para salir...
pause > nul 
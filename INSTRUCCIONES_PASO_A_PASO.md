# Instrucciones paso a paso para ejecutar Aura en Android

## 1. Descargar Flutter SDK

1. Abre tu navegador web
2. Ve a la página de descarga de Flutter: https://flutter.dev/docs/get-started/install/windows
3. Haz clic en el botón "flutter_windows_3.x.x-stable.zip" para descargar el SDK de Flutter
4. Espera a que se complete la descarga (el archivo es grande, aproximadamente 1.2 GB)

## 2. Instalar Flutter

1. Crea una carpeta llamada `flutter` en la unidad C:\ de tu ordenador
   - Abre el Explorador de archivos
   - Navega a C:\
   - Haz clic derecho > Nuevo > Carpeta
   - Nombra la carpeta como "flutter"

2. Extrae el archivo ZIP descargado:
   - Encuentra el archivo ZIP descargado (normalmente en la carpeta Descargas)
   - Haz clic derecho sobre él y selecciona "Extraer todo..."
   - En la ventana que aparece, navega hasta C:\
   - Asegúrate de que los archivos se extraerán en la carpeta C:\flutter
   - Haz clic en "Extraer"

3. Verifica la instalación:
   - Abre una nueva ventana de PowerShell
   - Escribe el siguiente comando y presiona Enter:
     ```
     C:\flutter\bin\flutter --version
     ```
   - Deberías ver información sobre la versión de Flutter instalada

## 3. Configurar el dispositivo Android

1. Habilita las opciones de desarrollador en tu dispositivo Android:
   - Ve a "Configuración" > "Acerca del teléfono"
   - Busca "Número de compilación" y tócalo 7 veces seguidas
   - Verás un mensaje indicando que ya eres desarrollador

2. Habilita la depuración USB:
   - Regresa a la pantalla principal de Configuración
   - Busca y selecciona "Opciones de desarrollador"
   - Activa la opción "Depuración USB"

3. Conecta tu dispositivo al ordenador:
   - Usa un cable USB para conectar tu dispositivo Android al ordenador
   - Si aparece un diálogo en el dispositivo preguntando si deseas permitir la depuración USB, selecciona "Permitir"
   - Asegúrate de que el modo de conexión USB está configurado como "Transferencia de archivos" o "MTP"

## 4. Ejecutar la aplicación

1. Verifica que tu dispositivo está conectado:
   - Abre una ventana de PowerShell
   - Navega hasta la carpeta del proyecto:
     ```
     cd C:\Users\irene\Desktop\auraFlutter
     ```
   - Ejecuta:
     ```
     C:\flutter\bin\flutter devices
     ```
   - Deberías ver tu dispositivo Android en la lista

2. Ejecuta la aplicación:
   - Desde la misma ventana de PowerShell, ejecuta:
     ```
     C:\flutter\bin\flutter run
     ```
   - La primera vez que ejecutes este comando, Flutter descargará e instalará varias dependencias
   - Este proceso puede tardar varios minutos
   - Cuando termine, la aplicación Aura se instalará y se ejecutará en tu dispositivo Android

## Solución de problemas comunes

### Si no ves tu dispositivo en la lista de dispositivos:

1. Asegúrate de que la depuración USB está habilitada
2. Desconecta y vuelve a conectar el cable USB
3. Prueba con otro cable USB
4. Reinicia tu dispositivo Android
5. Verifica que has aceptado el diálogo de "Permitir depuración USB" en tu dispositivo

### Si hay errores durante la ejecución:

1. Ejecuta el siguiente comando para ver información detallada sobre el estado de Flutter:
   ```
   C:\flutter\bin\flutter doctor -v
   ```
2. Sigue las recomendaciones que aparecen para resolver cualquier problema

3. Si hay errores específicos con Android, asegúrate de tener instalado Android Studio o al menos el Android SDK:
   - Descarga Android Studio desde: https://developer.android.com/studio
   - Instálalo siguiendo las instrucciones en pantalla
   - Durante la instalación, asegúrate de seleccionar "Android SDK"

### Si la aplicación no se instala correctamente:

1. Limpia el proyecto y vuelve a intentarlo:
   ```
   C:\flutter\bin\flutter clean
   C:\flutter\bin\flutter pub get
   C:\flutter\bin\flutter run
   ```

2. Verifica que tu dispositivo Android tiene suficiente espacio de almacenamiento disponible

## Próximos pasos

Una vez que la aplicación esté ejecutándose en tu dispositivo:

1. Explora la interfaz de usuario
2. Prueba los comandos de voz tocando el orbe central
3. Verifica que la animación del orbe cambie cuando hablas y cuando recibe respuestas
4. Comprueba que la síntesis de voz funcione correctamente 
# Instrucciones para ejecutar Aura en un dispositivo Android

## 1. Instalar Flutter

Antes de poder ejecutar la aplicación, necesitas tener Flutter instalado en tu sistema. Sigue estos pasos:

### Para Windows:

1. **Descargar Flutter SDK**:
   - Ve a [flutter.dev/docs/get-started/install/windows](https://flutter.dev/docs/get-started/install/windows)
   - Descarga el último paquete de Flutter SDK (archivo ZIP)

2. **Extraer el archivo ZIP**:
   - Crea una carpeta donde quieras instalar Flutter (por ejemplo, `C:\flutter`)
   - Extrae el contenido del archivo ZIP en esta carpeta

3. **Añadir Flutter al PATH**:
   - Busca "variables de entorno" en el menú de inicio
   - Haz clic en "Editar las variables de entorno del sistema"
   - Haz clic en "Variables de entorno"
   - En la sección "Variables del sistema", selecciona la variable "Path" y haz clic en "Editar"
   - Haz clic en "Nuevo" y añade la ruta a la carpeta `flutter\bin` (por ejemplo, `C:\flutter\bin`)
   - Haz clic en "Aceptar" para cerrar todas las ventanas

4. **Verificar la instalación**:
   - Cierra y vuelve a abrir la línea de comandos (PowerShell o CMD)
   - Ejecuta:
     ```
     flutter --version
     ```
   - Deberías ver la versión de Flutter instalada

## 2. Configurar el dispositivo Android

1. **Habilitar las opciones de desarrollador en tu dispositivo Android**:
   - Ve a "Configuración" > "Acerca del teléfono"
   - Toca 7 veces sobre "Número de compilación" hasta que aparezca un mensaje indicando que eres desarrollador

2. **Habilitar la depuración USB**:
   - Ve a "Configuración" > "Opciones de desarrollador"
   - Activa la opción "Depuración USB"

3. **Conectar el dispositivo al ordenador**:
   - Usa un cable USB para conectar tu dispositivo Android al ordenador
   - Si aparece un diálogo en el dispositivo preguntando si deseas permitir la depuración USB, selecciona "Permitir"

## 3. Verificar la conexión del dispositivo

1. **Verificar que el dispositivo es reconocido**:
   - Abre una línea de comandos (PowerShell o CMD)
   - Navega hasta la carpeta del proyecto:
     ```
     cd C:\Users\irene\Desktop\auraFlutter
     ```
   - Ejecuta:
     ```
     C:\flutter\bin\flutter devices
     ```
   - Deberías ver tu dispositivo Android en la lista

## 4. Ejecutar la aplicación

1. **Ejecutar la aplicación en el dispositivo**:
   - Desde la carpeta del proyecto, ejecuta:
     ```
     C:\flutter\bin\flutter run
     ```
   - La primera vez puede tardar varios minutos mientras compila la aplicación
   - La aplicación se instalará y se ejecutará automáticamente en tu dispositivo

## Solución de problemas

### Si el dispositivo no aparece en la lista:

1. **Verificar la conexión USB**:
   - Prueba con otro cable USB
   - Asegúrate de que el modo de conexión USB está configurado como "Transferencia de archivos" o "MTP"

2. **Instalar controladores USB**:
   - Puede que necesites instalar los controladores USB específicos para tu dispositivo
   - Visita el sitio web del fabricante de tu dispositivo para descargar los controladores

3. **Verificar que ADB reconoce el dispositivo**:
   - Ejecuta:
     ```
     C:\flutter\bin\cache\dart-sdk\bin\adb devices
     ```
   - Si no ves tu dispositivo, es posible que tengas un problema con los controladores USB

### Si hay errores al ejecutar la aplicación:

1. **Verificar que Flutter está configurado correctamente**:
   - Ejecuta:
     ```
     C:\flutter\bin\flutter doctor
     ```
   - Resuelve cualquier problema que se indique

2. **Limpiar el proyecto**:
   - Ejecuta:
     ```
     C:\flutter\bin\flutter clean
     ```
   - Luego:
     ```
     C:\flutter\bin\flutter pub get
     ```
   - Intenta ejecutar la aplicación nuevamente:
     ```
     C:\flutter\bin\flutter run
     ```

3. **Verificar la configuración de Android**:
   - Asegúrate de que tu dispositivo Android tiene una versión compatible (Android 4.1 o superior)
   - Verifica que tienes suficiente espacio de almacenamiento disponible 
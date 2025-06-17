# Instrucciones para ejecutar Aura en tu dispositivo Android

Hemos creado un script automatizado que te guiará a través del proceso de instalación de Flutter y ejecución de la aplicación Aura en tu dispositivo Android. Sigue estos pasos:

## Preparación

1. **Habilita la depuración USB en tu dispositivo Android**:
   - Ve a "Configuración" > "Acerca del teléfono"
   - Toca 7 veces sobre "Número de compilación" hasta que aparezca un mensaje indicando que eres desarrollador
   - Regresa a la pantalla principal de Configuración
   - Ve a "Opciones de desarrollador" (debería aparecer como una nueva opción)
   - Activa "Depuración USB"

2. **Conecta tu dispositivo Android al ordenador** usando un cable USB.
   - Si aparece un diálogo en tu dispositivo preguntando si deseas permitir la depuración USB, selecciona "Permitir"

## Ejecución del script de instalación

1. **Ejecuta el archivo `instalar_y_ejecutar.bat`**:
   - Haz doble clic en el archivo `instalar_y_ejecutar.bat` que está en la carpeta del proyecto
   - Si aparece una advertencia de seguridad de Windows, haz clic en "Más información" y luego en "Ejecutar de todas formas"

2. **Sigue las instrucciones en pantalla**:
   - El script te guiará a través del proceso de instalación de Flutter
   - Te pedirá que descargues el SDK de Flutter y lo extraigas en la ubicación correcta
   - Verificará que Flutter esté instalado correctamente
   - Comprobará si tu dispositivo Android está conectado
   - Ejecutará la aplicación Aura en tu dispositivo

## Solución de problemas

### Si el script no puede encontrar tu dispositivo Android:

1. **Verifica la conexión USB**:
   - Desconecta y vuelve a conectar el cable USB
   - Prueba con otro cable USB si es posible
   - Asegúrate de que el modo de conexión USB está configurado como "Transferencia de archivos" o "MTP"

2. **Verifica la depuración USB**:
   - Asegúrate de que la opción "Depuración USB" está activada en las opciones de desarrollador
   - Si aparece un diálogo preguntando si deseas permitir la depuración USB, selecciona "Permitir"

3. **Instala los controladores USB**:
   - Es posible que necesites instalar los controladores USB específicos para tu dispositivo
   - Busca en Google "controladores USB [marca y modelo de tu teléfono]" y sigue las instrucciones de instalación

### Si hay errores durante la instalación de Flutter:

1. **Verifica tu conexión a Internet**:
   - Asegúrate de tener una conexión estable a Internet para descargar Flutter

2. **Verifica los permisos de administrador**:
   - Intenta ejecutar el script como administrador (haz clic derecho > Ejecutar como administrador)

3. **Espacio en disco**:
   - Asegúrate de tener al menos 2 GB de espacio libre en tu disco duro

## Ejecución manual (si el script no funciona)

Si el script automatizado no funciona por alguna razón, puedes seguir estos pasos manuales:

1. **Descarga Flutter**:
   - Ve a [flutter.dev/docs/get-started/install/windows](https://flutter.dev/docs/get-started/install/windows)
   - Descarga el último paquete de Flutter SDK

2. **Extrae el archivo ZIP**:
   - Extrae el contenido del archivo ZIP en `C:\flutter`

3. **Abre una ventana de PowerShell o CMD**:
   - Presiona Win+R, escribe `cmd` y presiona Enter

4. **Ejecuta los siguientes comandos**:
   ```
   cd C:\Users\irene\Desktop\auraFlutter
   C:\flutter\bin\flutter doctor
   C:\flutter\bin\flutter devices
   C:\flutter\bin\flutter run
   ```

## Próximos pasos

Una vez que la aplicación esté ejecutándose en tu dispositivo:

1. Explora la interfaz de usuario
2. Prueba los comandos de voz tocando el orbe central
3. Verifica que la animación del orbe cambie cuando hablas y cuando recibe respuestas
4. Comprueba que la síntesis de voz funcione correctamente 
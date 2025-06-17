# Instrucciones para ejecutar Aura en diferentes plataformas

## Requisitos previos

Antes de comenzar, asegúrate de tener instalado:

1. **Flutter SDK**: Versión 3.0.0 o superior
2. **Dart SDK**: Versión 3.0.0 o superior
3. **Git**: Para clonar el repositorio

## Configuración inicial

1. Clona el repositorio (si aún no lo has hecho):
   ```
   git clone https://github.com/tuusuario/aura.git
   cd auraFlutter
   ```

2. Instala las dependencias:
   ```
   flutter pub get
   ```

## Ejecución en diferentes plataformas

### Android

1. Conecta un dispositivo Android o inicia un emulador:
   ```
   flutter emulators --launch <nombre_del_emulador>
   ```
   
2. Verifica que el dispositivo esté conectado:
   ```
   flutter devices
   ```
   
3. Ejecuta la aplicación:
   ```
   C:\flutter\bin\flutter run
   ```

### iOS (requiere macOS)

1. Conecta un dispositivo iOS o inicia un simulador:
   ```
   open -a Simulator
   ```
   
2. Verifica que el dispositivo esté conectado:
   ```
   flutter devices
   ```
   
3. Ejecuta la aplicación:
   ```
   flutter run
   ```

### Web

1. Asegúrate de tener habilitado el soporte web:
   ```
   flutter config --enable-web
   ```
   
2. Ejecuta la aplicación en un navegador:
   ```
   flutter run -d chrome
   ```

### Windows

1. Asegúrate de tener habilitado el soporte para Windows:
   ```
   flutter config --enable-windows-desktop
   ```
   
2. Ejecuta la aplicación:
   ```
   flutter run -d windows
   ```

### macOS (requiere macOS)

1. Asegúrate de tener habilitado el soporte para macOS:
   ```
   flutter config --enable-macos-desktop
   ```
   
2. Ejecuta la aplicación:
   ```
   flutter run -d macos
   ```

### Linux

1. Asegúrate de tener habilitado el soporte para Linux:
   ```
   flutter config --enable-linux-desktop
   ```
   
2. Instala las dependencias necesarias para Flutter en Linux:
   ```
   sudo apt-get update
   sudo apt-get install clang cmake ninja-build pkg-config libgtk-3-dev liblzma-dev
   ```
   
3. Ejecuta la aplicación:
   ```
   flutter run -d linux
   ```

## Solución de problemas comunes

### Error al instalar dependencias

Si encuentras errores al ejecutar `flutter pub get`:

1. Verifica tu conexión a Internet
2. Asegúrate de que Flutter esté actualizado:
   ```
   flutter upgrade
   ```
3. Limpia la caché de Flutter:
   ```
   flutter clean
   flutter pub cache repair
   flutter pub get
   ```

### Permisos denegados

Si la aplicación no puede acceder al micrófono, cámara o galería:

1. Verifica que hayas aceptado los permisos durante la ejecución de la aplicación
2. En Android, ve a Configuración > Aplicaciones > Aura > Permisos
3. En iOS, ve a Configuración > Privacidad > Micrófono/Cámara/Fotos y asegúrate de que Aura tenga acceso

### Problemas de rendimiento

Si la aplicación se ejecuta lentamente:

1. Ejecuta en modo perfil para evaluar el rendimiento:
   ```
   flutter run --profile
   ```
2. Usa Flutter DevTools para identificar cuellos de botella:
   ```
   flutter run --devtools
   ```

## Notas importantes

- La aplicación requiere permisos de micrófono, cámara y galería para funcionar correctamente
- En simuladores/emuladores, algunas funciones como el reconocimiento de voz pueden no funcionar correctamente
- Para un rendimiento óptimo, prueba en un dispositivo físico

## Próximos pasos

Una vez que la aplicación esté ejecutándose:

1. Explora la interfaz de usuario
2. Prueba los comandos de voz tocando el orbe central
3. Verifica que la animación del orbe cambie cuando hablas y cuando recibe respuestas
4. Comprueba que la síntesis de voz funcione correctamente 
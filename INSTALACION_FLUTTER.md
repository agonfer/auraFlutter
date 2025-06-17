# Guía de Instalación de Flutter

Esta guía te ayudará a instalar Flutter en diferentes sistemas operativos para poder ejecutar la aplicación Aura.

## Windows

### Requisitos previos
- Windows 7 SP1 o posterior (64-bit)
- Espacio en disco: 1.64 GB (sin incluir espacio para IDE/herramientas)
- Git para Windows

### Pasos de instalación

1. **Descargar Flutter SDK**:
   - Visita [flutter.dev/docs/get-started/install/windows](https://flutter.dev/docs/get-started/install/windows)
   - Descarga el último paquete de Flutter SDK

2. **Extraer el archivo zip**:
   - Extrae el archivo zip en una carpeta donde desees instalar Flutter (por ejemplo, `C:\src\flutter`)
   - Evita instalar Flutter en una ruta que requiera privilegios elevados (como `C:\Program Files\`)

3. **Actualizar la variable PATH**:
   - Busca "variables de entorno" en el menú de inicio
   - Haz clic en "Editar las variables de entorno del sistema"
   - Haz clic en "Variables de entorno"
   - En "Variables del sistema", selecciona "Path" y haz clic en "Editar"
   - Haz clic en "Nuevo" y añade la ruta a la carpeta `flutter\bin` (por ejemplo, `C:\src\flutter\bin`)
   - Haz clic en "Aceptar" para cerrar todas las ventanas

4. **Verificar la instalación**:
   - Abre una nueva ventana de PowerShell o Símbolo del sistema
   - Ejecuta:
     ```
     flutter --version
     ```

5. **Ejecutar Flutter Doctor**:
   - Ejecuta el siguiente comando para verificar si hay dependencias adicionales que necesites instalar:
     ```
     flutter doctor
     ```
   - Sigue las instrucciones para instalar las dependencias faltantes

## macOS

### Requisitos previos
- macOS (64-bit)
- Espacio en disco: 2.8 GB (sin incluir espacio para IDE/herramientas)
- Xcode (para desarrollo iOS)

### Pasos de instalación

1. **Descargar Flutter SDK**:
   - Visita [flutter.dev/docs/get-started/install/macos](https://flutter.dev/docs/get-started/install/macos)
   - Descarga el último paquete de Flutter SDK

2. **Extraer el archivo zip**:
   - Extrae el archivo en la ubicación deseada (por ejemplo, `~/development`)
     ```
     cd ~/development
     unzip ~/Downloads/flutter_macos_3.x.x-stable.zip
     ```

3. **Actualizar la variable PATH**:
   - Abre o crea el archivo de perfil de tu shell:
     ```
     nano ~/.zshrc  # para Zsh (predeterminado en macOS Catalina y posterior)
     ```
     o
     ```
     nano ~/.bash_profile  # para Bash
     ```
   - Añade la siguiente línea:
     ```
     export PATH="$PATH:~/development/flutter/bin"
     ```
   - Guarda y cierra el archivo
   - Actualiza la ventana actual:
     ```
     source ~/.zshrc  # para Zsh
     ```
     o
     ```
     source ~/.bash_profile  # para Bash
     ```

4. **Verificar la instalación**:
   - Ejecuta:
     ```
     flutter --version
     ```

5. **Ejecutar Flutter Doctor**:
   - Ejecuta:
     ```
     flutter doctor
     ```
   - Sigue las instrucciones para instalar dependencias faltantes
   - Para desarrollo iOS, instala Xcode desde la App Store

## Linux

### Requisitos previos
- Linux (64-bit)
- Espacio en disco: 600 MB (sin incluir espacio para IDE/herramientas)
- Bibliotecas adicionales:
  ```
  sudo apt-get install clang cmake ninja-build pkg-config libgtk-3-dev liblzma-dev
  ```

### Pasos de instalación

1. **Descargar Flutter SDK**:
   - Visita [flutter.dev/docs/get-started/install/linux](https://flutter.dev/docs/get-started/install/linux)
   - Descarga el último paquete de Flutter SDK

2. **Extraer el archivo tar**:
   - Extrae el archivo en la ubicación deseada:
     ```
     cd ~/development
     tar xf ~/Downloads/flutter_linux_3.x.x-stable.tar.xz
     ```

3. **Actualizar la variable PATH**:
   - Abre o crea el archivo de perfil de tu shell:
     ```
     nano ~/.bashrc
     ```
   - Añade la siguiente línea:
     ```
     export PATH="$PATH:~/development/flutter/bin"
     ```
   - Guarda y cierra el archivo
   - Actualiza la ventana actual:
     ```
     source ~/.bashrc
     ```

4. **Verificar la instalación**:
   - Ejecuta:
     ```
     flutter --version
     ```

5. **Ejecutar Flutter Doctor**:
   - Ejecuta:
     ```
     flutter doctor
     ```
   - Sigue las instrucciones para instalar dependencias faltantes

## Configuración para desarrollo Android

### Instalar Android Studio

1. Descarga e instala Android Studio desde [developer.android.com/studio](https://developer.android.com/studio)

2. Inicia Android Studio y sigue el asistente de configuración

3. Instala los plugins de Flutter y Dart:
   - Abre Android Studio
   - Ve a File > Settings > Plugins (en macOS: Android Studio > Preferences > Plugins)
   - Busca "Flutter" e instala el plugin
   - El plugin de Dart se instalará automáticamente con Flutter

4. Configura un emulador Android:
   - En Android Studio, haz clic en "AVD Manager" en la barra de herramientas
   - Haz clic en "Create Virtual Device"
   - Selecciona un dispositivo y haz clic en "Next"
   - Selecciona una imagen de sistema (recomendado: la última versión estable)
   - Finaliza la configuración y haz clic en "Finish"

## Configuración para desarrollo iOS (solo macOS)

1. Instala Xcode desde la App Store

2. Configura el simulador iOS:
   - Abre Xcode
   - Ve a Xcode > Open Developer Tool > Simulator

3. Acepta las licencias:
   ```
   sudo xcodebuild -license
   ```

4. Configura los certificados de desarrollo:
   - Abre Xcode
   - Ve a Xcode > Preferences > Accounts
   - Añade tu Apple ID

## Verificación final

Después de completar todos los pasos, ejecuta:

```
flutter doctor --verbose
```

Esto mostrará un informe detallado de tu configuración y te indicará si hay algún problema pendiente.

## Solución de problemas comunes

### Error "Flutter command not found"
- Verifica que hayas añadido Flutter al PATH correctamente
- Reinicia la terminal o el sistema

### Error al ejecutar el emulador Android
- Asegúrate de tener instalado el Android SDK
- Verifica que la virtualización esté habilitada en la BIOS

### Error al ejecutar el simulador iOS
- Asegúrate de tener la última versión de Xcode
- Ejecuta `sudo xcode-select --switch /Applications/Xcode.app/Contents/Developer`

### Error "Flutter doctor" muestra problemas
- Sigue las recomendaciones específicas que muestra el comando
- Visita [flutter.dev/docs/get-started/install/troubleshoot](https://flutter.dev/docs/get-started/install/troubleshoot) para más información 
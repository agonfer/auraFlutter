# Instrucciones para ejecutar Aura en la Web

Para ejecutar la aplicación Aura en un navegador web, sigue estos pasos:

## 1. Instalar Flutter (si aún no lo has hecho)

Primero, asegúrate de tener Flutter instalado. Si ya seguiste las instrucciones para Android, puedes omitir este paso.

1. Descarga Flutter desde [flutter.dev/docs/get-started/install/windows](https://flutter.dev/docs/get-started/install/windows)
2. Extrae el archivo ZIP en C:\flutter
3. Verifica la instalación ejecutando `C:\flutter\bin\flutter --version`

## 2. Habilitar soporte web en Flutter

1. Abre una ventana de PowerShell o CMD
2. Ejecuta el siguiente comando para habilitar el soporte web:
   ```
   C:\flutter\bin\flutter config --enable-web
   ```

## 3. Verificar que el soporte web está habilitado

1. Ejecuta el siguiente comando para verificar que el soporte web está habilitado:
   ```
   C:\flutter\bin\flutter devices
   ```
2. Deberías ver "Chrome (web)" o "Web server (web)" en la lista de dispositivos disponibles

## 4. Ejecutar la aplicación en modo web

1. Navega a la carpeta del proyecto:
   ```
   cd C:\Users\irene\Desktop\auraFlutter
   ```

2. Ejecuta la aplicación en modo web con Chrome:
   ```
   C:\flutter\bin\flutter run -d chrome
   ```

   O si prefieres otro navegador o no tienes Chrome:
   ```
   C:\flutter\bin\flutter run -d web-server
   ```
   
3. Si usas la opción web-server, Flutter te dará una URL (normalmente http://localhost:8080) que puedes abrir en cualquier navegador

## 5. Consideraciones para la versión web

Al ejecutar la aplicación en la web, ten en cuenta que:

1. **Permisos del navegador**: Es posible que necesites conceder permisos de micrófono en el navegador cuando la aplicación lo solicite
2. **Rendimiento**: La versión web puede tener un rendimiento diferente al de la versión nativa para Android
3. **Compatibilidad**: Algunas características como el reconocimiento de voz pueden comportarse de manera diferente en la web
4. **Primera ejecución**: La primera vez que ejecutes la aplicación en modo web, Flutter compilará todo el proyecto para web, lo que puede tardar varios minutos

## Solución de problemas

### Si no ves la opción web en la lista de dispositivos:

1. Asegúrate de haber habilitado el soporte web:
   ```
   C:\flutter\bin\flutter config --enable-web
   ```

2. Actualiza Flutter a la última versión:
   ```
   C:\flutter\bin\flutter upgrade
   ```

### Si hay errores durante la compilación:

1. Limpia el proyecto y vuelve a intentarlo:
   ```
   C:\flutter\bin\flutter clean
   C:\flutter\bin\flutter pub get
   C:\flutter\bin\flutter run -d chrome
   ```

### Si el reconocimiento de voz no funciona:

1. Verifica que has concedido permisos de micrófono al navegador
2. Ten en cuenta que el reconocimiento de voz en la web puede tener limitaciones dependiendo del navegador

## Próximos pasos

Una vez que la aplicación esté ejecutándose en el navegador:

1. Explora la interfaz de usuario
2. Prueba los comandos de voz (asegúrate de conceder permisos de micrófono)
3. Verifica que la animación del orbe funciona correctamente
4. Comprueba la síntesis de voz (puede requerir interacción del usuario en algunos navegadores) 
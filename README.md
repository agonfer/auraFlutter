# Aura - Asistente por voz para personas con discapacidad visual

Aura es una aplicación de asistente por voz diseñada específicamente para personas con discapacidad visual. La aplicación proporciona una interfaz intuitiva y accesible que permite a los usuarios interactuar mediante comandos de voz.

## Características

- **Interfaz visual atractiva**: Fondo degradado y animaciones suaves similares a Siri de Apple.
- **Reconocimiento de voz**: Permite al usuario dar comandos mediante su voz.
- **Síntesis de voz**: Responde al usuario mediante voz clara y natural.
- **Animación de entrada**: Animación inicial atractiva al abrir la aplicación.
- **Orbe interactivo**: Animación del orbe que reacciona cuando el usuario habla o cuando Aura responde.
- **Multiplatforma**: Disponible para Android, iOS, Web, Windows, macOS y Linux.
- **Permisos integrados**: Solicitud y gestión de permisos de micrófono, cámara y galería.

## Requisitos técnicos

- Flutter 3.0 o superior
- Dart 3.0 o superior
- Dispositivo con micrófono

## Instalación

1. Asegúrate de tener Flutter instalado en tu sistema. Si no lo tienes, sigue las instrucciones en [flutter.dev](https://flutter.dev/docs/get-started/install).

2. Clona este repositorio:
   ```
   git clone https://github.com/tuusuario/aura.git
   ```

3. Navega al directorio del proyecto:
   ```
   cd aura
   ```

4. Instala las dependencias:
   ```
   flutter pub get
   ```

5. Ejecuta la aplicación:
   ```
   flutter run
   ```

## Estructura del proyecto

- `lib/`: Contiene el código fuente de la aplicación
  - `main.dart`: Punto de entrada de la aplicación
  - `screens/`: Pantallas de la aplicación
  - `widgets/`: Componentes reutilizables
  - `services/`: Servicios para reconocimiento de voz, síntesis, etc.
  - `utils/`: Utilidades y helpers
  - `models/`: Modelos de datos

- `assets/`: Contiene recursos como imágenes y animaciones
  - `images/`: Imágenes utilizadas en la aplicación
  - `animations/`: Archivos JSON para animaciones Lottie

## Uso

1. Al iniciar la aplicación, se solicitarán los permisos necesarios.
2. Después de la animación inicial, aparecerá el orbe principal.
3. Toca el orbe para comenzar a hablar.
4. El orbe cambiará su animación mientras escucha y cuando responde.
5. Las respuestas se mostrarán en texto y se reproducirán por voz.

## Backend

Esta aplicación está diseñada para conectarse a un backend separado que procesa los comandos de voz y genera respuestas. El backend no está incluido en este repositorio.

## Licencia

[Especificar licencia]

## Contacto

[Información de contacto]

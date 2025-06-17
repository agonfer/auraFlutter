# Guía de Desarrollo - Aura

Esta guía proporciona información detallada sobre la estructura del proyecto Aura y cómo extender su funcionalidad.

## Estructura del proyecto

```
auraFlutter/
├── android/               # Configuración específica de Android
├── ios/                   # Configuración específica de iOS
├── linux/                 # Configuración específica de Linux
├── macos/                 # Configuración específica de macOS
├── web/                   # Configuración específica de Web
├── windows/               # Configuración específica de Windows
├── assets/                # Recursos de la aplicación
│   ├── animations/        # Animaciones en formato JSON (Lottie)
│   └── images/            # Imágenes y recursos gráficos
├── lib/                   # Código fuente principal
│   ├── main.dart          # Punto de entrada de la aplicación
│   ├── screens/           # Pantallas de la aplicación
│   │   ├── home_screen.dart
│   │   └── splash_screen.dart
│   ├── widgets/           # Widgets reutilizables
│   │   ├── aura_orb.dart
│   │   └── splash_animation.dart
│   ├── services/          # Servicios de la aplicación
│   │   ├── permission_service.dart
│   │   ├── speech_service.dart
│   │   └── tts_service.dart
│   ├── utils/             # Utilidades y helpers
│   │   ├── generate_background.dart
│   │   └── create_bg_image.dart
│   └── models/            # Modelos de datos
└── test/                  # Tests unitarios e integración
```

## Componentes principales

### 1. Pantallas (screens)

- **SplashScreen**: Pantalla inicial con animación y solicitud de permisos
- **HomeScreen**: Pantalla principal con el orbe de Aura

### 2. Widgets

- **AuraOrb**: Animación del orbe central que reacciona a la voz
- **SplashAnimation**: Animación de entrada usando Lottie

### 3. Servicios

- **PermissionService**: Gestión de permisos (micrófono, cámara, galería)
- **SpeechService**: Reconocimiento de voz
- **TTSService**: Síntesis de voz

### 4. Utilidades

- **BackgroundGradientPainter**: Genera el fondo degradado
- **BackgroundImageGenerator**: Crea y guarda la imagen de fondo

## Flujo de la aplicación

1. La aplicación inicia en `main.dart`
2. Se muestra `SplashScreen` con la animación de entrada
3. Se solicitan los permisos necesarios
4. Una vez concedidos, se navega a `HomeScreen`
5. El usuario interactúa con el orbe para activar el reconocimiento de voz
6. Las respuestas se muestran en texto y se reproducen mediante síntesis de voz

## Cómo extender la aplicación

### Agregar nuevos comandos de voz

Para agregar nuevos comandos, modifica el método `_processVoiceCommand` en `home_screen.dart`:

```dart
void _processVoiceCommand(String text) {
  String lowerText = text.toLowerCase();
  
  if (lowerText.contains('nueva_palabra_clave')) {
    _speak('Nueva respuesta');
  } else if (...) {
    // Otros comandos
  }
}
```

### Conectar con un backend

Para integrar un backend, crea un nuevo servicio en `lib/services/api_service.dart`:

```dart
import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiService {
  static final ApiService _instance = ApiService._internal();
  factory ApiService() => _instance;
  
  ApiService._internal();
  
  final String baseUrl = 'https://tu-backend.com/api';
  
  Future<String> processCommand(String command) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/process'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'command': command}),
      );
      
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return data['response'] ?? 'No se pudo procesar la solicitud';
      } else {
        return 'Error: ${response.statusCode}';
      }
    } catch (e) {
      return 'Error de conexión: $e';
    }
  }
}
```

Luego, actualiza el método `_processVoiceCommand` en `home_screen.dart`:

```dart
Future<void> _processVoiceCommand(String text) async {
  setState(() {
    _isProcessing = true;
  });
  
  try {
    final response = await ApiService().processCommand(text);
    _speak(response);
  } catch (e) {
    _speak('Lo siento, ocurrió un error al procesar tu solicitud');
  } finally {
    setState(() {
      _isProcessing = false;
    });
  }
}
```

### Personalizar la apariencia del orbe

Para modificar la apariencia del orbe, edita la clase `OrbPainter` en `lib/widgets/aura_orb.dart`.

### Agregar nuevas animaciones

1. Añade el archivo JSON de la animación en `assets/animations/`
2. Actualiza `pubspec.yaml` si es necesario
3. Usa el widget `Lottie` para mostrar la animación:

```dart
Lottie.asset(
  'assets/animations/nueva_animacion.json',
  width: 200,
  height: 200,
)
```

## Buenas prácticas

1. **Patrón Singleton**: Usa el patrón singleton para servicios que necesiten mantener estado global
2. **Separación de responsabilidades**: Mantén la lógica de negocio separada de la UI
3. **Gestión de estado**: Usa `setState` para cambios locales y considera un gestor de estado como Provider para aplicaciones más complejas
4. **Manejo de errores**: Implementa try-catch para operaciones que puedan fallar
5. **Comentarios**: Documenta el código, especialmente las funciones complejas

## Pruebas

Para ejecutar las pruebas:

```
flutter test
```

Para crear nuevas pruebas, añade archivos en el directorio `test/`.

## Recursos adicionales

- [Documentación de Flutter](https://flutter.dev/docs)
- [Documentación de Lottie](https://pub.dev/packages/lottie)
- [Documentación de Speech to Text](https://pub.dev/packages/speech_to_text)
- [Documentación de Flutter TTS](https://pub.dev/packages/flutter_tts) 
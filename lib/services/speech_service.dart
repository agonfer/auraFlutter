import 'package:flutter/foundation.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

class SpeechService {
  static final SpeechService _instance = SpeechService._internal();
  factory SpeechService() => _instance;
  
  SpeechService._internal();
  
  final stt.SpeechToText _speech = stt.SpeechToText();
  bool _isInitialized = false;
  bool _isListening = false;
  String _lastRecognizedWords = '';
  
  // Callbacks
  Function(String)? onResult;
  Function(String)? onStatus;
  Function(String)? onError;
  
  /// Inicializa el servicio de reconocimiento de voz
  Future<bool> initialize() async {
    if (_isInitialized) {
      return true;
    }
    
    try {
      _isInitialized = await _speech.initialize(
        onStatus: (status) {
          if (onStatus != null) {
            onStatus!(status);
          }
          debugPrint('Estado del reconocimiento: $status');
        },
        onError: (errorNotification) {
          if (onError != null) {
            onError!(errorNotification.errorMsg);
          }
          debugPrint('Error de reconocimiento: ${errorNotification.errorMsg}');
        },
      );
      
      return _isInitialized;
    } catch (e) {
      debugPrint('Error al inicializar el reconocimiento de voz: $e');
      return false;
    }
  }
  
  /// Comienza a escuchar la entrada de voz
  Future<bool> startListening({String localeId = 'es_ES'}) async {
    if (!_isInitialized) {
      await initialize();
    }
    
    if (_isListening) {
      return true;
    }
    
    try {
      _isListening = await _speech.listen(
        onResult: (result) {
          _lastRecognizedWords = result.recognizedWords;
          if (onResult != null) {
            onResult!(_lastRecognizedWords);
          }
        },
        localeId: localeId,
      );
      
      return _isListening;
    } catch (e) {
      debugPrint('Error al iniciar la escucha: $e');
      return false;
    }
  }
  
  /// Detiene la escucha activa
  Future<bool> stopListening() async {
    if (!_isListening) {
      return true;
    }
    
    try {
      await _speech.stop();
      _isListening = false;
      return true;
    } catch (e) {
      debugPrint('Error al detener la escucha: $e');
      return false;
    }
  }
  
  /// Cancela la escucha y descarta los resultados
  Future<bool> cancelListening() async {
    if (!_isListening) {
      return true;
    }
    
    try {
      await _speech.cancel();
      _isListening = false;
      return true;
    } catch (e) {
      debugPrint('Error al cancelar la escucha: $e');
      return false;
    }
  }
  
  /// Verifica si el dispositivo tiene reconocimiento de voz disponible
  Future<bool> hasPermission() async {
    if (!_isInitialized) {
      await initialize();
    }
    
    return _speech.hasPermission;
  }
  
  /// Obtiene el último texto reconocido
  String getLastRecognizedWords() {
    return _lastRecognizedWords;
  }
  
  /// Verifica si está escuchando actualmente
  bool isListening() {
    return _isListening;
  }
  
  /// Verifica si el servicio está inicializado
  bool isInitialized() {
    return _isInitialized;
  }
} 
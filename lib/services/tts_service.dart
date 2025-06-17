import 'package:flutter/foundation.dart';
import 'package:flutter_tts/flutter_tts.dart';

class TTSService {
  static final TTSService _instance = TTSService._internal();
  factory TTSService() => _instance;
  
  TTSService._internal();
  
  final FlutterTts _flutterTts = FlutterTts();
  bool _isInitialized = false;
  bool _isSpeaking = false;
  
  // Callbacks
  Function()? onStart;
  Function()? onComplete;
  Function(String)? onError;
  
  /// Inicializa el servicio de síntesis de voz
  Future<bool> initialize() async {
    if (_isInitialized) {
      return true;
    }
    
    try {
      // Configurar el idioma
      await _flutterTts.setLanguage('es-ES');
      
      // Configurar la velocidad de habla
      await _flutterTts.setSpeechRate(0.5);
      
      // Configurar el volumen
      await _flutterTts.setVolume(1.0);
      
      // Configurar el tono
      await _flutterTts.setPitch(1.0);
      
      // Configurar callbacks
      _flutterTts.setStartHandler(() {
        _isSpeaking = true;
        if (onStart != null) {
          onStart!();
        }
        debugPrint('TTS: Comenzó a hablar');
      });
      
      _flutterTts.setCompletionHandler(() {
        _isSpeaking = false;
        if (onComplete != null) {
          onComplete!();
        }
        debugPrint('TTS: Terminó de hablar');
      });
      
      _flutterTts.setErrorHandler((error) {
        _isSpeaking = false;
        if (onError != null) {
          onError!(error);
        }
        debugPrint('TTS Error: $error');
      });
      
      _isInitialized = true;
      return true;
    } catch (e) {
      debugPrint('Error al inicializar TTS: $e');
      return false;
    }
  }
  
  /// Habla el texto proporcionado
  Future<bool> speak(String text) async {
    if (!_isInitialized) {
      await initialize();
    }
    
    if (_isSpeaking) {
      await stop();
    }
    
    try {
      await _flutterTts.speak(text);
      return true;
    } catch (e) {
      debugPrint('Error al hablar: $e');
      return false;
    }
  }
  
  /// Detiene la síntesis de voz
  Future<bool> stop() async {
    if (!_isSpeaking) {
      return true;
    }
    
    try {
      await _flutterTts.stop();
      _isSpeaking = false;
      return true;
    } catch (e) {
      debugPrint('Error al detener TTS: $e');
      return false;
    }
  }
  
  /// Pausa la síntesis de voz
  Future<bool> pause() async {
    if (!_isSpeaking) {
      return true;
    }
    
    try {
      await _flutterTts.pause();
      return true;
    } catch (e) {
      debugPrint('Error al pausar TTS: $e');
      return false;
    }
  }
  
  /// Verifica si está hablando actualmente
  bool isSpeaking() {
    return _isSpeaking;
  }
  
  /// Verifica si el servicio está inicializado
  bool isInitialized() {
    return _isInitialized;
  }
  
  /// Configura la velocidad de habla (0.0 - 1.0)
  Future<bool> setSpeechRate(double rate) async {
    if (!_isInitialized) {
      await initialize();
    }
    
    try {
      await _flutterTts.setSpeechRate(rate);
      return true;
    } catch (e) {
      debugPrint('Error al configurar la velocidad de habla: $e');
      return false;
    }
  }
  
  /// Configura el volumen (0.0 - 1.0)
  Future<bool> setVolume(double volume) async {
    if (!_isInitialized) {
      await initialize();
    }
    
    try {
      await _flutterTts.setVolume(volume);
      return true;
    } catch (e) {
      debugPrint('Error al configurar el volumen: $e');
      return false;
    }
  }
  
  /// Configura el tono (0.5 - 2.0)
  Future<bool> setPitch(double pitch) async {
    if (!_isInitialized) {
      await initialize();
    }
    
    try {
      await _flutterTts.setPitch(pitch);
      return true;
    } catch (e) {
      debugPrint('Error al configurar el tono: $e');
      return false;
    }
  }
} 
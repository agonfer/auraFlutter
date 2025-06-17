import 'package:flutter/material.dart';
import '../widgets/aura_orb.dart';
import '../utils/generate_background.dart';
import '../services/speech_service.dart';
import '../services/tts_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final SpeechService _speechService = SpeechService();
  final TTSService _ttsService = TTSService();
  
  bool _isListening = false;
  bool _isSpeaking = false;
  String _recognizedText = '';
  String _responseText = '';
  
  @override
  void initState() {
    super.initState();
    _initializeServices();
  }
  
  Future<void> _initializeServices() async {
    // Inicializar el servicio de reconocimiento de voz
    await _speechService.initialize();
    _speechService.onResult = _onSpeechResult;
    _speechService.onStatus = _onSpeechStatus;
    _speechService.onError = _onSpeechError;
    
    // Inicializar el servicio de síntesis de voz
    await _ttsService.initialize();
    _ttsService.onStart = _onTTSStart;
    _ttsService.onComplete = _onTTSComplete;
    _ttsService.onError = _onTTSError;
    
    // Mensaje de bienvenida
    _speak('Hola, soy Aura, tu asistente de voz. ¿En qué puedo ayudarte?');
  }
  
  void _onSpeechResult(String text) {
    setState(() {
      _recognizedText = text;
    });
    
    // Aquí se procesaría el texto reconocido y se enviaría al backend
    // Por ahora, simplemente responderemos con un eco
    _processVoiceCommand(text);
  }
  
  void _onSpeechStatus(String status) {
    if (status == 'listening') {
      setState(() {
        _isListening = true;
      });
    } else if (status == 'notListening') {
      setState(() {
        _isListening = false;
      });
    }
  }
  
  void _onSpeechError(String errorMsg) {
    setState(() {
      _isListening = false;
    });
    _speak('Lo siento, no pude entenderte. ¿Podrías repetirlo?');
  }
  
  void _onTTSStart() {
    setState(() {
      _isSpeaking = true;
    });
  }
  
  void _onTTSComplete() {
    setState(() {
      _isSpeaking = false;
    });
  }
  
  void _onTTSError(String error) {
    setState(() {
      _isSpeaking = false;
    });
  }
  
  Future<void> _toggleListening() async {
    if (_isSpeaking) {
      await _ttsService.stop();
    }
    
    if (_isListening) {
      await _speechService.stopListening();
    } else {
      await _speechService.startListening();
    }
  }
  
  Future<void> _speak(String text) async {
    setState(() {
      _responseText = text;
    });
    
    await _ttsService.speak(text);
  }
  
  void _processVoiceCommand(String text) {
    // Aquí se conectaría con el backend para procesar el comando
    // Por ahora, simplemente responderemos con un mensaje genérico
    
    String lowerText = text.toLowerCase();
    
    if (lowerText.contains('hola') || lowerText.contains('buenos días') || lowerText.contains('buenas tardes')) {
      _speak('Hola, ¿en qué puedo ayudarte?');
    } else if (lowerText.contains('cómo estás')) {
      _speak('Estoy bien, gracias por preguntar. ¿Y tú?');
    } else if (lowerText.contains('qué puedes hacer')) {
      _speak('Puedo ayudarte con información, responder preguntas y asistirte en diversas tareas. ¿En qué te gustaría que te ayude?');
    } else if (lowerText.contains('gracias')) {
      _speak('De nada, estoy aquí para ayudarte.');
    } else if (lowerText.contains('adiós') || lowerText.contains('hasta luego')) {
      _speak('Hasta luego, que tengas un buen día.');
    } else {
      _speak('He escuchado: $text. Aún no puedo procesar esta solicitud, pero estoy aprendiendo.');
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientBackground(
        child: SafeArea(
          child: Column(
            children: [
              // Área superior para información
              Expanded(
                flex: 1,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      _recognizedText.isEmpty ? 'Toca el orbe para hablar' : _recognizedText,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
              
              // Orbe central
              Expanded(
                flex: 2,
                child: GestureDetector(
                  onTap: _toggleListening,
                  child: Center(
                    child: AuraOrb(
                      isListening: _isListening,
                      isSpeaking: _isSpeaking,
                    ),
                  ),
                ),
              ),
              
              // Área inferior para respuestas
              Expanded(
                flex: 1,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      _responseText,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  
  @override
  void dispose() {
    _speechService.stopListening();
    _ttsService.stop();
    super.dispose();
  }
} 
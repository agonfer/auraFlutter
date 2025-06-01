import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Reconocimiento de Voz',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      ),
      home: const MyHomePage(title: 'Reconocimiento de Voz'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  stt.SpeechToText _speech = stt.SpeechToText();
  bool _isListening = false;
  String _text = 'Presiona el botón y di "botón 1" o "botón 2"';
  String _message = '';
  bool _speechEnabled = false;
  String _initError = '';

  @override
  void initState() {
    super.initState();
    _initSpeech();
  }

  void _initSpeech() async {
    try {
      _speechEnabled = await _speech.initialize(
        onStatus: (status) {
          print('Estado del reconocimiento: $status');
          setState(() {
            _message = 'Estado: $status';
          });
        },
        onError: (errorNotification) {
          print('Error de reconocimiento: $errorNotification');
          setState(() {
            _message = 'Error: ${errorNotification.errorMsg}';
          });
        },
      );
      
      // Verificar si el dispositivo tiene reconocimiento de voz disponible
      final isAvailable = await _speech.hasPermission;
      print('Reconocimiento disponible: $isAvailable');
      
      setState(() {
        if (!_speechEnabled) {
          _initError = 'El reconocimiento de voz no se pudo inicializar. Si estás en un simulador, esto es normal ya que los simuladores no soportan entrada de micrófono.';
          _message = _initError;
        } else {
          _message = 'Reconocimiento de voz inicializado correctamente';
        }
      });
    } catch (e) {
      print('Error al inicializar el reconocimiento de voz: $e');
      setState(() {
        _initError = 'Error al inicializar: $e';
        _message = _initError;
      });
    }
  }

  void _listen() async {
    if (!_isListening) {
      if (_speechEnabled) {
        setState(() {
          _isListening = true;
          _message = 'Escuchando...';
        });
        
        try {
          await _speech.listen(
            onResult: (result) {
              setState(() {
                _text = result.recognizedWords;
                if (_text.toLowerCase().contains('botón 1')) {
                  _message = '¡Has activado el Botón 1!';
                } else if (_text.toLowerCase().contains('botón 2')) {
                  _message = '¡Has activado el Botón 2!';
                }
              });
            },
            localeId: 'es_ES', // Configurar para español
          );
        } catch (e) {
          print('Error al escuchar: $e');
          setState(() {
            _message = 'Error al escuchar: $e';
            _isListening = false;
          });
        }
      } else {
        setState(() {
          _message = _initError.isNotEmpty 
              ? _initError 
              : 'El reconocimiento de voz no está disponible';
        });
      }
    } else {
      setState(() {
        _isListening = false;
        _message = 'Reconocimiento detenido';
      });
      await _speech.stop();
    }
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Botones disponibles:',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _message = '¡Has presionado el Botón 1!';
                    });
                  },
                  child: const Text('Botón 1'),
                ),
                const SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _message = '¡Has presionado el Botón 2!';
                    });
                  },
                  child: const Text('Botón 2'),
                ),
              ],
            ),
            const SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                _text,
                style: const TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                _message,
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _listen,
        tooltip: 'Escuchar',
        child: Icon(_isListening ? Icons.mic : Icons.mic_none),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

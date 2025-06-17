import 'dart:io';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:path_provider/path_provider.dart';

/// Esta clase se utiliza para generar y guardar la imagen de fondo degradado
/// como un archivo PNG en el directorio de la aplicación.
class BackgroundImageGenerator {
  /// Genera y guarda la imagen de fondo degradado
  static Future<String> generateAndSaveBackground() async {
    // Crear un objeto Picture para dibujar
    final ui.PictureRecorder recorder = ui.PictureRecorder();
    final Canvas canvas = Canvas(recorder);
    final Size size = const Size(1080, 1920); // Resolución para un teléfono estándar
    
    // Crear el degradado
    final Rect rect = Offset.zero & size;
    final Paint paint = Paint();
    paint.shader = ui.Gradient.linear(
      Offset(0, 0),
      Offset(size.width, size.height),
      [
        const Color(0xFF6E3BF4), // Púrpura en la esquina superior izquierda
        const Color(0xFF61A0F9), // Azul claro en la parte superior
        const Color(0xFFF47EB3), // Rosa en el centro
        const Color(0xFFFFA15F), // Naranja en la esquina inferior derecha
      ],
      [0.0, 0.3, 0.6, 1.0],
    );
    
    // Dibujar el rectángulo con el degradado
    canvas.drawRect(rect, paint);
    
    // Finalizar la grabación y obtener la imagen
    final ui.Picture picture = recorder.endRecording();
    final ui.Image image = await picture.toImage(size.width.toInt(), size.height.toInt());
    final ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    
    if (byteData == null) {
      throw Exception('No se pudo generar la imagen');
    }
    
    // Convertir ByteData a bytes
    final Uint8List pngBytes = byteData.buffer.asUint8List();
    
    // Guardar la imagen en el directorio de la aplicación
    final Directory appDir = await getApplicationDocumentsDirectory();
    final String bgPath = '${appDir.path}/bg.png';
    final File file = File(bgPath);
    await file.writeAsBytes(pngBytes);
    
    return bgPath;
  }
} 
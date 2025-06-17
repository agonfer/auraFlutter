import 'dart:ui' as ui;
import 'package:flutter/material.dart';

class BackgroundGradientPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Rect rect = Offset.zero & size;
    
    // Crear un degradado similar al de la imagen de referencia
    final gradient = ui.Gradient.linear(
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
    
    final paint = Paint()..shader = gradient;
    canvas.drawRect(rect, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class GradientBackground extends StatelessWidget {
  final Widget child;
  
  const GradientBackground({Key? key, required this.child}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: BackgroundGradientPainter(),
      child: child,
    );
  }
} 
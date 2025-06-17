import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';

class AuraOrb extends StatefulWidget {
  final bool isListening;
  final bool isSpeaking;
  
  const AuraOrb({
    Key? key, 
    required this.isListening, 
    required this.isSpeaking,
  }) : super(key: key);

  @override
  State<AuraOrb> createState() => _AuraOrbState();
}

class _AuraOrbState extends State<AuraOrb> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  double _rotateX = 0;
  double _rotateY = 0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 7000),
    )..repeat(reverse: false);
  }
  
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  
  void _updateRotation(Offset position, Size size) {
    setState(() {
      _rotateX = (position.dy - size.height / 2) / (size.height / 2) * 0.15;
      _rotateY = -(position.dx - size.width / 2) / (size.width / 2) * 0.15;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onHover: (event) => _updateRotation(event.localPosition, const Size(200, 200)),
      child: GestureDetector(
        onPanUpdate: (details) => _updateRotation(details.localPosition, const Size(200, 200)),
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Transform(
              transform: Matrix4.identity()
                ..setEntry(3, 2, 0.001)
                ..rotateX(_rotateX)
                ..rotateY(_rotateY),
              alignment: Alignment.center,
              child: Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    // Capa base completamente transparente
                    Container(
                      width: 180,
                      height: 180,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.transparent,
                      ),
                    ),
                    
                    // Efecto de onda interior en 3D - estilo Siri
                    _buildSiriWaveEffect(),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
  
  Widget _buildSiriWaveEffect() {
    // Color base según el estado
    Color baseColor;
    if (widget.isListening) {
      baseColor = Colors.blue;
    } else if (widget.isSpeaking) {
      baseColor = Colors.purpleAccent;
    } else {
      baseColor = Colors.cyan;
    }
    
    // Intensidad de la animación
    double intensity = widget.isListening ? 1.2 : widget.isSpeaking ? 1.0 : 0.8;
    
    return SizedBox(
      width: 180,
      height: 180,
      child: CustomPaint(
        painter: SiriOrbPainter(
          progress: _controller.value,
          baseColor: baseColor,
          intensity: intensity,
        ),
      ),
    );
  }
}

class SiriOrbPainter extends CustomPainter {
  final double progress;
  final Color baseColor;
  final double intensity;
  
  SiriOrbPainter({
    required this.progress, 
    required this.baseColor,
    required this.intensity,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;
    
    // Dibuja el efecto de ondas tipo Siri
    _drawSiriWaves(canvas, center, radius);
    
    // Dibuja las partículas flotantes
    _drawFloatingParticles(canvas, center, radius);
  }
  
  void _drawSiriWaves(Canvas canvas, Offset center, double radius) {
    // Variables para controlar la forma y el movimiento de las ondas
    final baseAmplitude = 5.0 * intensity;
    final baseFrequency = 8.0;
    final layerCount = 3;
    
    for (int layer = 0; layer < layerCount; layer++) {
      // Cada capa tiene una fase diferente para crear sensación de profundidad
      final layerPhase = progress * 2 * pi + (layer * pi / layerCount);
      final layerOpacity = 0.25 - (layer * 0.05);
      
      // También variamos ligeramente el color
      final Color layerColor = HSLColor.fromColor(baseColor)
          .withLightness(0.5 + layer * 0.1)
          .withSaturation(0.7 - layer * 0.1)
          .toColor()
          .withOpacity(layerOpacity);
      
      _drawWaveLayer(
        canvas, 
        center, 
        radius * (0.85 - layer * 0.05), 
        layerPhase, 
        baseAmplitude * (1.0 - layer * 0.2),
        baseFrequency + layer,
        layerColor,
        layer,
      );
    }
  }
  
  void _drawWaveLayer(
    Canvas canvas, 
    Offset center, 
    double radius, 
    double phase, 
    double amplitude, 
    double frequency, 
    Color color,
    int layer,
  ) {
    // Vamos a crear múltiples círculos concéntricos con ondulaciones
    final segmentCount = 80;
    
    // Usamos un Path para dibujar la forma
    final path = Path();
    final points = <Offset>[];
    
    // Crea puntos con ondulación que simula el efecto de Siri
    for (int i = 0; i <= segmentCount; i++) {
      final angle = 2 * pi * i / segmentCount;
      
      // Combinamos varias ondas sinusoidales para un efecto más orgánico
      final wave1 = sin(frequency * angle + phase) * amplitude;
      final wave2 = sin(frequency * 0.5 * angle + phase * 1.3) * (amplitude * 0.5);
      final wave3 = sin(frequency * 2 * angle + phase * 0.7) * (amplitude * 0.3);
      
      final combinedWave = wave1 + wave2 + wave3;
      
      final x = center.dx + (radius + combinedWave) * cos(angle);
      final y = center.dy + (radius + combinedWave) * sin(angle);
      
      points.add(Offset(x, y));
      
      if (i == 0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }
    }
    
    // Cerramos el path
    path.close();
    
    // Creamos un paint con blur y transparencia
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill
      ..maskFilter = MaskFilter.blur(BlurStyle.normal, 15.0);
    
    // Dibujamos el path
    canvas.drawPath(path, paint);
    
    // Añadimos un borde sutil con más desenfoque para dar efecto de profundidad
    final borderPaint = Paint()
      ..color = color.withOpacity(0.1)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2
      ..maskFilter = MaskFilter.blur(BlurStyle.normal, 8);
      
    canvas.drawPath(path, borderPaint);
    
    // Dibujamos un gradiente radial en el centro para añadir brillo
    if (layer == 0) {
      final glowPaint = Paint()
        ..shader = RadialGradient(
          colors: [
            color.withOpacity(0.3),
            color.withOpacity(0.1),
            Colors.transparent,
          ],
          stops: const [0.0, 0.5, 1.0],
        ).createShader(Rect.fromCircle(center: center, radius: radius * 1.2));
      
      canvas.drawCircle(center, radius * 0.8, glowPaint);
    }
  }
  
  void _drawFloatingParticles(Canvas canvas, Offset center, double radius) {
    final particleCount = 25;
    final random = Random(42); // Semilla fija para consistencia
    
    for (int i = 0; i < particleCount; i++) {
      // Posición base de la partícula
      final angle = random.nextDouble() * 2 * pi;
      final distance = random.nextDouble() * radius * 0.8;
      
      // Tamaño y velocidad
      final size = random.nextDouble() * 3.0 + 1.0;
      final speed = random.nextDouble() * 0.5 + 0.5;
      
      // Movimiento animado
      final offsetX = sin(progress * 2 * pi * speed + i) * 8.0;
      final offsetY = cos(progress * 2 * pi * speed + i * 1.5) * 8.0;
      
      final x = center.dx + (distance * cos(angle)) + offsetX;
      final y = center.dy + (distance * sin(angle)) + offsetY;
      
      // Opacidad pulsante
      final opacity = 0.4 + sin(progress * 2 * pi * speed + i) * 0.2;
      
      // Color con ligera variación
      final hue = HSLColor.fromColor(baseColor).withLightness(random.nextDouble() * 0.3 + 0.5);
      final particleColor = hue.toColor().withOpacity(opacity);
      
      // Dibujar partícula con brillo
      final paint = Paint()
        ..color = particleColor
        ..style = PaintingStyle.fill
        ..maskFilter = MaskFilter.blur(BlurStyle.normal, size);
      
      canvas.drawCircle(Offset(x, y), size, paint);
      
      // Añadir un pequeño destello central
      final glowPaint = Paint()
        ..color = Colors.white.withOpacity(opacity * 0.7)
        ..style = PaintingStyle.fill;
      
      canvas.drawCircle(Offset(x, y), size * 0.3, glowPaint);
    }
  }
  
  @override
  bool shouldRepaint(covariant SiriOrbPainter oldDelegate) {
    return oldDelegate.progress != progress ||
           oldDelegate.baseColor != baseColor ||
           oldDelegate.intensity != intensity;
  }
} 
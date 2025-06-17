import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashAnimation extends StatefulWidget {
  final VoidCallback onAnimationComplete;
  
  const SplashAnimation({
    Key? key,
    required this.onAnimationComplete,
  }) : super(key: key);

  @override
  State<SplashAnimation> createState() => _SplashAnimationState();
}

class _SplashAnimationState extends State<SplashAnimation> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );
    
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        widget.onAnimationComplete();
      }
    });
    
    _controller.forward();
  }
  
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Lottie.asset(
        'assets/animations/splash_animation.json',
        controller: _controller,
        width: 300,
        height: 300,
        fit: BoxFit.contain,
        onLoaded: (composition) {
          // Configurar la duración del controlador para que coincida con la animación
          _controller.duration = composition.duration;
        },
      ),
    );
  }
} 
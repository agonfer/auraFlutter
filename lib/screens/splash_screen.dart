import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import '../utils/generate_background.dart';
import '../widgets/splash_animation.dart';
import '../services/permission_service.dart';
import 'home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _animationCompleted = false;
  bool _permissionsRequested = false;
  
  @override
  void initState() {
    super.initState();
  }
  
  void _onAnimationComplete() {
    setState(() {
      _animationCompleted = true;
    });
    _requestPermissions();
  }
  
  Future<void> _requestPermissions() async {
    if (_permissionsRequested) {
      return;
    }
    
    setState(() {
      _permissionsRequested = true;
    });
    
    final permissionStatuses = await PermissionService.requestAllPermissions();
    
    // Verificar si todos los permisos fueron concedidos
    bool allGranted = true;
    permissionStatuses.forEach((permission, status) {
      if (status != PermissionStatus.granted) {
        allGranted = false;
      }
    });
    
    if (allGranted) {
      _navigateToHome();
    } else {
      _showPermissionDialog();
    }
  }
  
  void _showPermissionDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          title: const Text('Permisos necesarios'),
          content: const Text(
            'Para que Aura funcione correctamente, necesita acceso al micrófono, la cámara y la galería de fotos. '
            'Por favor, concede todos los permisos solicitados.',
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                _requestPermissions();
              },
              child: const Text('Reintentar'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                PermissionService.openSettings();
              },
              child: const Text('Abrir configuración'),
            ),
          ],
        );
      },
    );
  }
  
  void _navigateToHome() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => const HomeScreen()),
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientBackground(
        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: SplashAnimation(
                    onAnimationComplete: _onAnimationComplete,
                  ),
                ),
                if (_animationCompleted && _permissionsRequested)
                  const Padding(
                    padding: EdgeInsets.all(32.0),
                    child: CircularProgressIndicator(
                      color: Colors.white,
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
} 
import 'package:permission_handler/permission_handler.dart';

class PermissionService {
  /// Solicita todos los permisos necesarios para la aplicación
  static Future<Map<Permission, PermissionStatus>> requestAllPermissions() async {
    Map<Permission, PermissionStatus> statuses = {};
    
    // Permiso de micrófono
    statuses[Permission.microphone] = await Permission.microphone.request();
    
    // Permiso de cámara
    statuses[Permission.camera] = await Permission.camera.request();
    
    // Permiso de almacenamiento para acceder a la galería
    statuses[Permission.photos] = await Permission.photos.request();
    statuses[Permission.storage] = await Permission.storage.request();
    
    return statuses;
  }
  
  /// Verifica si todos los permisos están concedidos
  static Future<bool> checkAllPermissions() async {
    bool microphone = await Permission.microphone.isGranted;
    bool camera = await Permission.camera.isGranted;
    bool photos = await Permission.photos.isGranted;
    bool storage = await Permission.storage.isGranted;
    
    return microphone && camera && photos && storage;
  }
  
  /// Verifica un permiso específico
  static Future<bool> checkPermission(Permission permission) async {
    return await permission.isGranted;
  }
  
  /// Abre la configuración de la aplicación para que el usuario pueda habilitar permisos
  static Future<bool> openSettings() async {
    return await openAppSettings();
  }
} 
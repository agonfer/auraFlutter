# Pasos rápidos para ejecutar Aura en tu dispositivo Android

## Requisito previo
Asegúrate de que tu dispositivo Android está conectado al ordenador mediante un cable USB y que la depuración USB está habilitada.

## Pasos para ejecutar la aplicación

1. **Descargar Flutter** (si no lo has hecho ya):
   - Descarga desde [flutter.dev](https://flutter.dev/docs/get-started/install)
   - Extrae el archivo en una ubicación como `C:\flutter`

2. **Ejecutar estos comandos** (copia y pega en PowerShell o CMD):

```
# Navegar a la carpeta del proyecto
cd C:\Users\irene\Desktop\auraFlutter

# Verificar que el dispositivo está conectado
C:\flutter\bin\flutter devices

# Si ves tu dispositivo en la lista, ejecuta la aplicación
C:\flutter\bin\flutter run
```

3. **Espera** mientras la aplicación se compila e instala en tu dispositivo.

4. **¡Disfruta de Aura!** La aplicación se iniciará automáticamente en tu dispositivo Android.

## Si encuentras problemas:

1. Asegúrate de que la depuración USB está habilitada:
   - Ve a Configuración > Opciones de desarrollador > Depuración USB

2. Verifica que el dispositivo aparece cuando ejecutas:
   ```
   C:\flutter\bin\flutter devices
   ```

3. Si necesitas más ayuda, consulta el archivo EJECUTAR_EN_ANDROID.md para instrucciones detalladas. 
# Ejecutar Aura en la Web sin tener Flutter instalado

Para ejecutar la aplicación Aura en la web sin tener que instalar Flutter localmente, puedes seguir estos pasos alternativos:

## Opción 1: Usar un servicio de hosting estático

Puedes subir la versión web compilada de Aura a un servicio de hosting estático como GitHub Pages, Netlify, Vercel o Firebase Hosting. Aquí te explicamos cómo hacerlo con GitHub Pages:

1. Crea una cuenta en GitHub si aún no tienes una
2. Crea un nuevo repositorio público
3. Sube los archivos de la carpeta `build/web` a este repositorio
4. Habilita GitHub Pages en la configuración del repositorio
5. La aplicación estará disponible en `https://tu-usuario.github.io/nombre-del-repo`

## Opción 2: Usar un IDE en línea con soporte para Flutter

Puedes utilizar un IDE en línea que tenga soporte para Flutter y ejecutar la aplicación directamente desde el navegador:

### Usando Gitpod:

1. Crea una cuenta en [Gitpod](https://www.gitpod.io/)
2. Crea un nuevo workspace basado en este repositorio
3. Una vez que el workspace esté listo, ejecuta:
   ```
   flutter config --enable-web
   flutter run -d web-server
   ```
4. Gitpod te mostrará una URL donde puedes acceder a la aplicación

### Usando DartPad:

1. Ve a [DartPad](https://dartpad.dev/)
2. Crea un nuevo proyecto Flutter
3. Copia y pega el código de la aplicación Aura
4. Ejecuta la aplicación directamente en el navegador

## Opción 3: Usar una versión precompilada

Si tienes acceso a una versión precompilada de Aura para web, puedes simplemente:

1. Descargar los archivos compilados
2. Descomprimirlos en una carpeta local
3. Abrir el archivo `index.html` en tu navegador

Sin embargo, ten en cuenta que algunas características como el reconocimiento de voz pueden requerir que la aplicación se sirva a través de HTTPS o desde localhost.

## Opción 4: Usar un servidor web local

Si tienes una versión precompilada de Aura para web, puedes servir los archivos localmente:

### Usando Python:

1. Instala Python si no lo tienes instalado
2. Abre una terminal en la carpeta donde están los archivos web
3. Ejecuta:
   ```
   # Para Python 3
   python -m http.server 8000
   
   # Para Python 2
   python -m SimpleHTTPServer 8000
   ```
4. Abre tu navegador y ve a `http://localhost:8000`

### Usando Node.js:

1. Instala Node.js si no lo tienes instalado
2. Instala el paquete `http-server`:
   ```
   npm install -g http-server
   ```
3. Navega a la carpeta donde están los archivos web
4. Ejecuta:
   ```
   http-server -p 8000
   ```
5. Abre tu navegador y ve a `http://localhost:8000`

## Consideraciones importantes

- **Permisos**: Para que el reconocimiento de voz funcione, deberás conceder permisos de micrófono al navegador
- **Navegadores compatibles**: La aplicación funciona mejor en navegadores modernos como Chrome, Edge o Firefox
- **Limitaciones**: Algunas características pueden tener limitaciones en la versión web comparada con la versión nativa

## Próximos pasos

Una vez que tengas la aplicación funcionando en el navegador:

1. Explora la interfaz de usuario
2. Prueba los comandos de voz (asegúrate de conceder permisos de micrófono)
3. Verifica que la animación del orbe funciona correctamente
4. Comprueba la síntesis de voz 
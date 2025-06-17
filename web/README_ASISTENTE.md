# 🎯 Asistente de Voz para Personas con Discapacidad Visual

## 🚀 Inicio Rápido

### Opción 1: Con Python (Recomendado)
```bash
# Doble clic en:
iniciar_asistente.bat
```

### Opción 2: Con Node.js
```bash
# Doble clic en:
iniciar_con_node.bat
```

### Opción 3: Manual
```bash
# Con Python:
python -m http.server 8000

# Con Node.js:
npx http-server -p 8080 --cors

# Luego abrir en el navegador:
http://localhost:8000 (Python)
http://localhost:8080 (Node.js)
```

## 🎤 Comandos de Voz Disponibles

### Visión General
- **"¿Qué ves?"** o **"¿Qué hay?"** - Describe todos los objetos detectados
- **"Describe la escena"** - Descripción detallada del entorno

### Detección de Objetos
- **"Busca [objeto]"** o **"Detecta [objeto]"** - Busca un objeto específico
- **"¿Dónde está el/la [objeto]?"** - Localiza un objeto

### Reconocimiento de Dinero
- **"Reconoce el billete"** - Identifica billetes
- **"Detecta la moneda"** - Identifica monedas
- **"¿Cuánto dinero es?"** - Lee el valor del dinero

### Lectura de Precios
- **"¿Cuánto cuesta [producto]?"** - Lee el precio de un producto
- **"Precio de [producto]"** - Obtiene información de precio
- **"Lee la etiqueta"** - Lee etiquetas de precios

### Navegación
- **"¿Cómo llegar a [lugar]?"** - Indicaciones paso a paso
- **"Guíame a [destino]"** - Navegación guiada
- **"¿Dónde estoy?"** - Ubicación actual

### Ayuda
- **"Hola"** o **"Ayuda"** - Lista de comandos disponibles
- **"¿Qué puedes hacer?"** - Explica las funcionalidades

## 🎮 Controles

- **Click en el orbe** o **Barra espaciadora**: Activar/desactivar reconocimiento de voz
- **Hablar claramente**: El sistema reconoce comandos en español

## 📋 Requisitos

1. **Navegador moderno** (Chrome, Edge, Firefox)
2. **Cámara** (se activa automáticamente)
3. **Micrófono** (se activa automáticamente)
4. **Conexión a Internet** (para cargar modelos de IA)
5. **Python 3.x** o **Node.js** (para el servidor)

## 🔧 Solución de Problemas

### El navegador no pide permisos
- Asegúrate de usar HTTPS o localhost
- Revisa la configuración de privacidad del navegador

### No se detectan objetos
- Verifica que la cámara esté bien iluminada
- Acerca más la cámara al objeto
- Espera a que los modelos se carguen (10-15 segundos)

### El reconocimiento de voz no funciona
- Habla claro y pausado
- Reduce el ruido de fondo
- Verifica los permisos del micrófono

### Error al iniciar
- Instala Python: https://www.python.org/downloads/
- O instala Node.js: https://nodejs.org/

## 🌟 Características

- ✅ Detección de objetos en tiempo real
- ✅ Reconocimiento de billetes y monedas
- ✅ Lectura de precios y etiquetas
- ✅ Navegación guiada por voz
- ✅ Interfaz 100% accesible
- ✅ Sin elementos visuales distractores
- ✅ Respuestas en español
- ✅ Funciona sin conexión (después de cargar)

## 🔐 Privacidad

- Todo el procesamiento se hace localmente
- No se envían datos a servidores externos
- La cámara y micrófono solo se usan mientras la app está abierta 
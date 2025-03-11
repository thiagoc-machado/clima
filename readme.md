# 🌦️ Proyecto de Clima - FastAPI + Flutter + React + HTML/CSS/JS

Este proyecto es una aplicación completa que muestra el clima de una ciudad utilizando **FastAPI** como backend y múltiples opciones de frontend: **Flutter, React o HTML/CSS/JS**. Por defecto, carga el clima de **Madrid**, pero permite buscar otras ciudades.

## 🚀 Instalación y ejecución local

### 🔧 Requisitos previos

- **Python 3.8+**
- **Node.js y npm** (para React)
- **Flutter** (para la versión Flutter)
- **pip** (administrador de paquetes de Python)
- **FastAPI y dependencias** (listadas en `requirements.txt`)
- **Un navegador web** (para visualizar las versiones en React y HTML)

---

## 📂 Estructura del Proyecto

```
proyecto/
│── app/                    # Backend FastAPI
│   │── __init__.py
│   │── main.py             # Archivo principal que inicia la API
│   │── config.py           # Configuración y carga de variables de entorno
│   │── routes.py           # Define las rutas del FastAPI
│   │── services.py         # Lógica de solicitud a la API de Weatherstack
│   └── models.py           # Estructura de datos (Opcional)
│── flutter/
│   └── my_weather_app/     # Aplicación Flutter
│── react-app/              # Aplicación React
│── index.html              # Aplicación HTML/CSS/JS
│── .env                    # Variables de entorno
│── .gitignore              # Archivos a ignorar en Git
│── requirements.txt        # Dependencias del backend
│── README.md               # Documentación
```

---

## 🖥️ 1️⃣ Configurar y ejecutar el backend (FastAPI)

### 📌 Instalación

1. Clona este repositorio o descarga los archivos:
   ```bash
   git clone https://github.com/tu_usuario/proyecto-clima.git
   cd proyecto-clima
   ```

2. Crea y activa un entorno virtual:
   ```bash
   python -m venv venv
   source venv/bin/activate  # Linux/macOS
   venv\Scripts\activate  # Windows
   ```

3. Instala las dependencias:
   ```bash
   pip install -r requirements.txt
   ```

4. Crea un archivo `.env` en la raíz del proyecto y agrega:
   ```ini
   weatherstack_access=TU_API_KEY
   weatherstack_api=http://api.weatherstack.com/
   ```
   (Reemplaza `TU_API_KEY` con tu clave de Weatherstack)

### 🚀 Ejecutar el backend

Inicia el servidor FastAPI con:
   ```bash
   uvicorn app.main:app --reload
   ```
   Esto ejecutará el backend en `http://127.0.0.1:8000`

Puedes probar la API en **Swagger** accediendo a:
   - 📄 `http://127.0.0.1:8000/docs` (documentación interactiva de la API)

---

## 🌐 2️⃣ Ejecutar el frontend (HTML/CSS/JS)

1. Abre el archivo **`index.html`** en un navegador.
2. Automáticamente cargará el clima de **Madrid**.
3. Puedes escribir el nombre de una ciudad y presionar **Enter** o hacer clic en **"Buscar"**.

Alternativamente, puedes iniciar un servidor local para evitar problemas de CORS:
```bash
python -m http.server 5500  # Servidor en localhost:5500
```

Luego accede en el navegador a:
```
http://127.0.0.1:5500/index.html
```

---

## ⚛️ 3️⃣ Ejecutar el frontend en React

1. Accede al directorio del proyecto React:
   ```bash
   cd react-app
   ```
2. Instala las dependencias:
   ```bash
   npm install
   ```
3. Inicia el servidor de desarrollo:
   ```bash
   npm start
   ```
   Luego accede en el navegador a:
   ```
   http://localhost:3000
   ```

---

## 🐦 4️⃣ Ejecutar la aplicación en Flutter

1. Accede al directorio del proyecto Flutter:
   ```bash
   cd flutter/my_weather_app
   ```
2. Instala las dependencias:
   ```bash
   flutter pub get
   ```
3. Inicia la aplicación en el navegador:
   ```bash
   flutter run -d chrome
   ```
   Para ejecutarlo en Android o iOS, usa:
   ```bash
   flutter run -d android
   ```

---

## 🔄 Endpoints del Backend

| Método | Endpoint         | Parámetros         | Descripción |
|--------|----------------|--------------------|-------------|
| `GET`  | `/weather`     | `?city=Barcelona` | Obtiene el clima de una ciudad |

Ejemplo de llamada:
```bash
curl "http://127.0.0.1:8000/weather?city=Madrid"
```
Respuesta esperada:
```json
{
  "location": {"name": "Madrid", "country": "Spain"},
  "current": {"temperature": 10, "weather_descriptions": ["Soleado"]}
}
```

---

## 📌 Notas adicionales
✅ **El backend** sigue los principios SOLID y está modularizado con FastAPI.  
✅ **El frontend en HTML** es puro HTML, CSS y JavaScript, sin frameworks.  
✅ **El frontend en React** es moderno y modularizado.  
✅ **El frontend en Flutter** es optimizado y responsivo.  
✅ **La API Weatherstack Free** tiene algunas limitaciones (puede bloquear algunas funciones).  

---

🎉 **¡Listo! Ahora puedes visualizar el clima en cualquier versión de frontend!** 🌤️


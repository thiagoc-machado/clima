# Proyecto de Clima - FastAPI + Frontend HTML/CSS/JS

Este proyecto es una aplicación web que muestra el clima de una ciudad utilizando **FastAPI** como backend y una interfaz web con **HTML, CSS y JavaScript**. Por defecto, carga el clima de **Madrid**, pero permite buscar otras ciudades.

## 🚀 Instalación y ejecución local

### 🔧 Requisitos previos

- **Python 3.8+**
- **pip** (administrador de paquetes de Python)
- **FastAPI y dependencias** (listadas en `requirements.txt`)
- **Un navegador web** (para visualizar el frontend)

---

## 📂 Estructura del Proyecto

```
proyecto/
│── app/
│   │── __init__.py
│   │── main.py          # Archivo principal que inicia la aplicación
│   │── config.py        # Configuración y carga de variables de entorno
│   │── routes.py        # Define las rutas del FastAPI
│   │── services.py      # Lógica de solicitud a la API de Weatherstack
│   └── models.py        # Estructura de datos (Opcional)
│── .env                 # Variables de entorno
│── requirements.txt     # Dependencias
│── README.md            # Documentación
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

## 🌐 2️⃣ Ejecutar el frontend (Interfaz web)

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
✅ **El frontend** es puro HTML, CSS y JavaScript, sin frameworks.  
✅ **La API Weatherstack Free** tiene algunas limitaciones (puede bloquear algunas funciones).  

---

🎉 **¡Listo! Ahora puedes visualizar el clima en tu navegador.** 🌤️
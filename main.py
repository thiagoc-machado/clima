import os
import requests
from fastapi import FastAPI
from dotenv import load_dotenv
from fastapi.middleware.cors import CORSMiddleware

# Carrega variáveis do .env
load_dotenv()

# Obtém valores das variáveis de ambiente
WEATHERSTACK_ACCESS = os.getenv('weatherstack_access')
WEATHERSTACK_API = os.getenv('weatherstack_api')

app = FastAPI()

# Configurar CORS para permitir chamadas do frontend (http://127.0.0.1:5500)
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],  # Permitir todas as origens (ou especifique "http://127.0.0.1:5500")
    allow_credentials=True,
    allow_methods=["*"],  # Permitir todos os métodos (GET, POST, etc.)
    allow_headers=["*"],  # Permitir todos os headers
)

@app.get("/weather")
async def weather(city: str= "Madrid"):
    """ Obtém o clima atual de uma cidade via Weatherstack (somente plano Free) """

    url = f"{WEATHERSTACK_API}current"
    params = {
        "access_key": WEATHERSTACK_ACCESS,
        "query": city,
    }
    print (url)

    try:
        response = requests.get(url, params=params, timeout=10)
        response.raise_for_status()
        data = response.json()

        if 'error' in data:
            return {"erro": data['error'].get('info', 'Erro desconhecido')}

        return data

    except requests.exceptions.RequestException as e:
        return {"erro": str(e)}

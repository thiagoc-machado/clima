import requests
from .config import Config

def get_weather(city: str = "Madrid"):
    """ Obtém o clima atual de uma cidade via Weatherstack """

    url = f"{Config.WEATHERSTACK_API}current"
    params = {
        "access_key": Config.WEATHERSTACK_ACCESS,
        "query": city,
    }

    try:
        response = requests.get(url, params=params, timeout=10)
        response.raise_for_status()
        data = response.json()

        if 'error' in data:
            return {"erro": data['error'].get('info', 'Erro desconhecido')}

        return data

    except requests.exceptions.RequestException as e:
        return {"erro": str(e)}

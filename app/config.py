import os
from dotenv import load_dotenv

# Carregar variáveis do .env
load_dotenv()

# Configurações globais
class Config:
    WEATHERSTACK_ACCESS = os.getenv('weatherstack_access')
    WEATHERSTACK_API = os.getenv('weatherstack_api')

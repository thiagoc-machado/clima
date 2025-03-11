from fastapi import APIRouter
from .services import get_weather

router = APIRouter()

@router.get("/weather")
async def weather(city: str = "Madrid"):
    """ Rota para obter o clima de uma cidade """
    return get_weather(city)

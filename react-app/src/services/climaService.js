import axios from 'axios';

const API_URL = "http://127.0.0.1:8000/weather";

export const obtenerClima = async (ciudad = "Madrid") => {
    try {
        const respuesta = await axios.get(`${API_URL}?city=${encodeURIComponent(ciudad)}`);
        if (respuesta.data.erro) {
            throw new Error("Ciudad inválida");
        }
        return respuesta.data;
    } catch (error) {
        return { error: "Ciudad inválida" };
    }
};

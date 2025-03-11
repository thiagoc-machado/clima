import { useState, useEffect } from "react";
import { obtenerClima } from "../services/climaService";
import Buscador from "../components/Buscador";
import ClimaCard from "../components/ClimaCard";

const Home = () => {
    const [clima, setClima] = useState(null);

    useEffect(() => {
        buscarClima("Madrid"); // Carga inicial
    }, []);

    const buscarClima = async (ciudad) => {
        const datos = await obtenerClima(ciudad);
        setClima(datos);
    };

    return (
        <div className="contenedor">
            <h1>Clima en tu Ciudad</h1>
            <Buscador onBuscar={buscarClima} />
            {clima && <ClimaCard clima={clima} />}
        </div>
    );
};

export default Home;

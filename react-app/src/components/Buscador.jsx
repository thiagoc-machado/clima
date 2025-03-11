import { useState } from "react";

const Buscador = ({ onBuscar }) => {
    const [ciudad, setCiudad] = useState("");

    const manejarEnvio = (e) => {
        e.preventDefault();
        if (ciudad.trim()) {
            onBuscar(ciudad);
        }
    };

    return (
        <form onSubmit={manejarEnvio} className="buscador">
            <input
                type="text"
                placeholder="Introduce una ciudad"
                value={ciudad}
                onChange={(e) => setCiudad(e.target.value)}
            />
            <button type="submit">Buscar</button>
        </form>
    );
};

export default Buscador;

const ClimaCard = ({ clima }) => {
    if (!clima || clima.error) {
        return <p className="error">Ciudad inválida</p>;
    }

    return (
        <div className="clima-card">
            <img src={clima.current.weather_icons[0]} alt="Icono del clima" />
            <h2>{clima.location.name}, {clima.location.country}</h2>
            <p className="temperatura">{clima.current.temperature}°C</p>
            <p>{clima.current.weather_descriptions[0]}</p>
            <p>Viento: {clima.current.wind_speed} km/h</p>
            <p>Humedad: {clima.current.humidity}%</p>
        </div>
    );
};

export default ClimaCard;

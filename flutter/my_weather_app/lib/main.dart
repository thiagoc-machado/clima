import 'package:flutter/material.dart';
import 'weather_service.dart';
import 'weather_model.dart';

void main() {
  runApp(WeatherApp());
}

class WeatherApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Clima en tu Ciudad',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.blueGrey[900],
        textTheme: TextTheme(
          bodyLarge: TextStyle(fontSize: 24, color: Colors.white),
        ),
      ),
      home: WeatherScreen(),
    );
  }
}

class WeatherScreen extends StatefulWidget {
  @override
  _WeatherScreenState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  final WeatherService _weatherService = WeatherService();
  Weather? _weather;
  String? _errorMessage;
  TextEditingController _cityController = TextEditingController();
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    _fetchWeather("Madrid"); // Busca el tiempo en Madrid al iniciar la app
  }

  Future<void> _fetchWeather(String city) async {
    setState(() {
      isLoading = true;
      _errorMessage = null; // Resetea el mensaje de error
    });

    final weather = await _weatherService.fetchWeather(city);

    setState(() {
      isLoading = false;
      if (weather == null) {
        _errorMessage = "Ciudad no encontrada";
      } else {
        _weather = weather;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background gradiente
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.blue[700]!, Colors.blue[300]!],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),

          // Contenido central
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Busqueda de Ciudad
                  TextField(
                    controller: _cityController,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.3),
                      hintText: 'Introduce una ciudad',
                      hintStyle: TextStyle(color: Colors.white70),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    style: TextStyle(color: Colors.white, fontSize: 18),
                    onSubmitted: (value) {
                      if (value.isNotEmpty) {
                        _fetchWeather(value);
                      }
                    },
                  ),
                  SizedBox(height: 15),

                  // Button Buscar
                  ElevatedButton(
                    onPressed: () {
                      if (_cityController.text.isNotEmpty) {
                        _fetchWeather(_cityController.text);
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                      backgroundColor: Colors.orange[400],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: Text(
                      "Buscar",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  ),
                  SizedBox(height: 30),

                  // Cargando...
                  if (isLoading) CircularProgressIndicator(color: Colors.white),

                  // Exibir mensaje de error
                  if (_errorMessage != null)
                    Text(
                      _errorMessage!,
                      style: TextStyle(fontSize: 20, color: Colors.redAccent, fontWeight: FontWeight.bold),
                    ),

                  // Exibir datos del tiempo
                  if (_weather != null && _errorMessage == null)
                    Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        children: [
                          Image.network(_weather!.iconUrl, width: 100),
                          SizedBox(height: 10),
                          Text(
                            '${_weather!.temperature}°C',
                            style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold, color: Colors.white),
                          ),
                          Text(
                            _weather!.description,
                            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500, color: Colors.white),
                          ),
                          SizedBox(height: 10),
                          Text(
                            "Ciudad: ${_weather!.city}, ${_weather!.country}",
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          ),
                          Text(
                            "Viento: ${_weather!.windSpeed} km/h",
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          ),
                          Text(
                            "Humedad: ${_weather!.humidity}%",
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

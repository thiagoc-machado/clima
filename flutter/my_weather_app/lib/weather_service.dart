import 'dart:convert';
import 'package:http/http.dart' as http;
import 'weather_model.dart';

class WeatherService {
  static const String baseUrl = "http://127.0.0.1:8000/weather";

  Future<Weather?> fetchWeather(String city) async {
    final response = await http.get(Uri.parse("$baseUrl?city=$city"));

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      if (jsonData.containsKey('erro')) {
        return null; // Retorna null si la ciudad no se encuentra
      }
      return Weather.fromJson(jsonData);
    } else {
      return null;
    }
  }
}

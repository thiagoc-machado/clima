class Weather {
  final String city;
  final String country;
  final String description;
  final String iconUrl;
  final double temperature;
  final double windSpeed;
  final int humidity;

  Weather({
    required this.city,
    required this.country,
    required this.description,
    required this.iconUrl,
    required this.temperature,
    required this.windSpeed,
    required this.humidity,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      city: json['location']['name'],
      country: json['location']['country'],
      description: json['current']['weather_descriptions'][0],
      iconUrl: json['current']['weather_icons'][0],
      temperature: json['current']['temperature'].toDouble(),
      windSpeed: json['current']['wind_speed'].toDouble(),
      humidity: json['current']['humidity'],
    );
  }
}

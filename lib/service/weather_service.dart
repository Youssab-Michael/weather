import 'package:weather/models/weather_model.dart';
import 'package:http/http.dart' as http;

class WeatherService {
  static const BASE_URL = "https://api.openweathermap.org/data/3.0/onecall";
  final String apiKey;

  WeatherService({required this.apiKey});

  // Future<Weather> getWeather(String cityName) async {
  //   final response = await http.get(Uri.parse("$BASE_URL?q=$cityName&appid=$apiKey&units=metric"));
  // }
}
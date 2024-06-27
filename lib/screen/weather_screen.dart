import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:weather/models/weather_model.dart';
import 'package:weather/service/weather_service.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  // apiKey
  final _weatherService =
      WeatherService(apiKey: "a0e9c84bda6c46b4180a2e997727c40c");
  Weather? _weather;

  // Fetch weather
  _fetchWeather() async {
    String cityName = await _weatherService.getCurrentCity();
    try {
      final weather = await _weatherService.getWeather(cityName);
      setState(() {
        _weather = weather;
      });
    } catch (e) {
      print(e);
    }
  }

  String getWeatherAnimation(String? mainCondition) {
    if (mainCondition == null) return "assets/sun.json";

    switch (mainCondition.toLowerCase()) {
      case "clouds":
        return "assets/cloud.json";
      case "snow":
        return "assets/snow.json";
      case "mist":
      case "smoke":
      case "haze":
      case "dust":
      case "fog":
      case "drizzle":
      return "assets/mist.json";
      case "rain":
      case "shower rain":
        return "assets/rain.json";
      case "thunderstorm":
        return "assets/thunder.json";
      case "clear":
        return "assets/sun.json";
      default:
        return "assets/sun.json";
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(_weather?.cityName ?? "loading city..."),
            Lottie.asset(getWeatherAnimation(_weather?.mainCondition)),
            Text("${_weather?.temperature.round()} °C"),
            Text(_weather?.mainCondition ?? ""),
          ],
        ),
      ),
    );
  }
}

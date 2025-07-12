import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:moneycontrol/model/weather.dart';
import 'package:moneycontrol/service/weather_service.dart';

class weather_page extends StatefulWidget{
  @override
  State<weather_page> createState() => _weather_pageState();
}

class _weather_pageState extends State<weather_page> {

  // api key
  final _weatherService = weatherService('c2d413f65fa149dea86e1a7c08aadd71');
  weather? _weather;

  // fetch weather
  _fetchWeather() async {
    String cityName = await _weatherService.getCurrentcity();
    try {
      final weather = await _weatherService.getWeather(cityName);
      setState(() {
        _weather = weather;
      });
    } catch (e) {
      print(e);
    }
  }

  // weather animation
  String getWeatherAnimation(String? mainCondition) {
    if (mainCondition == null) return 'assets/cloud.json';

    switch (mainCondition.toLowerCase()) {
      case 'clouds':
      case 'mist':
      case 'smoke':
      case 'thunderstorm':
        return 'assets/thunderstorm.json';
      case 'cleear':
        return 'assets/sunny.json';
      case 'shower rain':
        return 'assets/rain.json';
      case 'fog':
        return 'assets/cloud.json';
      default:
        return 'assets/sun.json';

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
      backgroundColor: Colors.red[300],
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Weather App',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // city name
            Text(_weather?.cityName ?? "loading city .."),

            // Animation

            Lottie.asset(getWeatherAnimation(_weather?.mainCondition)),

            // Lottie.asset('assets/sun.json'),
            // temperature
            Text('${_weather?.temperature.round()}°C'),

            // weather condition
            Text(_weather?.mainCondition ?? "")
          ]
        ),
      ),
    );
  }
}
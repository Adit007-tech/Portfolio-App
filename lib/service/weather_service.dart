import 'dart:convert';

import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:moneycontrol/model/weather.dart';

class weatherService{
  static const BASE_URL = 'https://openweathermap.org/data/2.5/weather';
  final String apiKey;

  weatherService(this.apiKey);

  Future<weather> getWeather(String cityName) async {
    final response = await http.get(Uri.parse('$BASE_URL?q=$cityName&appid=$apiKey&unit=metric'));

    if(response.statusCode == 200){
      return weather.fromJson(jsonDecode(response.body));
    }else{
      throw Exception('Failed to load weather data');
    }
  }

  Future<String> getCurrentcity() async {
    // get permission to access location
    LocationPermission permission = await Geolocator.checkPermission();
    if(permission == LocationPermission.denied){
      permission = await Geolocator.requestPermission();
    }
    // get current location
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    // convert the location into a list of placemark objects
    List<Placemark> placemarks = await placemarkFromCoordinates(position.latitude, position.longitude);


    // extract the city name from the placemark
    String? cityName = placemarks[0].locality;

    return cityName ?? "";

  }
}
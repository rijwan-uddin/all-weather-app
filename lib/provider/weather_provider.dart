
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../model/weather_model.dart';

class weatherProv extends ChangeNotifier {
  late WeatherModel _weatherV = WeatherModel();

  WeatherModel get weather => _weatherV;

  Future<void> fetchDataFromWeather(String city) async {
    final apiKey = '6d1b70aa32bcff7b1b5c4fa496000b7a';
    final url =
        'https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$apiKey';

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = json.decode(response.body);
        _weatherV = WeatherModel.fromJson(responseData);
        notifyListeners();
      } else {
        throw Exception('Failed to load weather data');
      }
    } catch (error) {
      throw error;
    }
  }
}

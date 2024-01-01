import 'dart:convert';

import 'package:weatherapp/api/apikey.dart';
import 'package:weatherapp/model/weather/daily.dart';
import 'package:weatherapp/model/weather/hourly.dart';
import 'package:weatherapp/model/weather/weather.dart';
import 'package:weatherapp/model/weather_data.dart';
import 'package:http/http.dart' as http;
import 'package:weatherapp/model/weather_data_current.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FetchWeatherAPI {
  WeatherData? weatherData;
  
  Future<WeatherData> processData(lat, lon) async {
    String url = "https://google.com";
    var response = await http.get(Uri.parse(apiURL(lat, lon)));
    var jsonString = jsonDecode(response.body);
    // print(Daily.fromJson(jsonString).runtimeType);
    weatherData = WeatherData(WeatherDataCurrent.fromJson(jsonString),
        List<Daily>.from(jsonString['daily'].map((e) => Daily.fromJson(e))),List<Hourly>.from(jsonString['hourly'].map((e)=>Hourly.fromJson(e))));
    // print(jsonString["daily"].runtimeType);
  
    return weatherData!;
  }
}

String apiURL(var lat, var lon) {
  return "https://api.openweathermap.org/data/3.0/onecall?lat=$lat&lon=$lon&appid=$ApiKey&units=metric";
}

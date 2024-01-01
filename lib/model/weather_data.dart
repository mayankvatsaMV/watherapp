import 'package:weatherapp/model/weather/daily.dart';
import 'package:weatherapp/model/weather/hourly.dart';
import 'package:weatherapp/model/weather_data_current.dart';

class WeatherData{
   WeatherDataCurrent? current;
   List<Daily>? weatherDataDaily;
   List<Hourly>? weatherDatahourly;
  WeatherData([this.current,this.weatherDataDaily,this.weatherDatahourly]);
  List<Daily>? getWeatherDataDaily(){
    return weatherDataDaily;
  }
}
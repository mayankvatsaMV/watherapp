import '../model/weather/weather.dart';

class WeatherDataCurrent {
  Current current;
  WeatherDataCurrent({required this.current});
  factory WeatherDataCurrent.fromJson(Map<String, dynamic> json) {
    // print(json.runtimeType);
    // print("hello");
    // print(json["current"]);
    // print("json"+json.runtimeType.toString());
    // print("json current"+json['current'].runtimeType.toString());
    return WeatherDataCurrent(current: Current.fromJson(json['current']));
  }
}

class Current {
  double? temp;
  int? humidity;
  int? clouds;
  
  double? windSpeed;
  List<Weather>? weather;
  double? uvi;

  Current({
    this.temp,
    this.humidity,
    this.clouds,
    this.windSpeed,
    this.weather,
    this.uvi, 
  });

  factory Current.fromJson(Map<String, dynamic> json) => Current(
        temp: (json['temp'] as num?)?.toDouble(),
        humidity: json['humidity'] as int?,
        clouds: json['clouds'] as int?,
        uvi: (json['uvi'] as num?)?.toDouble(),
        windSpeed: (json['wind_speed'] as num?)?.toDouble(),
        weather: (json['weather'] as List<dynamic>?)
            ?.map((e) => Weather.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'temp': temp,
        'humidity': humidity,
        'clouds': clouds,
        'wind_speed': windSpeed,
        'weather': weather?.map((e) => e.toJson()).toList(),
      };
}

// import 'feels_like.dart';
// import 'temp.dart';
// import 'weather.dart';

// class Daily {
//   int? dt;
//   int? sunrise;
//   int? sunset;
//   int? moonrise;
//   int? moonset;
//   double? moonPhase;
//   String? summary;
//   Temp? temp;
//   FeelsLike? feelsLike;
//   int? pressure;
//   int? humidity;
//   double? dewPoint;
//   double? windSpeed;
//   int? windDeg;
//   double? windGust;
//   List<Weather>? weather;
//   int? clouds;
//   int? pop;
//   double? uvi;
//   double? rain;

//   Daily({
//     this.dt,
//     this.sunrise,
//     this.sunset,
//     this.moonrise,
//     this.moonset,
//     this.moonPhase,
//     this.summary,
//     this.temp,
//     this.feelsLike,
//     this.pressure,
//     this.humidity,
//     this.dewPoint,
//     this.windSpeed,
//     this.windDeg,
//     this.windGust,
//     this.weather,
//     this.clouds,
//     this.pop,
//     this.uvi,
//     this.rain,
//   });

//   factory Daily.fromJson(Map<String, dynamic> json) {
//     json=json["daily"];
//     print(json);
//     return Daily(
//       dt: json['dt'] as int?,
//       sunrise: json['sunrise'] as int?,
//       sunset: json['sunset'] as int?,
//       moonrise: json['moonrise'] as int?,
//       moonset: json['moonset'] as int?,
//       moonPhase: (json['moon_phase'] as num?)?.toDouble(),
//       summary: json['summary'] as String?,
//       temp: json['temp'] == null
//           ? null
//           : Temp.fromJson(json['temp'] as Map<String, dynamic>),
//       feelsLike: json['feels_like'] == null
//           ? null
//           : FeelsLike.fromJson(json['feels_like'] as Map<String, dynamic>),
//       pressure: json['pressure'] as int?,
//       humidity: json['humidity'] as int?,
//       dewPoint: (json['dew_point'] as num?)?.toDouble(),
//       windSpeed: (json['wind_speed'] as num?)?.toDouble(),
//       windDeg: json['wind_deg'] as int?,
//       windGust: (json['wind_gust'] as num?)?.toDouble(),
//       weather: (json['weather'] as List<dynamic>?)
//           ?.map((e) => Weather.fromJson(e as Map<String, dynamic>))
//           .toList(),
//       clouds: json['clouds'] as int?,
//       pop: json['pop'] as int?,
//       uvi: (json['uvi'] as num?)?.toDouble(),
//       rain: (json['rain'] as num?)?.toDouble(),
//     );
//   }

//   Map<String, dynamic> toJson() => {
//         'dt': dt,
//         'sunrise': sunrise,
//         'sunset': sunset,
//         'moonrise': moonrise,
//         'moonset': moonset,
//         'moon_phase': moonPhase,
//         'summary': summary,
//         'temp': temp?.toJson(),
//         'feels_like': feelsLike?.toJson(),
//         'pressure': pressure,
//         'humidity': humidity,
//         'dew_point': dewPoint,
//         'wind_speed': windSpeed,
//         'wind_deg': windDeg,
//         'wind_gust': windGust,
//         'weather': weather?.map((e) => e.toJson()).toList(),
//         'clouds': clouds,
//         'pop': pop,
//         'uvi': uvi,
//         'rain': rain,
//       };
// }

import 'package:weatherapp/model/weather/feels_like.dart';
import 'package:weatherapp/model/weather/temp.dart';
import 'package:weatherapp/model/weather/weather.dart';

class Daily {
  int? dt;
  int? sunrise;
  int? sunset;
  int? moonrise;
  int? moonset;
  double? moonPhase;
  String? summary;
  Temp? temp;
  FeelsLike? feelsLike;
  int? pressure;
  int? humidity;
  double? dewPoint;
  double? windSpeed;
  int? windDeg;
  double? windGust;
  List<Weather>? weather;
  int? clouds;
  // int? pop;
  double? uvi;
  double? rain;

  Daily({
    this.dt,
    this.sunrise,
    this.sunset,
    this.moonrise,
    this.moonset,
    this.moonPhase,
    this.summary,
    this.temp,
    this.feelsLike,
    this.pressure,
    this.humidity,
    this.dewPoint,
    this.windSpeed,
    this.windDeg,
    this.windGust,
    this.weather,
    this.clouds,
    // this.pop,
    this.uvi,
    this.rain,
  });

  factory Daily.fromJson(Map<String, dynamic> json) {
    // print("json "+json.runtimeType.toString());
    // print("json daily"+json['daily'].runtimeType.toString());
    // print((json));
    // print("\n");
    // print(json['daily']);
    // print("\n");
    // print(json["daily"]);

    return Daily(
      dt: json['dt'] as int?,
      sunrise: json['sunrise'] as int?,
      sunset: json['sunset'] as int?,
      moonrise: json['moonrise'] as int?,
      moonset: json['moonset'] as int?,
      moonPhase: (json['moon_phase'] as num?)?.toDouble(),
      summary: json['summary'] as String?,
      temp: json['temp'] == null
      		? null
      		: Temp.fromJson(json['temp'] as Map<String, dynamic>),
      feelsLike: json['feels_like'] == null
      		? null
      		: FeelsLike.fromJson(json['feels_like'] as Map<String, dynamic>),
      pressure: json['pressure'] as int?,
      humidity: json['humidity'] as int?,
      dewPoint: (json['dew_point'] as num?)?.toDouble(),
      windSpeed: (json['wind_speed'] as num?)?.toDouble(),
      windDeg: json['wind_deg'] as int?,
      windGust: (json['wind_gust'] as num?)?.toDouble(),
      weather: (json['weather'] as List<dynamic>?)
          ?.map((e) => Weather.fromJson(e as Map<String, dynamic>))
          .toList(),
      clouds: json['clouds'] as int?,
      // pop: json['pop'] as int?,
      uvi: (json['uvi'] as num?)?.toDouble(),
      rain: (json['rain'] as num?)?.toDouble(),
    );
  }

  Map<String, dynamic> toJson() => {
        'dt': dt,
        'sunrise': sunrise,
        'sunset': sunset,
        'moonrise': moonrise,
        'moonset': moonset,
        'moon_phase': moonPhase,
        'summary': summary,
        // 'temp': temp?.toJson(),
        // 'feels_like': feelsLike?.toJson(),
        'pressure': pressure,
        'humidity': humidity,
        'dew_point': dewPoint,
        'wind_speed': windSpeed,
        'wind_deg': windDeg,
        'wind_gust': windGust,
        'weather': weather?.map((e) => e.toJson()).toList(),
        'clouds': clouds,
        // 'pop': pop,S
        'uvi': uvi,
        'rain': rain,
      };
}

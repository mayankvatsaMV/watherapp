
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:weatherapp/model/weather/weather.dart';
// import 'package:weatherapp/model/weather/daily.dart';
import 'package:weatherapp/model/weather_data.dart';
 import 'package:date_format/date_format.dart';
import 'package:intl/intl.dart';
class TodayWidget extends StatefulWidget {
  final WeatherData weatherData;
  const TodayWidget({super.key, required this.weatherData});
  @override
  State<TodayWidget> createState() => _TodayWidgetState();
}

class _TodayWidgetState extends State<TodayWidget> {
  getTime(int timeStamp){
    DateTime datetime=DateTime.fromMillisecondsSinceEpoch(timeStamp*1000);
    String x=DateFormat("jm").format(datetime);
    return x;
  }
  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      print("hello");
    }
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Text(
          "Today",
          style: TextStyle(color: Colors.black, fontSize: 20,fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 5
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.20,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 24,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(left:20,),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 237, 237, 237),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        getTime(widget.weatherData.weatherDatahourly![index].dt!),
                        style: const TextStyle(color: Colors.black),
                      ),
                      Image.asset(
                        "assets/weather/${widget.weatherData.weatherDatahourly![index].weather![0].icon}.png",
                        height: MediaQuery.of(context).size.height * 0.10,
                      ),
                      Text(
                          "${widget.weatherData.weatherDatahourly![index].temp}°C",
                          style: const TextStyle(color: Colors.black)),
                    ],
                  ),
                  onPressed: () {},
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

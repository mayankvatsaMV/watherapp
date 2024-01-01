import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:weatherapp/model/weather_data.dart';
import 'package:weatherapp/model/weather_data_current.dart';

class CurrentWeatherWidget extends StatelessWidget {
  final WeatherData weatherDataCurrent;

  const CurrentWeatherWidget({super.key, required this.weatherDataCurrent});
  Widget build(BuildContext context) {
    Color? bgColor;
    String? s = weatherDataCurrent.current!.current.weather![0].icon;
    if (s![2] == "n") {
      bgColor = const Color.fromARGB(255, 33, 33, 33);
    }
    return SafeArea(
      child: Container(
        padding: EdgeInsets.only(top: 10,left: 10,right: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                    "assets/weather/${weatherDataCurrent.current!.current.weather![0].icon.toString()}.png"),
                const Expanded(
                    flex: 2,
                    child: SizedBox(
                      width: 10,
                    )),
                Text(
                  "${weatherDataCurrent.current!.current.temp!.toInt()}°",
                  style: const TextStyle(
                      fontSize: 50,
                      color: Color.fromARGB(255, 0, 0, 0),
                      height: 2,
                      fontWeight: FontWeight.bold),
                ),
                Expanded(
                  child: SizedBox(
                    width: 20,
                    height: 50,
                    // color: Colors.red,
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Text(weatherDataCurrent
                          .current!.current.weather![0].description
                          .toString()),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              height: MediaQuery.of(context).size.width*0.40,
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Card(
                        color: Color.fromARGB(255, 237, 237, 237),
                        child: Image.asset('assets/icons/clouds.png',
                            width: MediaQuery.of(context).size.width * 0.25),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(weatherDataCurrent.current!.current.clouds
                              .toString() +
                          "%"),
                    ],
                  ),
                  Column(
                    children: [
                      Card(
                        color: Color.fromARGB(255, 237, 237, 237),
                        child: Image.asset('assets/icons/humidity.png',
                            width: MediaQuery.of(context).size.width * 0.25),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(weatherDataCurrent.current!.current.humidity
                              .toString() +
                          "%"),
                    ],
                  ),
                  Column(
                    children: [
                      Card(
                        color: Color.fromARGB(255, 237, 237, 237),
                        child: Image.asset('assets/icons/windspeed.png',
                            width: MediaQuery.of(context).size.width * 0.25),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(weatherDataCurrent.current!.current.windSpeed
                              .toString() +
                          "Km/h"),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

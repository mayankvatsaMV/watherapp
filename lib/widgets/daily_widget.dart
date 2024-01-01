import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weatherapp/model/weather_data.dart';

class DailyWidget extends StatelessWidget {
  final WeatherData? weatherData;
  const DailyWidget({super.key, required this.weatherData});
  @override
  Widget build(BuildContext context) {
    getTime(int timeStamp) {
      DateTime datetime = DateTime.fromMillisecondsSinceEpoch(timeStamp * 1000);
      String formattedDate = DateFormat("dd:MM:yy").format(datetime);
      return formattedDate;
    }

    return Column(
      children: [
        const Text(
          "Daily Forcast",
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 20,left: 20),
          child: Column(
            // width: double.infinity,
            children: weatherData!.weatherDataDaily!.map((e) {
              return SizedBox(

                // color: Colors.red,
                width: double.infinity,
                // padding: EdgeInsets.only(bottom: 0),
                child: TextButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 237, 237, 237),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        getTime(e.dt!),
                        style: const TextStyle(color: Colors.black),
                      ),
                      const Expanded(
                        child: SizedBox(
                          width: 20,
                        ),
                      ),
                      SizedBox(
                        // color: Colors.red,
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image.asset(
                              "assets/weather/${e.weather![0].icon}.png",
                              width: MediaQuery.of(context).size.width * 0.09,
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Expanded(
                              child: Text(
                                e.weather![0].description!,
                                style: const TextStyle(color: Colors.black),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                softWrap: true,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  onPressed: () {},
                ),
              );
            }).toList(),
          ),
        )
      ],
    );
  }
}

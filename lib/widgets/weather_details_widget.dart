import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import 'package:weatherapp/controller/global_controller.dart';

import '../model/weather_data.dart';

class WeatherDetails extends StatelessWidget {
  final WeatherData weatherData;
  WeatherDetails({super.key, required this.weatherData});
  @override
  Widget build(BuildContext context) {

    return Center(
      child: Column(
        children: [
          Text(
            "Comfort Levels",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 5,
          ),
          Container(
            height: 150,
            child: SleekCircularSlider(
              appearance: CircularSliderAppearance(),
              min: 0,
              max: 100,
              initialValue:weatherData!.current!.current.humidity!
                  .toDouble(),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("UV Index " +weatherData!.current!.current.uvi
                      .toString())
            ],
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}

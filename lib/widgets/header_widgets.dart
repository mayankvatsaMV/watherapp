import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';

import '../controller/global_controller.dart';
import '../model/weather_data.dart';

class HeaderWidget extends StatefulWidget {
  @override
  State<HeaderWidget> createState() => _HeaderWidgetState();
  HeaderWidget({required this.globalController});
  GlobalController globalController;
}

class _HeaderWidgetState extends State<HeaderWidget> {
  String city = "";
  DateTime currentDateTime = DateTime.now();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAddress(widget.globalController.getLatitude().value,
        widget.globalController.getLongitude().value);
  }

  getAddress(lat, long) async {
    List<Placemark> placemark = await placemarkFromCoordinates(lat, long);
    // print(placemark[0]);
    setState(() {
      city = placemark[0].locality!;
    });
    // print(city);
    List<Location> loc;
    loc = await locationFromAddress("Kolkata");
    // print(loc[0].latitude);
    // print(loc[0].longitude);
    // globalController.SetName(city);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(left: 20, right: 20),
          alignment: Alignment.topLeft,
          child: Text(
            city,
            style: TextStyle(fontSize: 35, color: Colors.grey[700], height: 2),
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 20, right: 20),
          alignment: Alignment.topLeft,
          child: Text(
            "${currentDateTime.day}/${currentDateTime.month}/${currentDateTime.year}",
            style: TextStyle(
              fontSize: 18,
              color: Colors.grey[700],
            ),
          ),
        ),
      ],
    );
  }
}

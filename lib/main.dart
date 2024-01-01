import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weatherapp/screens/homescreen.dart';

import 'controller/global_controller.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Future<SharedPreferences> prefs = SharedPreferences.getInstance();
  MyApp({super.key});
  final GlobalController globalController =
      Get.put(GlobalController(), permanent: true);
      List<String> mt=["Motihari","Kolkata","Delhi"];
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var jsn=jsonEncode(mt);
    // prefs.setString(profileKey, profilejson);
    print(jsn);

    return GetMaterialApp(
      home: HomeScreen(globalController: globalController),
      title: "Weather",
      debugShowCheckedModeBanner: false,
    );
  }
}

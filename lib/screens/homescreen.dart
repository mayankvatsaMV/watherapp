import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:weatherapp/widgets/current_weather_widget.dart';
import 'package:weatherapp/widgets/daily_widget.dart';
import 'package:weatherapp/widgets/header_widgets.dart';
import 'package:weatherapp/widgets/weather_details_widget.dart';
import '../controller/global_controller.dart';
import '../widgets/hourly_widget.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
  HomeScreen({super.key, required this.globalController});
  GlobalController globalController;
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
  }

  @override
  Widget build(BuildContext context) {
    double percentage = 0.0;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title:Text("Weather",style: TextStyle(fontSize: 20),),
       backgroundColor: Color.fromARGB(255, 130, 139, 241),
       actions: [
        InkWell(
          child: Icon(Icons.location_city),
          onTap: (){
            print("hello");
          },
        ),
        SizedBox(width: 10,),
       ],
      ),
      // backgroundColor: Colors.black,
      body: SafeArea(
        child: Obx(
          () => widget.globalController.checkLoading().isTrue
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              // : CustomScrollView(
              //     slivers: <Widget>[
              //       SliverAppBar(
              //         backgroundColor: Color.fromARGB(255, 130, 139, 241),
              //         elevation: 0,
              //         expandedHeight: 100.0,
              //         floating: false,
              //         pinned: true,
              //         flexibleSpace: LayoutBuilder(
              //           builder:
              //               (BuildContext context, BoxConstraints constraints) {
              //             percentage =
              //                 ((constraints.maxHeight - kToolbarHeight) /
              //                         (100 - kToolbarHeight))
              //                     .clamp(0.0, 1.0);
              //             CurvedAnimation curvedAnimation = CurvedAnimation(
              //               parent:
              //                   animationController, // Assuming you have an AnimationController
              //               curve: Curves.easeInOut,
              //             );
              //             double titleLeftPadding =
              //                 Tween<double>(begin: -0.8, end: -0)
              //                     .transform(percentage);
              //             // double titleLeftPadding =
              //             //     Tween<double>(begin: -1, end: 0)
              //             //         .animate(curvedAnimation)
              //             //         .value;
              //             return Stack(
              //               children: [
              //                 FlexibleSpaceBar(
              //                   title: Align(
              //                     alignment: Alignment(
              //                         titleLeftPadding, percentage / 2),
              //                     child: Text(
              //                       "Weather",
              //                       style: TextStyle(color: Colors.white),
              //                     ),
              //                   ),
              //                   centerTitle: true,
              //                   background: Container(
              //                       // Your flexible space content goes here
              //                       ),
              //                 ),
              //               ],
              //             );
              //           },
              //         ),
              //       ),
              //       SliverList.list(children: [
              //         const SizedBox(
              //           height: 30,
              //         ),
              //         HeaderWidget(globalController: widget.globalController,),
              //         CurrentWeatherWidget(
              //           weatherDataCurrent: widget.globalController.GetWeatherDat(),
              //         ),
              //         TodayWidget(
              //           weatherData: widget.globalController.GetWeatherDat(),
              //         ),
              //         DailyWidget(
              //           weatherData: widget.globalController.GetWeatherDat(),
              //         ),
              //         WeatherDetails(weatherData: widget.globalController.GetWeatherDat()),
              //       ])
              //     ],
              //   ),
              : ListView(
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    HeaderWidget(
                      globalController: widget.globalController,
                    ),
                    CurrentWeatherWidget(
                      weatherDataCurrent:
                          widget.globalController.GetWeatherDat(),
                    ),
                    TodayWidget(
                      weatherData: widget.globalController.GetWeatherDat(),
                    ),
                    DailyWidget(
                      weatherData: widget.globalController.GetWeatherDat(),
                    ),
                    WeatherDetails(
                        weatherData: widget.globalController.GetWeatherDat()),
                  ],
                ),
        ),
      ),
    );
  }
}

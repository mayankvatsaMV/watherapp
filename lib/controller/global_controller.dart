import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:weatherapp/api/fetch_weather.dart';
import 'package:weatherapp/model/weather/current.dart';
import 'package:weatherapp/model/weather/weather.dart';
import 'package:weatherapp/model/weather_data.dart';

class GlobalController extends GetxController {
  //create valious variable

  final RxBool _isLoading = true.obs;
  final RxDouble _latitude = 0.0.obs;
  final RxDouble _longitude = 0.0.obs;
  final RxString _name="".obs;

  var weatherData=WeatherData().obs;
  //create instance for them to be called
  RxBool checkLoading() {
    return _isLoading;
  }

  RxDouble getLatitude() {
    return _latitude;
  }
  void setLatitude(double lat){
     _latitude.value=lat;
  }
  void setLongitude(double long){
     _longitude.value=long;
  }

  RxDouble getLongitude() {
    return _longitude;
  }
  void SetName(String n){
   _name.value=n;
  }
  RxString getName(){
    return _name;
  }

  GetWeatherDat() {
    print("temp is " + weatherData.value.current!.current.temp.toString());
    print("daily"+weatherData.value.weatherDataDaily![0].temp!.day.toString());
    return weatherData.value;
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    if (_isLoading.isTrue) getLocation();
  }

  getLocation() async {
    bool isServiceEnabled;
    LocationPermission locationPermission;
    isServiceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!isServiceEnabled) {
      return Future.error("Not enabled");
    }
    Geolocator.requestPermission();
    locationPermission = await Geolocator.checkPermission();
    if (locationPermission == LocationPermission.deniedForever) {
      return Future.error("service denied forever");
    } else if (locationPermission == LocationPermission.denied) {
      return Future.error("service denied forever");
    }
    return await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.high)
        .then((value) {
      _latitude.value = value.latitude;
      _longitude.value = value.longitude;
      print(_latitude);
      print(_longitude);
       FetchWeatherAPI()
          .processData(value.latitude, value.longitude)
          .then((value) {
        weatherData.value = value;
        _isLoading.value = false;
        // print("temp is " + weatherData.value.current!.current.temp.toString());
      });
    });
  }
}

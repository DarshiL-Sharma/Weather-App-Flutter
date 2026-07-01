import 'package:flutter/material.dart';
import 'package:clima/services/weather.dart'; // FIX: replaced the two broken imports below with this single correct one
import 'location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

// REMOVED: import 'package:clima/services/weather.dart%20';  -> had a stray "%20" (space) breaking the path
// REMOVED: import 'services/wea';                              -> incomplete filename + wrong relative path

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double? latitude;
  double? longitude;

  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
    var weatherData = await WeatherModel().getLocationWeather();
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen(locationWeather: weatherData,);
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: SpinKitDoubleBounce(
            color: Colors.white,
            size: 100.0,
          ),
        )
    );
  }
}
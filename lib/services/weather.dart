import 'package:clima/services/networking.dart';
import '../services/location.dart';


const apikey = '1a43a3c50c67bc3b5fb0ed20449bf67e';
const openWeatherMapURL = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  Future<dynamic> getCityWeather(String cityName) async {

    var url = '$openWeatherMapURL?q=$cityName&appid=$apikey&units=metric';
    NetworkHelper networkHelper = NetworkHelper(url);

    var weatherData = networkHelper.getData();
    return weatherData;
  }

  Future<dynamic> getLocationWeather()async{
    Location location = Location();
    await location.getLocation();

    NetworkHelper networkHelper = NetworkHelper
      ('$openWeatherMapURL?lat=${location.latitude}&lon=${location.longitude}&appid=$apikey&units=metric');

    var weatherData = await networkHelper.getData();
    return weatherData;

  }



  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 30) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }


  String getWeatherImage(int condition) {
    if (condition >= 200 && condition < 300) {
      return 'images/thunderstorm.jpg';
    } else if (condition >= 300 && condition < 600) {
      return 'images/rainy.jpg';
    } else if (condition >= 600 && condition < 700) {
      return 'images/snow.jpg';
    } else if (condition >= 700 && condition < 800) {
      return 'images/foggy.jpg';
    } else if (condition == 800) {
      return 'images/sunny.jpg';
    } else if (condition > 800 && condition <= 804) {
      return 'images/cloudy.jpg';
    } else {
      return 'images/spring.jpg';
    }
  }
  }
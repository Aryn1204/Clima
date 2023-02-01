import 'dart:html';

import 'package:clima/location_brain.dart';
import 'package:clima/services/networking.dart';

const apiKey='fb6d8f95f5699652e4f6a1b6f64394d3';

class WeatherModel {


  Future<dynamic> cityWeather(String cityName) async {
    var url='https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$apiKey&units=metric';
    NetworkHelper networkHelper=NetworkHelper(url);
    var weatherData= await networkHelper.getData();
    return weatherData;
  }

  Future<dynamic> weatherLocation() async {
    LocationBrain locator = LocationBrain();
    await locator.getLocation();
    NetworkHelper networkHelper = NetworkHelper(
        'https://api.openweathermap.org/data/2.5/weather?lat=${locator.latitude}&lon=${locator.longitude}&appid=$apiKey&units=metric');
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
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}

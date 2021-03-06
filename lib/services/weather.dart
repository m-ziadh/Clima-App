import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

const String apiKey = '75684447dff0d6b4491d31e934c43940';
const String link = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {

  Future<dynamic> getCityData(dynamic city) async {
    NetworkHelp nh = NetworkHelp(
        '$link?q=$city&appid=$apiKey&units=metric');
    var result = await nh.getData();
    return result;
  }

  Future<dynamic> getData() async {
    Location lc = Location();
    await lc.getCurrentLocation();
    NetworkHelp nh = NetworkHelp(
        '$link?lat=${lc.lat}&lon=${lc.lon}&appid=$apiKey&units=metric');
    var result = await nh.getData();
    return result;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '๐ฉ';
    } else if (condition < 400) {
      return '๐ง';
    } else if (condition < 600) {
      return 'โ๏ธ';
    } else if (condition < 700) {
      return 'โ๏ธ';
    } else if (condition < 800) {
      return '๐ซ';
    } else if (condition == 800) {
      return 'โ๏ธ';
    } else if (condition <= 804) {
      return 'โ๏ธ';
    } else {
      return '๐คทโ';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s ๐ฆ time';
    } else if (temp > 20) {
      return 'Time for shorts and ๐';
    } else if (temp < 10) {
      return 'You\'ll need ๐งฃ and ๐งค';
    } else {
      return 'Bring a ๐งฅ just in case';
    }
  }
}

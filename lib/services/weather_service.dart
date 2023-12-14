import 'dart:convert';
import 'dart:ffi';

import 'package:http/http.dart' as http;
import 'package:weather_app/models/weather_model.dart';
String baseurl = 'http://api.weatherapi.com/v1';
String apiKEY = '9eb5222276ee41a3973125733230207';
class WeatherService {
  Future<WeatherModel> getWeather({required String cityName}) async {

    Uri url =
        Uri.parse('$baseurl/forecast.json?key=$apiKEY&q=$cityName&days=7');
    http.Response response = await http.get(url);
    Map<String, dynamic> data = jsonDecode(response.body);


    WeatherModel weather = WeatherModel.fromJson(data);
    return weather;
  }
}

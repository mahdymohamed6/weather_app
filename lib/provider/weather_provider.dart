import 'package:flutter/cupertino.dart';
import 'package:weather_app/models/weather_model.dart';

class weatherProvider extends ChangeNotifier{

WeatherModel? _weatherData;
String? ciityName;
set weatherData(WeatherModel? weather){

  _weatherData= weather;
  notifyListeners();
}
WeatherModel? get weatherData => _weatherData;
}
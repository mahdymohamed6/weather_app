import 'package:flutter/material.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/pages/home_page.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/provider/weather_provider.dart';
void main() {
  runApp(WeatherApp());
}
class WeatherApp extends StatelessWidget {
   WeatherApp({ Key? key }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context){

        return weatherProvider();

      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage(),

      ),
    );
  }
}
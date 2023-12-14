import 'package:flutter/material.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/provider/city_provider.dart';
import 'package:weather_app/provider/weather_provider.dart';
import 'package:weather_app/services/weather_service.dart';
import 'package:provider/provider.dart';
class searchpage extends StatelessWidget {
String? CityName;
searchpage({this.updateui});
VoidCallback? updateui;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search City'),
      ),

   body: Center(
     child: Padding(
       padding: const EdgeInsets.symmetric(horizontal: 16),
       child: TextField(

         onSubmitted: (data) async{

          CityName=data;
          WeatherService service=WeatherService();
         WeatherModel weather=await service.getWeather(cityName: CityName!);
          Provider.of<weatherProvider>(context,listen: false).weatherData=weather;
         Provider.of<weatherProvider>(context,listen: false).ciityName=CityName;
          Navigator.pop(context);
          }
          ,

    decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 32,horizontal: 24),

          label: Text('search',),
          suffixIcon: Icon(Icons.search),
        hintText: 'Enter the city',
          border:OutlineInputBorder() ,

    ),
       ),
     ),
   )

    );
  }
}

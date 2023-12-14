import 'package:flutter/material.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/pages/search_page.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/provider/city_provider.dart';
import 'package:weather_app/provider/weather_provider.dart';

class HomePage extends StatefulWidget {
   HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();


}

class _HomePageState extends State<HomePage> {
  void updateui(){

    setState((){


    });


  }
WeatherModel? weatherData;
  @override
  Widget build(BuildContext context) {
    weatherData=Provider.of<weatherProvider>(context).weatherData;
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: (){

            Navigator.push(context, MaterialPageRoute(builder: (context){
              return searchpage(updateui:updateui ,);


            })
            );


          }, icon:Icon(Icons.search))
        ],
        title: Text('Weather App'),
      ),
      body:weatherData==null
          ?Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'there is no weather  start',
              style: TextStyle(
                fontSize: 30,
              ),
            ),
            Text(
              'searching now 🔍',
              style: TextStyle(
                fontSize: 30,
              ),
            )
          ],
        ),
      )
          :Container(
        color: Colors.orange,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            const  Spacer(flex: 3,),
            Text(Provider.of<weatherProvider>(context).ciityName!,
            style: TextStyle(
              fontSize: 35,
              fontWeight:FontWeight.w700 ,
            ),),
            const Spacer(),
            Text(weatherData!.date.toString(),
              style: TextStyle(
              fontSize: 22,

            ),),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [

                Image.asset('assets/images/clear.png'),
                Text(weatherData!.temp.toInt().toString(),
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight:FontWeight.w700 ,
                  ),),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('max:${weatherData!.maxTemp.toInt()}',
                    style: TextStyle(
                      fontSize: 19,

                    ),),
                  Text('min:${weatherData!.minTemp.toInt()}',
                    style: TextStyle(
                      fontSize: 19,

                    ),),
                ],
              )
              ],
            ),
            const Spacer(),
            Text(weatherData?.weatherStateName ?? '',
              style: TextStyle(
                fontSize: 35,
                fontWeight:FontWeight.w700 ,
              ),),
            const Spacer(flex: 5,),



          ],
        ),
      ),
    );
  }
}

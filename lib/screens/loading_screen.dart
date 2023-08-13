
import 'package:clima/screens/location_screen.dart';
import 'package:clima/services/networking.dart';
import 'package:flutter/material.dart';
import 'package:clima/services/location.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


const apikey = 'bdf0d2eab851375d63e7d9c8886ce04a';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getLocationData();
  }
  void getLocationData() async{

    Location location = Location();
    await location.getCurrentLocation();

    NetworkHelper networkHelper = NetworkHelper('https://api.openweathermap.org/data/2.5/weather?lat=${location.lattitude}&lon=${location.longitude}&appid=$apikey&units=metric');

    var whetherData = await networkHelper.getData();

    Navigator.push(context as BuildContext,  MaterialPageRoute(builder: (context){
      return LocationScreen(whetherData);

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
      ),

    );
  }
}
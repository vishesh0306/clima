
import 'package:clima/screens/location_screen.dart';
import 'package:clima/services/networking.dart';
import 'package:flutter/material.dart';
import 'package:clima/services/location.dart';


const apikey = 'bdf0d2eab851375d63e7d9c8886ce04a';

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
  void getLocationData() async{

    Location location = Location();
    await location.getCurrentLocation();
    latitude = location.lattitude;
    longitude = location.longitude;

    NetworkHelper networkHelper = NetworkHelper('https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apikey');

    var whetherData = await networkHelper.getData();

    Navigator.push(context as BuildContext,  MaterialPageRoute(builder: (context){
      return LocationScreen();

    }));

  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          onPressed: () {
            getLocationData();
          },
          child: Text('Get Location'),
        ),
      ),
    );
  }
}
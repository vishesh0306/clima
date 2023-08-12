import 'dart:convert';

import 'package:flutter/material.dart';
import 'location.dart';
import 'package:http/http.dart' as http;

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
    getLocation();
  }
  void getLocation() async{

    Location location = Location();
    await location.getCurrentLocation();
    latitude = location.lattitude;
    longitude = location.longitude;

    getData();
  }

  void getData() async{

    String urlString ='https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apikey';
    Uri url = Uri.parse(urlString);

    http.Response response = await http.get(url);

    if (response.statusCode == 200){
      String data = response.body;

      var decodeData = jsonDecode(data);

      double temperature = decodeData['main']['temp'];
      int condition = decodeData['weather'][0]['id'];
      String CityName = decodeData['name'];

      print(temperature);
      print(condition);
      print(CityName);
    }
    else{
      print(response.statusCode);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          onPressed: () {
            getLocation();
          },
          child: Text('Get Location'),
        ),
      ),
    );
  }
}
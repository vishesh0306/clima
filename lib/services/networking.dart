import 'dart:convert';
import 'package:http/http.dart' as http;

class NetworkHelper{

  NetworkHelper(this.url);
  final String url;

  void getData() async{

    String urlString ='https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apikey';
    Uri url = Uri.parse(urlString);

    http.Response response = await http.get(url);

    if (response.statusCode == 200){
      String data = response.body;

      var decodeData = jsonDecode(data);
  }
    else{
      print(response.statusCode);
    }

}
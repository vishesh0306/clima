import 'dart:convert';
import 'package:http/http.dart' as http;

class NetworkHelper {

  NetworkHelper(this.url);

  final String url;

  Future getData() async {
    String urlString = this.url;
    Uri url = Uri.parse(urlString);

    http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      String data = response.body;

      return jsonDecode(data);
    }
    else {
      print(response.statusCode);
    }
  }
}
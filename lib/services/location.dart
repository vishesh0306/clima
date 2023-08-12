import 'package:geolocator/geolocator.dart';

class Location {
  double? lattitude;
  double? longitude;

  Future<void> getCurrentLocation() async {

    await Geolocator.requestPermission();
    await Geolocator.checkPermission();
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);

      lattitude = position.latitude;
      longitude = position.longitude;
    }
    catch (e) {
      print(e);
    }
  }
}
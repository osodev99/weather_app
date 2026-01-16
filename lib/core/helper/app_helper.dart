import 'package:geolocator/geolocator.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../di/injection_container.dart';

abstract class AppHelper {
  static Future<bool> getLocation() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return false;
      }
    }

    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
    sl.get<SharedPreferences>().setDouble('latitude', position.latitude);
    sl.get<SharedPreferences>().setDouble('longitude', position.longitude);
    return true;
  }
}

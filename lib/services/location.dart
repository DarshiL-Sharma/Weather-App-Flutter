import 'package:geolocator/geolocator.dart';

class Location {
  double? latitude;   // CHANGED: made nullable (double?) since not initialized immediately - null safety requirement
  double? longitude;  // CHANGED: made nullable (double?) same reason as above

  Future<void> getLocation() async {  // kept name same: getLocation (this matches the call site now)
    try {
      Position position = await Geolocator.getCurrentPosition(
        locationSettings: const LocationSettings(
          accuracy: LocationAccuracy.low,
        ),
      );
      latitude = position.latitude;
      longitude = position.longitude;
    } catch (e) {
      print(e);
    }
  }
}
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/network/dio_client.dart';
import '../../../../core/provider/base_provider.dart';
import '../../data/location_api.dart';

typedef InfoLocation = ({String city, String county, double lat, double lng});

class LocationProvider extends BaseProvider with ChangeNotifier {
  LocationProvider({
    required this.dioClient,
    required this.prefs,
    required this.locationApi,
  });

  final DioClient dioClient;
  final SharedPreferences prefs;
  final LocationApi locationApi;

  InfoLocation? locationInfo;

  Future<void> getInfoLocation() async {
    isLoading = true;
    errorMessage = null;
    notifyListeners();

    final lat = prefs.getDouble('latitude') ?? 0;
    final lng = prefs.getDouble('longitude') ?? 0;
    final locationData = await locationApi.fetchLocationData(
      lat: lat,
      lng: lng,
    );

    locationData.fold(
      (failure) {
        errorMessage = failure.message;
        isLoading = false;
        notifyListeners();
      },
      (location) {
        locationInfo = (
          city: location.address.city,
          county: location.address.county,
          lat: lat,
          lng: lng,
        );
        isLoading = false;
        notifyListeners();
      },
    );
  }
}

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/provider/base_provider.dart';
import '../../../location/data/location_api.dart';
import '../../../location/domain/location_model.dart';
import '../../data/weather_api.dart';
import '../../domain/weather_model.dart';

class WeatherProvider extends BaseProvider with ChangeNotifier {
  WeatherProvider({
    required this.prefs,
    required this.weatherApi,
    required this.locationApi,
  });

  final SharedPreferences prefs;
  final WeatherApi weatherApi;
  final LocationApi locationApi;

  WeatherModel? weatherData;
  LocationModel? addressData;

  Future<void> getInfoLocation({double? latArg, double? lngArg}) async {
    isLoading = true;
    errorMessage = null;
    notifyListeners();

    final lat = prefs.getDouble('latitude') ?? latArg ?? 0;
    final lng = prefs.getDouble('longitude') ?? lngArg ?? 0;
    final weatherAsync = await weatherApi.fetchWeatherData(lat: lat, lng: lng);
    final locationAsync = await locationApi.fetchLocationData(
      lat: lat,
      lng: lng,
    );

    weatherAsync.fold(
      (failure) {
        errorMessage = failure.message;
        isLoading = false;
        notifyListeners();
        return;
      },
      (weather) {
        log('Fetched weather data: $weather');
        weatherData = weather;
        isLoading = false;
        notifyListeners();
      },
    );

    locationAsync.fold(
      (failure) {
        errorMessage = failure.message;
        isLoading = false;
        notifyListeners();
        return;
      },
      (address) {
        log('Fetched address data: $address');
        addressData = address;
        isLoading = false;
        notifyListeners();
      },
    );
  }
}

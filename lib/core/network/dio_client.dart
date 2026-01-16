import 'package:dio/dio.dart';

class DioClient {
  final _weatherApi = 'https://api.open-meteo.com/v1';
  final _geocodingApi = 'https://geocoding-api.open-meteo.com/v1';
  final _openStreetMapApi = 'https://nominatim.openstreetmap.org';
  final allTimeDuration = Duration(seconds: 700);

  Dio get weatherApi => Dio(
    BaseOptions(
      baseUrl: _weatherApi,
      connectTimeout: allTimeDuration,
      receiveTimeout: allTimeDuration,
    ),
  )..interceptors.add(LogInterceptor(responseBody: true));

  Dio get geocodingApi => Dio(
    BaseOptions(
      baseUrl: _geocodingApi,
      connectTimeout: allTimeDuration,
      receiveTimeout: allTimeDuration,
    ),
  )..interceptors.add(LogInterceptor(responseBody: true));

  Dio get openStreetMapApi => Dio(
    BaseOptions(
      baseUrl: _openStreetMapApi,
      connectTimeout: allTimeDuration,
      receiveTimeout: allTimeDuration,
      headers: {
        'User-Agent': 'weather_app/1.0',
        'content-type': 'application/json',
      },
    ),
  )..interceptors.add(LogInterceptor(responseBody: true));
}

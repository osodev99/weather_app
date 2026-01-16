import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../core/error/failures.dart';
import '../../../core/network/dio_client.dart';
import '../domain/weather_model.dart';

class WeatherApi {
  WeatherApi({required this.dioClient});

  final DioClient dioClient;

  Future<Either<Failure, WeatherModel>> fetchWeatherData({
    required double lat,
    required double lng,
  }) async {
    try {
      final response = await dioClient.weatherApi.get(
        '/forecast?latitude=$lat&longitude=$lng&current=temperature_2m,is_day,apparent_temperature,relative_humidity_2m,weather_code,precipitation,rain,showers,snowfall&forecast_days=1',
      );
      final weatherModel = WeatherModel.fromJson(response.data);
      return Right(weatherModel);
    } catch (e) {
      if (e is DioException && e.type == DioExceptionType.connectionError) {
        return Left(NetworkFailure());
      }
      return Left(ServerFailure());
    }
  }
}

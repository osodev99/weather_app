import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../core/error/failures.dart';
import '../../../core/network/dio_client.dart';
import '../domain/location_model.dart';

class LocationApi {
  LocationApi({required this.dioClient});

  final DioClient dioClient;

  Future<Either<Failure, LocationModel>> fetchLocationData({
    required double lat,
    required double lng,
  }) async {
    try {
      final response = await dioClient.openStreetMapApi.get(
        '/reverse?lat=$lat&lon=$lng&format=json&addressdetails=1',
      );
      final locationModel = LocationModel.fromJson(response.data);
      return Right(locationModel);
    } catch (e) {
      if (e is DioException && e.type == DioExceptionType.connectionError) {
        return Left(NetworkFailure());
      }
      return Left(ServerFailure());
    }
  }
}

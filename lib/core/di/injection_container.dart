import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../features/location/data/location_api.dart';
import '../network/dio_client.dart';
import '../network/network_info.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // External packages
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => Connectivity());

  // Custom
  sl.registerLazySingleton(() => DioClient());
  sl.registerLazySingleton(() => NetworkInfoImpl(sl()));

  // Api
  sl.registerLazySingleton(() => LocationApi(dioClient: sl()));
}

import 'dart:developer';

import '../../../core/network/dio_client.dart';
import '../domain/address_model.dart';

class SearchApi {
  SearchApi({required this.dioClient});

  final DioClient dioClient;

  Future<List<AddressModel>> fetchAddressData(String placeName) async {
    try {
      if (placeName.isEmpty) {
        return [];
      }
      if (placeName.length < 4) {
        return [];
      }
      final response = await dioClient.geocodingApi.get(
        '/search?name=$placeName',
      );
      final dataList = response.data['results'] as List;
      final addressList = dataList
          .map((data) => AddressModel.fromJson(data))
          .toList();
      return addressList;
    } catch (e) {
      log('Error fetching address data: $e');
      return [];
    }
  }
}

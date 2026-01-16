import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:weather_app/core/di/injection_container.dart';

import '../data/search_api.dart';
import '../domain/address_model.dart';

class AddressSearcher extends StatelessWidget {
  const AddressSearcher({super.key, required this.onAddressSelected});

  final ValueChanged<AddressModel> onAddressSelected;

  @override
  Widget build(BuildContext context) {
    return TypeAheadField<AddressModel>(
      suggestionsCallback: (search) => sl<SearchApi>().fetchAddressData(search),
      emptyBuilder: (context) => Padding(
        padding: const EdgeInsets.all(12),
        child: Text('No addresses found'),
      ),
      builder: (context, controller, focusNode) {
        return TextField(
          controller: controller,
          focusNode: focusNode,
          autofocus: true,
          decoration: InputDecoration(labelText: 'Address'),
          style: TextStyle(color: Colors.white),
        );
      },
      itemBuilder: (context, address) {
        return ListTile(
          title: Text(address.name),
          subtitle: Text(address.country ?? ''),
          dense: true,
        );
      },
      onSelected: (address) {
        onAddressSelected(address);
      },
    );
  }
}

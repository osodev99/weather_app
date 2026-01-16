import 'package:flutter/material.dart';
import 'package:weather_app/features/search/presentation/address_searcher.dart';

import '../../../location/presentation/widgets/location_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(32),
          children: [
            LocationWidget(),
            const SizedBox(height: 24),
            AddressSearcher(onAddressSelected: (address) {}),
          ],
        ),
      ),
    );
  }
}

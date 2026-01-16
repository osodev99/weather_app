import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/features/search/presentation/address_searcher.dart';

import '../../../location/presentation/widgets/location_widget.dart';
import '../provider/weather_provider.dart';
import 'weather_info.dart';

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
            AddressSearcher(
              onAddressSelected: (address) {
                context.read<WeatherProvider>().getInfoLocation(
                  latArg: address.latitude,
                  lngArg: address.longitude,
                );
              },
            ),
            WeatherInfo(),
          ],
        ),
      ),
    );
  }
}

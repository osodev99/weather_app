import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/location_provider.dart';

class LocationWidget extends StatefulWidget {
  const LocationWidget({super.key});

  @override
  State<LocationWidget> createState() => _LocationWidgetState();
}

class _LocationWidgetState extends State<LocationWidget> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<LocationProvider>().getInfoLocation();
    });
  }

  @override
  Widget build(BuildContext context) {
    final locationProvider = context.watch<LocationProvider>();

    if (locationProvider.isLoading) {
      return Center(child: CircularProgressIndicator());
    }

    if (locationProvider.errorMessage != null) {
      return Center(
        child: Text(
          locationProvider.errorMessage!,
          style: TextStyle(color: Colors.grey),
        ),
      );
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      spacing: 8,
      children: [
        Icon(Icons.location_on, color: Colors.white),
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              child: Text(
                '${locationProvider.locationInfo?.city}, ${locationProvider.locationInfo?.county}',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
            Text(
              '${locationProvider.locationInfo?.lat}, ${locationProvider.locationInfo?.lng}',
              style: TextStyle(color: Colors.grey, fontSize: 14),
            ),
          ],
        ),
      ],
    );
  }
}

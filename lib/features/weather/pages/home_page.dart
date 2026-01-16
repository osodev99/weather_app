import 'package:flutter/material.dart';

import '../../location/presentation/widgets/location_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(18),
          children: [LocationWidget()],
        ),
      ),
    );
  }
}

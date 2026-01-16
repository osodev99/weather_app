import 'package:flutter/material.dart';

// splash page
class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Welcome to the Weather App',
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ),
    );
  }
}

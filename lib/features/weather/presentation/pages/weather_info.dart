import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/features/weather/presentation/provider/weather_provider.dart';

class WeatherInfo extends StatefulWidget {
  const WeatherInfo({super.key});

  @override
  State<WeatherInfo> createState() => _WeatherInfoState();
}

class _WeatherInfoState extends State<WeatherInfo> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<WeatherProvider>().getInfoLocation();
    });
  }

  @override
  Widget build(BuildContext context) {
    final weatherProvider = context.watch<WeatherProvider>();

    if (weatherProvider.isLoading) {
      return Center(child: CircularProgressIndicator());
    }

    if (weatherProvider.errorMessage != null) {
      return Center(child: Text('Error: ${weatherProvider.errorMessage}'));
    }

    return Column(
      children: [
        Text(
          '${weatherProvider.weatherData?.current.temperature2M} °C',
          style: TextStyle(fontSize: 32, color: Colors.white),
        ),
      ],
    );
  }
}

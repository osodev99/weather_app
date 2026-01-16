import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';

import 'core/di/injection_container.dart' as di;

import 'features/location/presentation/provider/location_provider.dart';
import 'features/weather/presentation/pages/home_page.dart';
import 'features/weather/presentation/pages/splash_page.dart';
import 'features/weather/presentation/provider/weather_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => WeatherProvider(
            prefs: di.sl(),
            weatherApi: di.sl(),
            locationApi: di.sl(),
          ),
        ),
        ChangeNotifierProvider(
          create: (_) => LocationProvider(
            dioClient: di.sl(),
            prefs: di.sl(),
            locationApi: di.sl(),
          ),
        ),
      ],
      child: const WeatherApp(),
    );
  }
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Weather app',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xFF16191d),
        primarySwatch: Colors.blueGrey,
        useMaterial3: true,
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(),
        ),
        textTheme: GoogleFonts.poppinsTextTheme(),
      ),
      routerConfig: _router,
    );
  }

  static final GoRouter _router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(path: '/', builder: (context, state) => const SplashPage()),
      GoRoute(path: '/home', builder: (context, state) => const HomePage()),
    ],
  );
}

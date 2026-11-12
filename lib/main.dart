import 'package:flutter/material.dart';
import 'navigation/app_routes.dart';
import 'navigation/app_navigation.dart';

void main() {
  runApp(const ArenaCidadaApp());
}

class ArenaCidadaApp extends StatefulWidget {
  const ArenaCidadaApp({super.key});

  @override
  State<ArenaCidadaApp> createState() => _ArenaCidadaAppState();
}

class _ArenaCidadaAppState extends State<ArenaCidadaApp> {
  final ValueNotifier<ThemeMode> _themeNotifier = ValueNotifier(ThemeMode.light);

  @override
  void dispose() {
    _themeNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: _themeNotifier,
      builder: (_, ThemeMode currentMode, __) {
        return MaterialApp(
          title: 'Arena Cidadã',
          debugShowCheckedModeBanner: false,
          themeMode: currentMode,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.green,
              brightness: Brightness.light,
            ),
            useMaterial3: true,
          ),
          darkTheme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.green,
              brightness: Brightness.dark,
            ),
            useMaterial3: true,
          ),
          initialRoute: AppRoutes.splash,
          onGenerateRoute: (settings) => AppNavigation.generateRoute(settings, _themeNotifier),
        );
      },
    );
  }
}
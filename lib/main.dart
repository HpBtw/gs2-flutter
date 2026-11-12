import 'package:flutter/material.dart';
import 'navigation/app_routes.dart';
import 'navigation/app_navigation.dart';

void main() {
  runApp(const ArenaCidadaApp());
}

class ArenaCidadaApp extends StatelessWidget {
  const ArenaCidadaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Arena Cidadã',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF4CAF50)),
        useMaterial3: true,
      ),
      initialRoute: AppRoutes.splash,
      onGenerateRoute: AppNavigation.generateRoute,
    );
  }
}
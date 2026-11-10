import 'package:arena_cidada/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'app_routes.dart';

class AppNavigation {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.splash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      
      case AppRoutes.onboarding:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(child: Text("onboarding")),
          ),
        );
      
      case AppRoutes.home:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(child: Text("home")),
          ),
        );
      
      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(
              child: Text('Rota não encontrada'),
            ),
          ),
        );
    }
  }
}
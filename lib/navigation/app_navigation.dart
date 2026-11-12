import 'package:arena_cidada/model/endereco.dart';
import 'package:arena_cidada/screens/configuracoes_screen.dart';
import 'package:arena_cidada/screens/historico_screen.dart';
import 'package:arena_cidada/screens/home_screen.dart';
import 'package:arena_cidada/screens/onboarding_screen.dart';
import 'package:arena_cidada/screens/perfil_screen.dart';
import 'package:arena_cidada/screens/reportar_screen.dart';
import 'package:arena_cidada/screens/splash_screen.dart';
import 'package:arena_cidada/screens/suporte_screen.dart';
import 'package:flutter/material.dart';

import 'app_routes.dart';

class AppNavigation {
  static Route<dynamic> generateRoute(
    RouteSettings settings,
    ValueNotifier<ThemeMode> themeNotifier,
  ) {
    switch (settings.name) {
      case AppRoutes.splash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());

      case AppRoutes.onboarding:
        return MaterialPageRoute(builder: (_) => const OnboardingScreen());

      case AppRoutes.home:
        return MaterialPageRoute(builder: (_) => const HomeScreen());

      case AppRoutes.reportar:
        final endereco = settings.arguments as Endereco?;
        return MaterialPageRoute(
          builder: (_) => ReportarScreen(endereco: endereco),
        );

      case AppRoutes.perfil:
        return MaterialPageRoute(builder: (_) => const PerfilScreen());

      case AppRoutes.historico:
        return MaterialPageRoute(builder: (_) => const HistoricoScreen());

      case AppRoutes.configuracoes:
        return MaterialPageRoute(
          builder: (_) => ConfiguracoesScreen(themeNotifier: themeNotifier),
        );

      case AppRoutes.suporte:
        return MaterialPageRoute(builder: (_) => const SuporteScreen());

      default:
        return MaterialPageRoute(
          builder: (_) =>
              const Scaffold(body: Center(child: Text('Rota não encontrada'))),
        );
    }
  }
}

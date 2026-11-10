import 'package:arena_cidada/navigation/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _paginaAtual = 0;

  Future<void> _finalizarOnboarding(bool naoMostrarNovamente) async {
    if (naoMostrarNovamente) {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool('introducao_vista', true);
    }
    
    if (!mounted) return;
    Navigator.pushReplacementNamed(context, AppRoutes.home);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView(
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    _paginaAtual = index;
                  });
                },
                children: [
                  _buildPage(
                    icone: Icons.map,
                    titulo: 'Quadras',
                    descricao: 'Descubra os espaços esportivos públicos disponíveis no seu bairro.',
                  ),
                  _buildPage(
                    icone: Icons.calendar_today,
                    titulo: 'Agende seu Jogo',
                    descricao: 'Reserve seu horário e garanta sua partida com a catraca virtual.',
                  ),
                  _buildPage(
                    icone: Icons.build,
                    titulo: 'Zeladoria Comunitária',
                    descricao: 'Reporte problemas estruturais e ajude a cuidar da sua comunidade.',
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () => _finalizarOnboarding(true),
                    child: const Text('Não mostrar novamente'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (_paginaAtual == 2) {
                        _finalizarOnboarding(false);
                      } else {
                        _pageController.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeIn,
                        );
                      }
                    },
                    child: Text(_paginaAtual == 2 ? 'Começar' : 'Avançar'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPage({required IconData icone, required String titulo, required String descricao}) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icone, size: 120, color: Theme.of(context).colorScheme.primary),
          const SizedBox(height: 40),
          Text(
            titulo,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          Text(
            descricao,
            style: const TextStyle(fontSize: 16),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ConfiguracoesScreen extends StatelessWidget {
  final ValueNotifier<ThemeMode> themeNotifier;

  const ConfiguracoesScreen({super.key, required this.themeNotifier});

  Future<void> _reativarOnboarding(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('introducao_vista', false);
    
    if (!context.mounted) return;
    
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('A introdução será exibida novamente no próximo acesso.'),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = themeNotifier.value == ThemeMode.dark;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Configurações'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 16),
        children: [
          SwitchListTile(
            title: const Text('Tema Escuro'),
            subtitle: const Text('Alternar a aparência do aplicativo'),
            secondary: Icon(isDarkMode ? Icons.dark_mode : Icons.light_mode),
            value: isDarkMode,
            onChanged: (bool value) {
              themeNotifier.value = value ? ThemeMode.dark : ThemeMode.light;
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.restart_alt),
            title: const Text('Reativar Introdução'),
            subtitle: const Text('Exibir as telas explicativas novamente'),
            onTap: () => _reativarOnboarding(context),
          ),
          const Divider(),
        ],
      ),
    );
  }
}
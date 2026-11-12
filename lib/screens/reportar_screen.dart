import 'package:arena_cidada/model/endereco.dart';
import 'package:flutter/material.dart';

class ReportarScreen extends StatelessWidget {
  final Endereco? endereco;

  const ReportarScreen({super.key, this.endereco});

  @override
  Widget build(BuildContext context) {
    final localizacao = endereco != null 
        ? '${endereco!.logradouro}, ${endereco!.bairro}' 
        : 'Local não identificado';

    return Scaffold(
      appBar: AppBar(
        title: const Text('Zeladoria Comunitária'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Icon(Icons.build_circle_outlined, size: 64),
            const SizedBox(height: 16),
            Text(
              'Reportar Problema',
              style: Theme.of(context).textTheme.headlineSmall,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),
            Text(
              'Local selecionado:',
              style: Theme.of(context).textTheme.labelLarge,
            ),
            const SizedBox(height: 4),
            Text(
              localizacao,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 24),
            const TextField(
              decoration: InputDecoration(
                labelText: 'Descrição do problema',
                hintText: 'Ex: Alambrado quebrado, iluminação falha...',
                border: OutlineInputBorder(),
                alignLabelWithHint: true,
              ),
              maxLines: 5,
            ),
            const SizedBox(height: 32),
            FilledButton.icon(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.send),
              label: const Text('Enviar Relato'),
            ),
          ],
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';

class SuporteScreen extends StatelessWidget {
  const SuporteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List contatos = [
      {
        'nome': 'Luciano Henrique',
        'email': 'luciano@arenacidada.com.br',
        'telefone': '11 96829-8626',
      },
      {
        'nome': 'Matheus Rocha',
        'email': 'matheus@arenacidada.com.br',
        'telefone': '11 94020-1834',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Ajuda e Suporte'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: contatos.length,
        itemBuilder: (context, index) {
          final contato = contatos[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 16),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const CircleAvatar(
                        child: Icon(Icons.person),
                      ),
                      const SizedBox(width: 16),
                      Text(
                        contato['nome']!,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  Row(
                    children: [
                      const Icon(Icons.email_outlined, size: 20),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          contato['email']!,
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      const Icon(Icons.phone_outlined, size: 20),
                      const SizedBox(width: 12),
                      Text(
                        contato['telefone']!,
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
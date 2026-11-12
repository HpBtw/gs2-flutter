import 'package:arena_cidada/data/relato_repository.dart';
import 'package:flutter/material.dart';

class HistoricoScreen extends StatefulWidget {
  const HistoricoScreen({super.key});

  @override
  State<HistoricoScreen> createState() => _HistoricoScreenState();
}

class _HistoricoScreenState extends State<HistoricoScreen> {
  final RelatoRepository _repository = RelatoRepository();

  @override
  Widget build(BuildContext context) {
    final relatos = _repository.relatos;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Histórico de Relatos'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: relatos.length,
        itemBuilder: (context, index) {
          final relato = relatos[index];
          final bool resolvido = relato.status == 'Resolvido';

          return Card(
            margin: const EdgeInsets.only(bottom: 16),
            child: ListTile(
              contentPadding: const EdgeInsets.all(16),
              leading: Icon(
                resolvido ? Icons.check_circle : Icons.pending_actions,
                color: resolvido ? Colors.green : Colors.orange,
                size: 32,
              ),
              title: Text(
                relato.problema,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 8),
                  Text(relato.local),
                  const SizedBox(height: 4),
                  Text('Data: ${relato.data}'),
                ],
              ),
              trailing: Text(
                relato.status,
                style: TextStyle(
                  color: resolvido ? Colors.green : Colors.orange,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
import 'package:arena_cidada/model/endereco.dart';
import 'package:arena_cidada/navigation/app_routes.dart';
import 'package:flutter/material.dart';

class EnderecoCard extends StatelessWidget {
  final Endereco endereco;

  const EnderecoCard({super.key, required this.endereco});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                const Icon(Icons.location_on_outlined),
                const SizedBox(width: 8),
                Text(
                  'Endereço encontrado',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            ),
            const SizedBox(height: 16),
            _EnderecoItem(titulo: 'CEP', valor: endereco.cep),
            _EnderecoItem(titulo: 'Logradouro', valor: endereco.logradouro),
            _EnderecoItem(titulo: 'Bairro', valor: endereco.bairro),
            _EnderecoItem(titulo: 'Cidade', valor: endereco.localidade),
            _EnderecoItem(
              titulo: 'Estado',
              valor: '${endereco.estado} - ${endereco.uf}',
            ),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.pushNamed(
                  context, 
                  AppRoutes.reportar, 
                  arguments: endereco,
                );
              },
              icon: const Icon(Icons.warning_amber_rounded),
              label: const Text('Reportar Problema neste Local'),
            ),
          ],
        ),
      ),
    );
  }
}

class _EnderecoItem extends StatelessWidget {
  final String titulo;
  final String valor;

  const _EnderecoItem({required this.titulo, required this.valor});

  @override
  Widget build(BuildContext context) {
    final valorExibido = valor.trim().isEmpty ? 'Não informado' : valor;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(titulo, style: Theme.of(context).textTheme.labelMedium),
        const SizedBox(height: 4),
        Text(valorExibido, style: Theme.of(context).textTheme.bodyLarge),
        const SizedBox(height: 12),
      ],
    );
  }
}
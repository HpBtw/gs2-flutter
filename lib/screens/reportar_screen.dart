import 'package:arena_cidada/data/relato_repository.dart';
import 'package:arena_cidada/model/endereco.dart';
import 'package:arena_cidada/model/relato.dart';
import 'package:flutter/material.dart';

class ReportarScreen extends StatefulWidget {
  final Endereco? endereco;

  const ReportarScreen({super.key, this.endereco});

  @override
  State<ReportarScreen> createState() => _ReportarScreenState();
}

class _ReportarScreenState extends State<ReportarScreen> {
  final TextEditingController _descricaoController = TextEditingController();
  final RelatoRepository _repository = RelatoRepository();

  void _enviarRelato() {
    final descricao = _descricaoController.text.trim();
    if (descricao.isEmpty) return;

    final localizacao = widget.endereco != null 
        ? '${widget.endereco!.logradouro}, ${widget.endereco!.bairro}' 
        : 'Local não identificado';

    final novoRelato = Relato(
      data: '11/11/2026',
      problema: descricao,
      local: localizacao,
      status: 'Aberto',
    );

    _repository.adicionarRelato(novoRelato);

    Navigator.pop(context);
  }

  @override
  void dispose() {
    _descricaoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final localizacao = widget.endereco != null 
        ? '${widget.endereco!.logradouro}, ${widget.endereco!.bairro}' 
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
            TextField(
              controller: _descricaoController,
              decoration: const InputDecoration(
                labelText: 'Descrição do problema',
                hintText: 'Ex: Alambrado quebrado, iluminação falha...',
                border: OutlineInputBorder(),
                alignLabelWithHint: true,
              ),
              maxLines: 5,
            ),
            const SizedBox(height: 32),
            FilledButton.icon(
              onPressed: _enviarRelato,
              icon: const Icon(Icons.send),
              label: const Text('Enviar Relato'),
            ),
          ],
        ),
      ),
    );
  }
}
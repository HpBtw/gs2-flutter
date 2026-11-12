import 'package:arena_cidada/components/endereco_card.dart';
import 'package:arena_cidada/data/viacep_service.dart';
import 'package:arena_cidada/model/endereco.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _cepController = TextEditingController();
  final ViaCepService _viaCepService = ViaCepService();

  Endereco? _endereco;
  String? _mensagemErro;
  bool _carregando = false;

  Future<void> _buscarCep() async {
    setState(() {
      _carregando = true;
      _mensagemErro = null;
      _endereco = null;
    });

    try {
      final endereco = await _viaCepService.buscarEndereco(_cepController.text);

      if (!mounted) return;

      setState(() {
        _endereco = endereco;
      });
    } catch (erro) {
      if (!mounted) return;

      setState(() {
        _mensagemErro = erro.toString().replaceFirst('Exception: ', '');
      });
    } finally {
      if (mounted) {
        setState(() {
          _carregando = false;
        });
      }
    }
  }

  void _limpar() {
    _cepController.clear();
    setState(() {
      _endereco = null;
      _mensagemErro = null;
    });
  }

  @override
  void dispose() {
    _cepController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Consulta ViaCEP'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.person_outline),
            tooltip: 'Meu Perfil',
            onPressed: () {
              Navigator.pushNamed(context, '/perfil');
            },
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Icon(Icons.location_searching, size: 72),
              const SizedBox(height: 16),
              Text(
                'Consulte um endereço',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: 8),
              Text(
                'Digite um CEP brasileiro para localizar o endereço.',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 32),
              TextField(
                controller: _cepController,
                enabled: !_carregando,
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.search,
                maxLength: 8,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(8),
                ],
                decoration: const InputDecoration(
                  labelText: 'CEP',
                  hintText: 'Exemplo: 01001000',
                  prefixIcon: Icon(Icons.pin_drop_outlined),
                  border: OutlineInputBorder(),
                  counterText: '',
                ),
                onSubmitted: (_) {
                  if (!_carregando) {
                    _buscarCep();
                  }
                },
              ),
              const SizedBox(height: 16),
              FilledButton.icon(
                onPressed: _carregando ? null : _buscarCep,
                icon: _carregando
                    ? const SizedBox.square(
                        dimension: 18,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : const Icon(Icons.search),
                label: Text(_carregando ? 'Consultando...' : 'Consultar CEP'),
              ),
              const SizedBox(height: 8),
              TextButton(
                onPressed: _carregando ? null : _limpar,
                child: const Text('Limpar'),
              ),
              if (_mensagemErro != null) ...[
                const SizedBox(height: 16),
                _ErroCard(mensagem: _mensagemErro!),
              ],
              if (_endereco != null) ...[
                const SizedBox(height: 24),
                EnderecoCard(endereco: _endereco!),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

class _ErroCard extends StatelessWidget {
  final String mensagem;

  const _ErroCard({required this.mensagem});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Card(
      color: colorScheme.errorContainer,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(Icons.error_outline, color: colorScheme.onErrorContainer),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                mensagem,
                style: TextStyle(color: colorScheme.onErrorContainer),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

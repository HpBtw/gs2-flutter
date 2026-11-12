import 'dart:convert';
import 'package:arena_cidada/model/endereco.dart';
import 'package:http/http.dart' as http;

class ViaCepService {
  static const String _baseUrl = 'https://viacep.com.br/ws';

  Future<Endereco> buscarEndereco(String cep) async {
    final cepLimpo = cep.replaceAll(RegExp(r'[^0-9]'), '');

    if (cepLimpo.length != 8) {
      throw Exception('O CEP deve possuir 8 dígitos.');
    }

    final uri = Uri.parse('$_baseUrl/$cepLimpo/json/');
    final response = await http.get(uri, headers: {'Accept': 'application/json'});

    if (response.statusCode != 200) {
      throw Exception(
        'Não foi possível consultar o CEP. '
        'Código HTTP: ${response.statusCode}',
      );
    }

    final json = jsonDecode(response.body) as Map<String, dynamic>;

    if (json['erro'] == true) {
      throw Exception('CEP não encontrado.');
    }

    return Endereco.fromJson(json);
  }
}
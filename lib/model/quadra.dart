class Quadra {
  final String id;
  final String nome;
  final String tipo;
  final String endereco;

  Quadra({
    required this.id,
    required this.nome,
    required this.tipo,
    required this.endereco,
  });

  factory Quadra.fromJson(Map<String, dynamic> json) {
    return Quadra(
      id: json['id'].toString(),
      nome: json['nome'] ?? '',
      tipo: json['tipo'] ?? '',
      endereco: json['endereco'] ?? '',
    );
  }
}
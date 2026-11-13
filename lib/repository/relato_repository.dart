import '../model/relato.dart';

class RelatoRepository {
  static final List<Relato> _relatos = [
    Relato(
      data: '10/11/2026',
      problema: 'Alambrado furado na lateral',
      local: 'Rua Manoel Salgado, Vila Caraguatá',
      status: 'Em análise',
    ),
    Relato(
      data: '05/11/2026',
      problema: 'Iluminação da quadra queimada',
      local: 'Praça da Matriz, Centro',
      status: 'Resolvido',
    ),
    Relato(
      data: '22/10/2026',
      problema: 'Piso rachado e com desnível',
      local: 'Av. Paulista, Bela Vista',
      status: 'Resolvido',
    ),
  ];

  List<Relato> getAllRelatos() {
    return _relatos;
  }

  void adicionarRelato(Relato relato) {
    _relatos.insert(0, relato);
  }
}
class Transacao {
  final int id;
  final String descricao;
  final double valor;
  final String tipo;
  final DateTime data;

  Transacao({
    required this.id,
    required this.descricao,
    required this.valor,
    required this.tipo,
    required this.data,
  });
}

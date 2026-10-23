import '../models/transacao.dart';

class TransacoesController {
  final List<Transacao> transacoes = [];

  int proximoId = 1;

  List<Transacao> listarTodas() {
    return transacoes;
  }

  String? cadastrar(
    String descricao,
    double valor,
    String tipo,
    DateTime data,
  ) {
    if (descricao.trim().isEmpty) {
      return 'A descrição é obrigatória.';
    }

    if (valor <= 0) {
      return 'O valor deve ser maior que zero.';
    }

    if (tipo != 'entrada' && tipo != 'saida') {
      return 'O tipo deve ser entrada ou saida.';
    }

    final novaTransacao = Transacao(
      id: proximoId,
      descricao: descricao.trim(),
      valor: valor,
      tipo: tipo,
      data: data,
    );

    transacoes.add(novaTransacao);

    proximoId++;

    return null;
  }

  double calcularTotalEntradas() {
    double total = 0;

    for (var transacao in transacoes) {
      if (transacao.tipo == 'entrada') {
        total += transacao.valor;
      }
    }

    return total;
  }

  double calcularTotalSaidas() {
    double total = 0;

    for (var transacao in transacoes) {
      if (transacao.tipo == 'saida') {
        total += transacao.valor;
      }
    }

    return total;
  }

  double calcularSaldo() {
    return calcularTotalEntradas() - calcularTotalSaidas();
  }

  Transacao? buscarPorId(int id) {
    for (var transacao in transacoes) {
      if (transacao.id == id) {
        return transacao;
      }
    }

    return null;
  }

  String? atualizar(
    int id,
    String novaDescricao,
    double novoValor,
    String novoTipo,
  ) {
    if (novaDescricao.trim().isEmpty) {
      return 'A descrição é obrigatória.';
    }

    if (novoValor <= 0) {
      return 'O valor deve ser maior que zero.';
    }

    if (novoTipo != 'entrada' && novoTipo != 'saida') {
      return 'O tipo deve ser entrada ou saida.';
    }

    final indice = transacoes.indexWhere((transacao) => transacao.id == id);

    if (indice == -1) {
      return 'Transação não encontrada.';
    }

    final transacaoAntiga = transacoes[indice];

    transacoes[indice] = Transacao(
      id: transacaoAntiga.id,
      descricao: novaDescricao.trim(),
      valor: novoValor,
      tipo: novoTipo,
      data: transacaoAntiga.data,
    );

    return null;
  }

  String? remover(int id) {
    final indice = transacoes.indexWhere((transacao) => transacao.id == id);

    if (indice == -1) {
      return 'Transação não encontrada.';
    }

    transacoes.removeAt(indice);

    return null;
  }
}

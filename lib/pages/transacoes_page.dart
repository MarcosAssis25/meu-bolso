import 'package:flutter/material.dart';
import '../controllers/transacoes_controllers.dart';

class TransacoesPage extends StatefulWidget {
  const TransacoesPage({super.key});

  @override
  State<TransacoesPage> createState() => _TransacoesPageState();
}

class _TransacoesPageState extends State<TransacoesPage> {
  final TransacoesController controller = TransacoesController();
  final TextEditingController descricaoController = TextEditingController();
  final TextEditingController valorController = TextEditingController();
  String tipoSelecionado = 'entrada';

  void salvarTransacao() {
    final descricao = descricaoController.text.trim();
    final valorTexto = valorController.text.trim().replaceAll(',', '.');
    final valor = double.tryParse(valorTexto);

    if (valor == null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Informe um valor válido.')));

      return;
    }

    final erro = controller.cadastrar(
      descricao,
      valor,
      tipoSelecionado,
      DateTime.now(),
    );

    if (erro != null) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(erro)));

      return;
    }

    setState(() {});

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Meu Bolso',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'CONTROLE FINANCEIRO',
              style: TextStyle(
                color: Color(0xFF4ADE80),
                fontSize: 12,
                fontWeight: FontWeight.bold,
                letterSpacing: 2,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Visão geral',
              style: TextStyle(
                color: Color(0xFFF8FAFC),
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 24),

            // CARTÃO DO SALDO
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: const Color(0xFF172337),
                borderRadius: BorderRadius.circular(24),
                border: Border.all(color: const Color(0xFF263449)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Row(
                    children: [
                      Icon(
                        Icons.account_balance_wallet_outlined,
                        color: Color(0xFF4ADE80),
                        size: 22,
                      ),
                      SizedBox(width: 10),
                      Text(
                        'Saldo disponível',
                        style: TextStyle(
                          color: Color(0xFFCBD5E1),
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'R\$ ${controller.calcularSaldo().toStringAsFixed(2).replaceAll('.', ',')}',
                    style: const TextStyle(
                      color: Color(0xFF4ADE80),
                      fontSize: 34,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Seu resumo financeiro',
                    style: TextStyle(
                      color: Colors.blueGrey.shade200,
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // CARTÕES DE ENTRADAS E SAÍDAS
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: const Color(0xFF112E2A),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: const Color(0xFF245447)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(
                          Icons.trending_up,
                          color: Color(0xFF4ADE80),
                          size: 25,
                        ),
                        const SizedBox(height: 12),
                        const Text(
                          'Entradas',
                          style: TextStyle(
                            color: Color(0xFFCBD5E1),
                            fontSize: 13,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          'R\$ ${controller.calcularTotalEntradas().toStringAsFixed(2).replaceAll('.', ',')}',
                          style: const TextStyle(
                            color: Color(0xFF4ADE80),
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: const Color(0xFF351D2A),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: const Color(0xFF633047)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(
                          Icons.trending_down,
                          color: Color(0xFFFB7185),
                          size: 25,
                        ),
                        const SizedBox(height: 12),
                        const Text(
                          'Saídas',
                          style: TextStyle(
                            color: Color(0xFFCBD5E1),
                            fontSize: 13,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          'R\$ ${controller.calcularTotalSaidas().toStringAsFixed(2).replaceAll('.', ',')}',
                          style: const TextStyle(
                            color: Color(0xFFFB7185),
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 28),

            // TÍTULO DAS MOVIMENTAÇÕES
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Últimas movimentações',
                  style: TextStyle(
                    color: Color(0xFFF8FAFC),
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Ver todas',
                  style: TextStyle(
                    color: Color(0xFF4ADE80),
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 16),

            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 24,
                  horizontal: 12,
                ),
                child: Column(
                  children: [
                    Icon(
                      Icons.receipt_long_outlined,
                      size: 48,
                      color: Colors.blueGrey.shade400,
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Nenhuma movimentação ainda',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFFF8FAFC),
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Suas entradas e saídas aparecerão aqui.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.blueGrey.shade300,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            // BOTÃO NOVA TRANSAÇÃO
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    useSafeArea: true,
                    constraints: const BoxConstraints(maxWidth: 500),
                    backgroundColor: const Color(0xFF172337),
                    builder: (context) {
                      return Padding(
                        padding: EdgeInsets.fromLTRB(
                          24,
                          24,
                          24,
                          MediaQuery.of(context).viewInsets.bottom + 24,
                        ),
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Nova transação',
                                style: TextStyle(
                                  color: Color(0xFFF8FAFC),
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 24),

                              // DESCRIÇÃO
                              TextField(
                                controller: descricaoController,
                                decoration: InputDecoration(
                                  labelText: 'Descrição',
                                  hintText: 'Ex.: Salário, mercado...',
                                  prefixIcon: const Icon(
                                    Icons.description_outlined,
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(14),
                                  ),
                                ),
                              ),

                              const SizedBox(height: 16),

                              // VALOR
                              TextField(
                                keyboardType:
                                    const TextInputType.numberWithOptions(
                                      decimal: true,
                                    ),
                                controller: valorController,
                                decoration: InputDecoration(
                                  labelText: 'Valor',
                                  hintText: 'Ex.: 150,00',
                                  prefixText: 'R\$ ',
                                  prefixIcon: const Icon(Icons.attach_money),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(14),
                                  ),
                                ),
                              ),

                              const SizedBox(height: 24),

                              const Text(
                                'Tipo de transação',
                                style: TextStyle(
                                  color: Color(0xFFCBD5E1),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(height: 12),

                              // OPÇÕES DE TIPO
                              Row(
                                children: [
                                  Expanded(
                                    child: OutlinedButton.icon(
                                      onPressed: () {
                                        setState(() {
                                          tipoSelecionado = 'entrada';
                                        });
                                      },
                                      icon: const Icon(
                                        Icons.trending_up,
                                        color: Color(0xFF4ADE80),
                                      ),
                                      label: const Text('Entrada'),
                                      style: OutlinedButton.styleFrom(
                                        foregroundColor: const Color(
                                          0xFF4ADE80,
                                        ),
                                        side: const BorderSide(
                                          color: Color(0xFF4ADE80),
                                        ),
                                        padding: const EdgeInsets.symmetric(
                                          vertical: 14,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 12),
                                  Expanded(
                                    child: OutlinedButton.icon(
                                      onPressed: () {
                                        setState(() {
                                          tipoSelecionado = 'saida';
                                        });
                                      },
                                      icon: const Icon(
                                        Icons.trending_down,
                                        color: Color(0xFFFB7185),
                                      ),
                                      label: const Text('Saída'),
                                      style: OutlinedButton.styleFrom(
                                        foregroundColor: const Color(
                                          0xFFFB7185,
                                        ),
                                        side: const BorderSide(
                                          color: Color(0xFFFB7185),
                                        ),
                                        padding: const EdgeInsets.symmetric(
                                          vertical: 14,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 24),

                              SizedBox(
                                width: double.infinity,
                                child: ElevatedButton.icon(
                                  onPressed: salvarTransacao,
                                  icon: const Icon(Icons.save_outlined),
                                  label: const Text('Salvar transação'),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xFF4ADE80),
                                    foregroundColor: const Color(0xFF0B1120),
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 16,
                                    ),
                                    textStyle: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
                icon: const Icon(Icons.add),
                label: const Text('Nova transação'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF4ADE80),
                  foregroundColor: const Color(0xFF0B1120),
                  padding: const EdgeInsets.symmetric(vertical: 18),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  textStyle: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

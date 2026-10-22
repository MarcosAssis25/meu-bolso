# Controle Financeiro de Bolso

Aplicativo Flutter para registrar entradas e saídas, consultar o histórico de transações e acompanhar os totais e o saldo.

## Escopo

Os dados são armazenados somente em memória. Não há banco de dados nem integração com API; os lançamentos não são persistidos quando o aplicativo é fechado.

## Funcionalidades

- Cadastrar transações com descrição, valor, tipo e data.
- Listar e consultar os lançamentos registrados.
- Alterar e remover transações pelo identificador.
- Exibir o total de entradas, o total de saídas e o saldo consolidado.
- Informar quando ainda não há transações cadastradas.

## Regras de negócio

- O valor deve ser maior que zero e é armazenado como quantidade positiva.
- A descrição é obrigatória e não pode conter apenas espaços.
- O tipo deve ser exatamente `entrada` ou `saida`.
- Cada transação recebe um identificador sequencial.
- O saldo é calculado como total de entradas menos total de saídas e pode ficar negativo.

## Executar

Com o Flutter instalado, execute na raiz do projeto:

```bash
flutter pub get
flutter run
```

## Sugestão de Estrutura

```
lib/
  main.dart
  models/
    transacao.dart
  controllers/
    transacoes_controller.dart
  pages/
    transacoes_page.dart
```
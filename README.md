# Desafio: Controle Financeiro de Bolso

Neste desafio, desenvolva um aplicativo Flutter para registrar entradas e saídas, consultar o histórico de transações e acompanhar os totais e o saldo. O foco está na lógica, nas classes, na manipulação de listas, nas estruturas condicionais e nos laços de repetição.

## Escopo

Implemente o armazenamento somente em memória. Não use banco de dados ou integração com API; os lançamentos não precisam ser persistidos quando o aplicativo é fechado.

## O que será praticado

- Classes e modelagem de dados.
- Manipulação de listas (`List`).
- Estruturas de decisão (`if/else`).
- Laços de repetição (`for`).

O foco da avaliação é o comportamento lógico: armazenamento correto em memória, cálculos e operações de alteração e remoção, além da rejeição de dados inválidos.

## Modelagem: `Transacao`

Cada movimentação deve ser representada por uma transação com os seguintes atributos:

```dart
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
```

O `id` é sequencial e único. O `valor` guarda sempre uma quantidade positiva; o `tipo` determina se ela representa uma entrada ou saída e deve ser exatamente `entrada` ou `saida`.

## Regras de negócio e validações

Use estruturas condicionais para proteger o sistema contra dados inválidos:

1. O valor deve ser maior que zero (`valor > 0`).
2. A descrição é obrigatória e não pode conter apenas espaços em branco (`descricao.trim().isEmpty`).
3. O tipo aceito deve ser exatamente `entrada` ou `saida`; outros valores devem ser rejeitados.
4. O saldo começa em zero e pode ficar negativo quando as saídas superarem as entradas.

## Operações esperadas (CRUD)

Implemente as operações sobre uma lista interna (`List<Transacao>`):

- **Cadastrar (Create):** validar os dados, gerar o próximo ID e adicionar a transação.
- **Listar e consultar (Read):** exibir os lançamentos, total de entradas, total de saídas e saldo consolidado. Se não houver registros, informar isso claramente.
- **Alterar (Update):** localizar uma transação pelo ID e atualizar suas informações.
- **Remover (Delete):** localizar pelo ID, remover a transação e refletir a alteração nos totais e no saldo.

## Controller a implementar

Implemente a classe `TransacoesController` para manter a lista de transações em memória e concentrar as regras financeiras. Ela deve oferecer métodos para:

- Listar todas as transações.
- Cadastrar uma transação após validar os dados e atribuir um ID sequencial.
- Atualizar uma transação localizada pelo ID.
- Remover uma transação localizada pelo ID.
- Calcular o total de entradas, o total de saídas e o saldo.

Use `if/else` para validar valores, descrições e tipos, e laços `for` para percorrer a lista e calcular os totais.

## Interface e organização

Crie a página `TransacoesPage` para apresentar as informações e acionar as operações do sistema. A interface é responsabilidade dos alunos: não há layout obrigatório. A estrutura de pastas a seguir é apenas uma sugestão; você pode organizar o código de outra forma.

## Pré-requisitos

- Git instalado.
- Flutter SDK instalado e configurado no `PATH`.
- Um dispositivo ou emulador compatível configurado. Para executar no navegador, é necessário ter o Chrome instalado.
- Acesso ao repositório no GitHub. Se ele for privado, entre no GitHub com uma conta autorizada.

Confira a instalação do Flutter com:

```bash
flutter doctor
```

## Clonar e executar

Clone o repositório e acesse a pasta do projeto:

```bash
git clone https://github.com/w3soft-fabio/avaliacao_1.git
cd avaliacao_1
```

Na raiz do projeto, baixe as dependências e inicie o aplicativo:

```bash
flutter pub get
flutter run
```

O comando `flutter run` solicita que você escolha um dispositivo disponível, caso haja mais de um. Para executar no Chrome, use `flutter run -d chrome`.

## Estrutura sugerida (opcional)

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
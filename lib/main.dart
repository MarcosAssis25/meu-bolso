import 'package:flutter/material.dart';
import 'pages/transacoes_page.dart';

void main() {
  runApp(const MeuBolsoApp());
}

class MeuBolsoApp extends StatelessWidget {
  const MeuBolsoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Controle Financeiro de Bolso',
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF4ADE80),
          brightness: Brightness.dark,
        ),
        scaffoldBackgroundColor: const Color(0xFF0B1120),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF0B1120),
          foregroundColor: Color(0xFFF8FAFC),
          elevation: 0,
        ),
      ),
      home: const TransacoesPage(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:matematica/telas/questoes/adicao.dart';
import 'package:matematica/telas/questoes/divisao.dart';
import 'package:matematica/telas/questoes/multiplicacao.dart';
import 'package:matematica/telas/questoes/subtracao.dart';
import 'package:matematica/telas/home.dart';
import 'package:matematica/telas/tabuada/adicao.dart';
import 'package:matematica/telas/tabuada/divisao.dart';
import 'package:matematica/telas/tabuada/multiplicacao.dart';
import 'package:matematica/telas/tabuada/subtracao.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pratique Matemática',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: 'home',
      routes: {
        'home': (context) => const Home(),
        'adicao': (context) => const Adicao(),
        'subtracao': (context) => const Subtracao(),
        'multiplicacao': (context) => const Multiplicacao(),
        'divisao': (context) => const Divisao(),
        'tabuada_adicao': (context) => const TabuadaAdicao(),
        'tabuada_subtracao': (context) => const TabuadaSubtracao(),
        'tabuada_multiplicacao': (context) => const TabuadaMultiplicacao(),
        'tabuada_divisao': (context) => const TabuadaDivisao(),
      },
    );
  }
}

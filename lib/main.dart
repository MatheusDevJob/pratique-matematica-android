import 'package:flutter/material.dart';
import 'package:matematica/telas/adicao.dart';
import 'package:matematica/telas/divisao.dart';
import 'package:matematica/telas/home.dart';
import 'package:matematica/telas/multiplica%C3%A7%C3%A3o.dart';
import 'package:matematica/telas/subtracao.dart';

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
      },
    );
  }
}

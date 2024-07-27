import 'dart:math';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:matematica/elementos/myAppBar.dart';

void main() {
  runApp(const Divisao());
}

class Divisao extends StatefulWidget {
  const Divisao({super.key});

  @override
  State<Divisao> createState() => _DivisaoState();
}

class _DivisaoState extends State<Divisao> {
  // instancia do Random para calculo de números aleatórios
  Random rand = Random();

  // valores para o cálculo
  late int _primeiroValor;
  late int _segundoValor;

  // resposta
  late double _resposta;
  late double _respostaErrada1;
  late double _respostaErrada2;
  late double _respostaErrada3;
  late double _respostaErrada4;
  late double _respostaErrada5;

  // resposta certa ou errada
  bool resultado = false;

  // lista de wigets com as opções de respostas
  List<Widget> listaWidgets1 = [];
  List<Widget> listaWidgets2 = [];

  // contagem de acertos e erros
  int acertos = 0;
  int erros = 0;

  @override
  void initState() {
    _receberValores();
    _calcularRespostas();
    super.initState();
  }

  void _receberValores() {
    setState(() {
      _primeiroValor = rand.nextInt(500000) + 123;
      _segundoValor = rand.nextInt(1000);
    });
  }

  void _calcularRespostas() {
    listaWidgets1 = [];
    listaWidgets2 = [];
    // recebe os valores para as opções
    // converte o valor com toStringAsFixed(2) para fixar as casas decimais em 2 e depois converte para double novamente
    _resposta =
        double.parse((_primeiroValor / _segundoValor).toStringAsFixed(2));
    _respostaErrada1 = _resposta - _gerarRespostasErradas(rand.nextInt(10));
    _respostaErrada2 = _resposta - _gerarRespostasErradas(rand.nextInt(10));
    _respostaErrada3 = _resposta - _gerarRespostasErradas(rand.nextInt(10));
    _respostaErrada4 = _resposta - _gerarRespostasErradas(rand.nextInt(10));
    _respostaErrada5 = _resposta - _gerarRespostasErradas(rand.nextInt(10));

    listaWidgets1.add(
      ContainerResposta(
        opcao: _respostaErrada1,
        verificar: verificarResposta,
      ),
    );
    listaWidgets1.add(
      ContainerResposta(
        opcao: _respostaErrada2,
        verificar: verificarResposta,
      ),
    );
    listaWidgets1.add(
      ContainerResposta(
        opcao: _respostaErrada3,
        verificar: verificarResposta,
      ),
    );
    listaWidgets2.add(
      ContainerResposta(
        opcao: _respostaErrada4,
        verificar: verificarResposta,
      ),
    );
    listaWidgets2.add(
      ContainerResposta(
        opcao: _respostaErrada5,
        verificar: verificarResposta,
      ),
    );
    listaWidgets2.add(
      ContainerResposta(
        opcao: _resposta,
        verificar: verificarResposta,
      ),
    );

    // randomiza as opções
    listaWidgets1.shuffle();
    listaWidgets2.shuffle();
  }

  bool verificarResposta(double escolha) {
    resultado = escolha == _resposta ? true : false;
    // chama a respectiva função
    resultado ? acertou() : errou();
    return resultado;
  }

  void acertou() {
    // atualiza as questões
    setState(() {
      acertos++;
      _receberValores();
      _calcularRespostas();
      Fluttertoast.showToast(
        msg: "PARABÉNS!! ACERTOU",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    });
  }

  void errou() {
    // atualiza as questões
    setState(() {
      erros++;
      _receberValores();
      _calcularRespostas();

      Fluttertoast.showToast(
        msg: "Desculpe... errou...",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    });
  }

  int _gerarRespostasErradas(int opcaoDiferenca) {
    int respostaErrada;
    switch (opcaoDiferenca) {
      case 0:
        respostaErrada = 130;
        break;
      case 1:
        respostaErrada = 1223;
        break;
      case 2:
        respostaErrada = 8964;
        break;
      case 3:
        respostaErrada = 9912;
        break;
      case 4:
        respostaErrada = 13;
        break;
      case 5:
        respostaErrada = 65;
        break;
      case 6:
        respostaErrada = 1;
        break;
      case 7:
        respostaErrada = 8351;
        break;
      case 8:
        respostaErrada = 5114;
        break;
      default:
        respostaErrada = 7;
        break;
    }
    return respostaErrada;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(titulo: "Divisão"),
      body: Stack(
        children: [
          // elementos flutuando na tela com a contagem de acertos e erros
          Positioned(
            top: 10,
            left: 50,
            child: Text(
              'Acertos: $acertos',
              style: const TextStyle(fontSize: 20),
            ),
          ),
          Positioned(
            top: 10,
            right: 50,
            child: Text(
              'Erros: $erros',
              style: const TextStyle(fontSize: 20),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 150,
                  decoration:
                      const BoxDecoration(border: Border(bottom: BorderSide())),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        textAlign: TextAlign.end,
                        _primeiroValor.toString(),
                        style: const TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        "÷ ${_segundoValor.toString()}",
                        textAlign: TextAlign.end,
                        style: const TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: listaWidgets1,
                    ),
                    const SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: listaWidgets2,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ContainerResposta extends StatelessWidget {
  final Function verificar;
  final double opcao;
  const ContainerResposta({
    super.key,
    required this.opcao,
    required this.verificar,
  });
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => verificar(opcao),
      child: Container(
        width: 110,
        height: 80,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(15)),
          border: Border.all(),
        ),
        child: Center(
          child: Text(
            opcao.toString(),
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }
}

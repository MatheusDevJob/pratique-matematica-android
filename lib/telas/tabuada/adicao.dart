import 'dart:math';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:matematica/elementos/myAppBar.dart';

class TabuadaAdicao extends StatefulWidget {
  const TabuadaAdicao({super.key});

  @override
  State<TabuadaAdicao> createState() => _TabuadaAdicaoState();
}

class _TabuadaAdicaoState extends State<TabuadaAdicao> {
  // instancia do Random para calculo de números aleatórios
  Random rand = Random();

  // valores para o cálculo
  late int _primeiroValor;
  late int _segundoValor;

  // resposta
  late int _resposta;
  late int _respostaErrada1;
  late int _respostaErrada2;
  late int _respostaErrada3;
  late int _respostaErrada4;
  late int _respostaErrada5;

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
      _primeiroValor = rand.nextInt(11);
      _segundoValor = rand.nextInt(11);
    });
  }

  void _calcularRespostas() {
    listaWidgets1 = [];
    listaWidgets2 = [];

    // recebe os valores para as opções
    _resposta = _primeiroValor + _segundoValor;
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

  bool verificarResposta(int escolha) {
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
        respostaErrada = 1;
        break;
      case 1:
        respostaErrada = 2;
        break;
      case 2:
        respostaErrada = 3;
        break;
      case 3:
        respostaErrada = 4;
        break;
      case 4:
        respostaErrada = 5;
        break;
      case 5:
        respostaErrada = 6;
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
      appBar: const MyAppBar(titulo: "Adição"),
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
                        "+ ${_segundoValor.toString()}",
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
  final int opcao;
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

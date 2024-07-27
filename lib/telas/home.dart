import 'package:flutter/material.dart';
import 'package:matematica/elementos/MyAppBar.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // false questões
  // true tabuada
  bool telas = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(
        titulo: "É Divertido Aprender Matemática",
      ),
      body: Center(
        child: Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 300),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () => setState(() => telas = !telas),
                      child: Container(
                        width: 110,
                        height: 80,
                        decoration: BoxDecoration(
                          color: !telas ? Colors.blueGrey : null,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(15)),
                          border: Border.all(),
                        ),
                        child: const Center(
                          child: Text(
                            "QUESTÕES",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    InkWell(
                      onTap: () => setState(() => telas = !telas),
                      child: Container(
                        width: 110,
                        height: 80,
                        decoration: BoxDecoration(
                          color: telas ? Colors.blueGrey : null,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(15)),
                          border: Border.all(),
                        ),
                        child: const Center(
                          child: Text(
                            "TABUADA",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // tabuada
                    if (telas) ...[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.of(context).pushNamed('tabuada_adicao');
                            },
                            child: Container(
                              width: 110,
                              height: 80,
                              decoration: BoxDecoration(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(15)),
                                border: Border.all(),
                              ),
                              child: const Center(
                                child: Text(
                                  "Adição",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () => Navigator.of(context)
                                .pushNamed('tabuada_subtracao'),
                            child: Container(
                              width: 110,
                              height: 80,
                              decoration: BoxDecoration(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(15)),
                                border: Border.all(),
                              ),
                              child: const Center(
                                child: Text(
                                  "Subtração",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 50),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          InkWell(
                            onTap: () => Navigator.of(context)
                                .pushNamed('tabuada_multiplicacao'),
                            child: Container(
                              width: 110,
                              height: 80,
                              decoration: BoxDecoration(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(15)),
                                border: Border.all(),
                              ),
                              child: const Center(
                                child: Text(
                                  "Multiplicação",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () => Navigator.of(context)
                                .pushNamed('tabuada_divisao'),
                            child: Container(
                              width: 110,
                              height: 80,
                              decoration: BoxDecoration(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(15)),
                                border: Border.all(),
                              ),
                              child: const Center(
                                child: Text(
                                  "Divisão",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ] else ...[
                      //questões
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.of(context).pushNamed('adicao');
                            },
                            child: Container(
                              width: 110,
                              height: 80,
                              decoration: BoxDecoration(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(15)),
                                border: Border.all(),
                              ),
                              child: const Center(
                                child: Text(
                                  "Adição",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () =>
                                Navigator.of(context).pushNamed('subtracao'),
                            child: Container(
                              width: 110,
                              height: 80,
                              decoration: BoxDecoration(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(15)),
                                border: Border.all(),
                              ),
                              child: const Center(
                                child: Text(
                                  "Subtração",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 50),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          InkWell(
                            onTap: () => Navigator.of(context)
                                .pushNamed('multiplicacao'),
                            child: Container(
                              width: 110,
                              height: 80,
                              decoration: BoxDecoration(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(15)),
                                border: Border.all(),
                              ),
                              child: const Center(
                                child: Text(
                                  "Multiplicação",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () =>
                                Navigator.of(context).pushNamed('divisao'),
                            child: Container(
                              width: 110,
                              height: 80,
                              decoration: BoxDecoration(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(15)),
                                border: Border.all(),
                              ),
                              child: const Center(
                                child: Text(
                                  "Divisão",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ]
                  ],
                ),
              ],
            )),
      ),
    );
  }
}

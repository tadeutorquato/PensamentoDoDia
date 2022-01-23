import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pensamento do dia',
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _pensamentos = [
    "O importante não é vencer todos os dias, mas lutar sempre.",
    "A vida é uma bagunça, mas não é uma bagunça para ser sortida.",
    "O que você pode fazer agora que tem o maior impacto sobre o seu futuro?",
    "O que você acha que será o importante da vida depois de hoje?",
    "Não pare de lutar, porque o que você tem hoje é o melhor que pode vir.",
    "A vida é como uma floresta, sempre existem novas ramificações, sempre há esperança.",
    "Não importa o quão grande você é, você sempre será menor do que as outras pessoas.",
    "A vida é como um jogo, você sempre vai ganhando ou perdendo."
  ];

  var _pensamentoGerado = "Clique abaixo para gerar uma pensamento!";

  void _gerarPensamento() {
    final numeroSorteado = Random().nextInt(_pensamentos.length);
    setState(() {
      _pensamentoGerado = _pensamentos[numeroSorteado];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pensamento do dia'),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(16),          
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                "images/thought-bubble.png",
                width: 220,
              ),
              Text(
                _pensamentoGerado,
                textAlign: TextAlign.justify,
                style: const TextStyle(
                  fontSize: 25,
                  fontStyle: FontStyle.italic,
                  color: Colors.black,
                ),
              ),
              ElevatedButton(
                child: const Text(
                  "Novo Pensamento",
                  style: TextStyle(
                    fontSize: 17,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.green,
                  onPrimary: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                ),
                onPressed: _gerarPensamento,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

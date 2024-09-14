import 'package:flutter/material.dart';

void main() => runApp(Calculadora());

class Calculadora extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculadora',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CalculadoraTela(),
    );
  }
}

class CalculadoraTela extends StatefulWidget {
  @override
  _CalculadoraEstado createState() => _CalculadoraEstado();
}

class _CalculadoraEstado extends State<CalculadoraTela> {
  double valor1 = 0;
  double valor2 = 0;
  String operador = '';
  String displayTexto = '0';

  void aoPressionar(String texto) {
    setState(() {
      if (texto == 'C') {
        valor1 = 0;
        valor2 = 0;
        operador = '';
        displayTexto = '0';
      } else if (texto == '+' || texto == '-' || texto == '*' || texto == '/') {
        valor1 = double.tryParse(displayTexto) ?? 0;
        operador = texto;
        displayTexto = '0';
      } else if (texto == '=') {
        valor2 = double.tryParse(displayTexto) ?? 0;
        if (operador == '+') {
          displayTexto = (valor1 + valor2).toString();
        } else if (operador == '-') {
          displayTexto = (valor1 - valor2).toString();
        } else if (operador == '*') {
          displayTexto = (valor1 * valor2).toString();
        } else if (operador == '/') {
          displayTexto = (valor2 != 0) ? (valor1 / valor2).toString() : 'Erro';
        }
        operador = '';
      } else {
        if (displayTexto == '0') {
          displayTexto = texto;
        } else {
          displayTexto += texto;
        }
      }
    });
  }

  Widget criarBotao(String texto) {
    return Expanded(
      child: OutlinedButton(
        onPressed: () => aoPressionar(texto),
        child: Text(
          texto,
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculadora'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.all(20),
              child: Text(
                displayTexto,
                style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Column(
            children: [
              Row(
                children: [
                  criarBotao('7'),
                  criarBotao('8'),
                  criarBotao('9'),
                  criarBotao('/')
                ],
              ),
              Row(
                children: [
                  criarBotao('4'),
                  criarBotao('5'),
                  criarBotao('6'),
                  criarBotao('*')
                ],
              ),
              Row(
                children: [
                  criarBotao('1'),
                  criarBotao('2'),
                  criarBotao('3'),
                  criarBotao('-')
                ],
              ),
              Row(
                children: [
                  criarBotao('.'),
                  criarBotao('0'),
                  criarBotao('00'),
                  criarBotao('+')
                ],
              ),
              Row(
                children: [
                  criarBotao('C'),
                  criarBotao('='),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

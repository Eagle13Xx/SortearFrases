import 'dart:math';
import 'package:flutter/material.dart';
import 'package:adaptive_dialog/adaptive_dialog.dart';

class Pagina extends StatefulWidget {
  const Pagina({super.key});

  @override
  State<Pagina> createState() => _PaginaState();
}

class _PaginaState extends State<Pagina> {
  final List<String> _frases = [''];
  String _fraseAtual = '';

  Future<void> _mostrarDialogoAdicionarFrase() async {
    final resultado = await showTextInputDialog(
      context: context,
      message: 'Digite a frase que deseja adicionar à sua lista de motivação:',
      textFields: const [
        DialogTextField(
          hintText: 'Digite sua frase aqui',
        ),
      ],
    );

    if (resultado != null && resultado.isNotEmpty) {
      setState(() {
        _frases.add(resultado[0]);
      });
    }
  }

  void _sortearFrase() {
    final random = Random();
    setState(() {
      _fraseAtual = _frases[random.nextInt(_frases.length)];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.add, color: Colors.black),
            onPressed: _mostrarDialogoAdicionarFrase,
          ),
        ],
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
        title: const Text(
          'Frase Motivacional de Hoje',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Frase motivacional de hoje:'),
              const SizedBox(height: 30),
              Text(
                _fraseAtual,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 35),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.blueAccent),
                onPressed: _sortearFrase,
                child: const Text(
                  'Sortear Frase',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
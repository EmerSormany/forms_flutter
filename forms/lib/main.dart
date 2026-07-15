import 'package:flutter/material.dart';
import 'package:forms/formulario1.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Selecione o formulário')),
        body: Material(
          child: Center(
            child: Builder(
              builder: (BuildContext novoContexto) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          novoContexto,
                          MaterialPageRoute(builder: (context) => Formulario()),
                        );
                      },
                      child: Text('Formulário Varios Inputs'),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

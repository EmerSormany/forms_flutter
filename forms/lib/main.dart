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
        appBar: AppBar(
          title: Text('Selecione o formulário'),
        ),
        body: Center(
          child: Formulario(),
        ),
      ),
    );
  }
}



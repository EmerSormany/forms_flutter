import 'package:flutter/material.dart';
import 'package:forms/formulario1.dart';
import 'package:forms/formulario2.dart';
import 'package:forms/formulario3.dart';

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
                    SizedBox(height: 8,),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          novoContexto,
                          MaterialPageRoute(builder: (context) => FormularioSelecoes()),
                        );
                      },
                      child: Text('Formulário Seleções'),
                    ),

                    SizedBox(height: 8,),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          novoContexto,
                          MaterialPageRoute(builder: (context) => FomularioNickname()),
                        );
                      },
                      child: Text('Formulário Nickname'),
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

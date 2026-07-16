import 'package:flutter/material.dart';
import 'package:forms/formulario_varios_inputs.dart';
import 'package:forms/formulario_selecoes.dart';
import 'package:forms/fomulario_nickname.dart';

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
                          MaterialPageRoute(builder: (context) => FormularioVariosInputs()),
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

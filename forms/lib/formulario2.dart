import 'package:flutter/material.dart';

class FormularioSelecoes extends StatefulWidget {
  const FormularioSelecoes({super.key});

  @override
  State<FormularioSelecoes> createState() => _FormularioSelecoes();
}

class _FormularioSelecoes extends State<FormularioSelecoes> {
  final _formkey = GlobalKey<FormState>();
  String? _cidadeValor;
  String? _paisValor;
  bool _checkboxTermos = false;
  String _generoValor = 'opcao1';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Formulário de Seleções')),
      body: SingleChildScrollView(
        child: Form(
          key: _formkey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              DropdownButtonFormField(
                decoration: InputDecoration(labelText: 'Cidade'),
                initialValue: _cidadeValor,
                items: ['Jaçanã', 'Cuité', 'Picuí'].map((String cidade) {
                  return DropdownMenuItem<String>(
                    value: cidade,
                    child: Text(cidade),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _cidadeValor = value;
                  });
                },
              ),

              SizedBox(height: 8),
              DropdownButtonFormField(
                decoration: InputDecoration(labelText: 'País'),
                initialValue: _paisValor,
                items: ['Noruega', 'Cabo Verde', 'Cuba'].map((String cidade) {
                  return DropdownMenuItem<String>(
                    value: cidade,
                    child: Text(cidade),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _paisValor = value;
                  });
                },
              ),

              SizedBox(height: 8),
              CheckboxListTile(
                dense: true,
                controlAffinity: ListTileControlAffinity.leading,
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Aceito os termos'),
                    Text('Obrigatório', selectionColor: Color.fromARGB(255, 255, 0, 0))
                  ],
                ),
                value: _checkboxTermos,
                onChanged: (valor) {
                  setState(() {
                    _checkboxTermos = valor!;
                  });
                },
              ),

              Text("Como você prefere ser chamado?"),
              
              Column(
                children: [
                  RadioListTile<String>(
                    title: Text('Sr.'),
                    value: 'Sr.',
                    groupValue: _generoValor,
                    onChanged: (valor) {
                      setState(() {
                        _generoValor = valor!;
                      });
                    },
                  ),

                  RadioListTile<String>(
                    title: Text('Sra.'),
                    value: 'Sra.',
                    groupValue: _generoValor,
                    onChanged: (valor) {
                      setState(() {
                        _generoValor = valor!;
                      });
                    },
                  ),

                  RadioListTile<String>(
                    title: Text('Não binário'),
                    value: 'Não binário',
                    groupValue: _generoValor,
                    onChanged: (valor) {
                      setState(() {
                        _generoValor = valor!;
                      });
                    },
                  ),
                ],
              ),
              SizedBox(height: 8),
              ElevatedButton(
                onPressed: () {
                  return;
                },
                child: const Text('Enviar'),
              ),

              SizedBox(height: 8),
            ],
          ),
        ),
      ),
    );
  }
}

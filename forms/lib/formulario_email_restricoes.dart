import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FormularioEmailRestricoes extends StatefulWidget {
  const FormularioEmailRestricoes({super.key});

  @override
  State<FormularioEmailRestricoes> createState() => _FormularioEmailRestricoesState();
}

class _FormularioEmailRestricoesState extends State<FormularioEmailRestricoes> {
  final _formkey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _senhaController = TextEditingController();


  bool _mostrarResultados = false;
  String _emailEnviado = '';
  String _senhaEnviada = '';
  String _forcaSenha = '';

  String _calcularForcaSenha(String senha) {
    int pontos = 0;


    if (senha.length >= 8 && senha.length <= 9) {
      pontos += 1;
    } else if (senha.length >= 10 && senha.length <= 12) {
      pontos += 2;
    } else if (senha.length >= 13) {
      pontos += 3;
    }

    if (RegExp(r'[a-z]').hasMatch(senha)) pontos += 1;
    if (RegExp(r'[A-Z]').hasMatch(senha)) pontos += 1;
    if (RegExp(r'[0-9]').hasMatch(senha)) pontos += 1;
    if (RegExp(r'[!@#\$%\^&\*]').hasMatch(senha)) pontos += 1; 

    if (pontos >= 3 && pontos <= 4) {
      return 'Frágil ($pontos pontos)';
    } else if (pontos >= 5 && pontos <= 6) {
      return 'Moderada ($pontos pontos)';
    } else if (pontos >= 7) {
      return 'Forte ($pontos pontos)';
    }
    
    return 'Muito Frágil ($pontos pontos)';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Formulário Email Restrições')),
      body: SingleChildScrollView( 
        padding: const EdgeInsets.all(16.0), 
        child: Form(
          key: _formkey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 8),
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: 'E-mail',
                  border: OutlineInputBorder(),
                ),
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'^[a-zA-Z0-9@\.]+$')),
                ],
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'O e-mail é obrigatório.';
                  }
                  return null;
                },
              ),
              
              const SizedBox(height: 16),
              
              TextFormField(
                controller: _senhaController,
                decoration: const InputDecoration(
                  labelText: 'Senha',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.visiblePassword,
                obscureText: true,
                validator: (value) {
                  if (value == null || value.length < 8 || value.length > 16) {
                    return 'Senha precisa ter entre 8 e 16 caracteres.';
                  }
                  if (!RegExp(r'[a-zA-Z]').hasMatch(value)) {
                    return 'A senha deve conter pelo menos uma letra.';
                  }
                  if (!RegExp(r'[0-9]').hasMatch(value)) {
                    return 'A senha deve conter pelo menos um número.';
                  }
                  return null;
                },
              ),
              
              const SizedBox(height: 16),
              
              ElevatedButton(
                onPressed: () {
                  if (_formkey.currentState!.validate()) {

                    setState(() {
                      _emailEnviado = _emailController.text;
                      _senhaEnviada = _senhaController.text;
                      _forcaSenha = _calcularForcaSenha(_senhaController.text);
                      _mostrarResultados = true;
                    });
                    
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Sucesso! Enviando...')),
                    );
                  } else {

                    setState(() {
                      _mostrarResultados = false;
                    });

                  }

                },
                child: const Text('Enviar'),
              ),
              const SizedBox(height: 32),
              
              if (_mostrarResultados) ...[
                const Divider(),
                const Text(
                  'Dados Enviados:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                
                TextFormField(
                  initialValue: _emailEnviado,
                  readOnly: true,
                  decoration: const InputDecoration(
                    labelText: 'E-mail Confirmado',
                    border: OutlineInputBorder(),
                    filled: true,
                  ),
                ),
                
                const SizedBox(height: 16),
                
                TextFormField(
                  initialValue: _senhaEnviada,
                  readOnly: true,
                  decoration: const InputDecoration(
                    labelText: 'Senha Confirmada',
                    border: OutlineInputBorder(),
                    filled: true,
                  ),
                ),
                
                const SizedBox(height: 16),
                
                TextFormField(
                  initialValue: _forcaSenha,
                  readOnly: true,
                  decoration: const InputDecoration(
                    labelText: 'Nível de Força da Senha',
                    border: OutlineInputBorder(),
                    filled: true,
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FomularioNickname extends StatefulWidget {
  const FomularioNickname({super.key});

  @override
  State<FomularioNickname> createState() => _FomularioNickname();
}

class _FomularioNickname extends State<FomularioNickname> {
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Formulário Nickname')),
      body: Form(
        key: _formkey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 8,),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Nickname',
                hintText: 'seuApelido', // terminar
                border: OutlineInputBorder(),
              ),

              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'^[a-zA-Z0-9_.-]+$')),
              ],
            ),
            SizedBox(height: 8,)
          ],
        ),
      ),
    );
  }
}

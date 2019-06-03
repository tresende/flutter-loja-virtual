import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SignupScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Criar Conta'),
        centerTitle: true,
      ),
      body: Form(
        key: _formKey,
        child: ListView(padding: EdgeInsets.all(16), children: <Widget>[
          TextFormField(
            decoration: InputDecoration(hintText: "Nome Completo"),
            validator: (text) {
              if (text.isEmpty) return 'Nome inválido';
            },
          ),
                    SizedBox(height: 16),
          TextFormField(
            decoration: InputDecoration(hintText: "E-mail"),
            keyboardType: TextInputType.emailAddress,
            validator: (text) {
              if (text.isEmpty || !text.contains('@')) return 'Email inválido';
            },
          ),
          SizedBox(height: 16),
          TextFormField(
            decoration: InputDecoration(hintText: "Senha"),
            obscureText: true,
            validator: (text) {
              if (text.isEmpty || text.length < 6) return 'Senha inválida';
            },
          ),
          SizedBox(height: 16),
                    TextFormField(
            decoration: InputDecoration(hintText: "Endereço Completo"),
            validator: (text) {
              if (text.isEmpty) return 'Endereço inválido';
            },
          ),
          SizedBox(height: 16),

          SizedBox(
              height: 46,
              child: RaisedButton(
                textColor: Colors.white,
                color: Theme.of(context).primaryColor,
                child: Text('Criar Conta', style: TextStyle(fontSize: 18)),
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    
                  }
                },
              ))
        ]),
      ),
    );
  }
}

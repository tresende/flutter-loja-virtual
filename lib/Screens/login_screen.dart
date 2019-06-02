import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LoginScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Entrar'),
        centerTitle: true,
        actions: <Widget>[
          FlatButton(
            textColor: Colors.white,
            child: Text('Criar Conta', style: TextStyle(fontSize: 15)),
            onPressed: () {},
          )
        ],
      ),
      body: Form(
        key: _formKey,
        child: ListView(padding: EdgeInsets.all(16), children: <Widget>[
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
          Align(
              alignment: Alignment.centerRight,
              child: FlatButton(
                padding: EdgeInsets.zero,
                onPressed: () {},
                child: Text(
                  'Esqueci Minha Senha',
                  textAlign: TextAlign.right,
                ),
              )),
          SizedBox(height: 16),
          SizedBox(
              height: 46,
              child: RaisedButton(
                textColor: Colors.white,
                color: Theme.of(context).primaryColor,
                child: Text('Entrar', style: TextStyle(fontSize: 18)),
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

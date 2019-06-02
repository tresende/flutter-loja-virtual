import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
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
        child: ListView(padding: EdgeInsets.all(16), children: <Widget>[
          TextFormField(
            decoration: InputDecoration(hintText: "E-mail"),
            keyboardType: TextInputType.emailAddress,
          ),
          SizedBox(height: 16),
          TextFormField(
            decoration: InputDecoration(hintText: "Senha"),
            obscureText: true,
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
              ))
        ]),
      ),
    );
  }
}

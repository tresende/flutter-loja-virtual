import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_loja_virtual/Screens/signup_screen.dart';
import 'package:flutter_loja_virtual/models/user_model.dart';
import 'package:scoped_model/scoped_model.dart';

import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _emailController = TextEditingController();
  final _passController = TextEditingController();

  void _onSuccess() {
    var delay = Duration(seconds: 2);
    this._scaffoldKey.currentState.showSnackBar(SnackBar(
          content: Text("Usuário Criado com sucesso!"),
          backgroundColor: Theme.of(context).primaryColor,
          duration: delay,
        ));
    Navigator.of(context).pop();

  }

  void _onFail() {
    var delay = Duration(seconds: 2);
    this._scaffoldKey.currentState.showSnackBar(SnackBar(
          content: Text("Falha ao entrar!"),
          backgroundColor: Colors.red,
          duration: delay,
        ));
    Future.delayed(delay);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('Entrar'),
        centerTitle: true,
        actions: <Widget>[
          FlatButton(
            textColor: Colors.white,
            child: Text('Criar Conta', style: TextStyle(fontSize: 15)),
            onPressed: () {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => SignupScreen()));
            },
          )
        ],
      ),
      body: ScopedModelDescendant<UserModel>(builder: (context, child, model) {
        if (model.isLoading) {
          return Center(child: CircularProgressIndicator());
        }
        return Form(
          key: _formKey,
          child: ListView(padding: EdgeInsets.all(16), children: <Widget>[
            TextFormField(
              controller: _emailController,
              decoration: InputDecoration(hintText: "E-mail"),
              keyboardType: TextInputType.emailAddress,
              validator: (text) {
                if (text.isEmpty || !text.contains('@'))
                  return 'Email inválido';
              },
            ),
            SizedBox(height: 16),
            TextFormField(
              controller: _passController,
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
                      if (_formKey.currentState.validate()) {}
                      model.signIn(
                          email: _emailController.text,
                          pass: _passController.text,
                          onSuccess: _onSuccess,
                          onFail: _onFail);
                    }))
          ]),
        );
      }),
    );
  }
}

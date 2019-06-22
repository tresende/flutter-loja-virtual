import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_loja_virtual/models/user_model.dart';
import 'package:scoped_model/scoped_model.dart';

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passController = TextEditingController();
  final _addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: Text('Criar Conta'),
          centerTitle: true,
        ),
        body: ScopedModelDescendant<UserModel>(
          builder: (context, child, model) {
            if (model.isLoading) {
              return Center(child: CircularProgressIndicator());
            }
            return Form(
              key: _formKey,
              child: ListView(padding: EdgeInsets.all(16), children: <Widget>[
                TextFormField(
                  controller: _nameController,
                  decoration: InputDecoration(hintText: "Nome Completo"),
                  validator: (text) {
                    if (text.isEmpty) return 'Nome inválido';
                  },
                ),
                SizedBox(height: 16),
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
                    if (text.isEmpty || text.length < 6)
                      return 'Senha inválida';
                  },
                ),
                SizedBox(height: 16),
                TextFormField(
                  controller: _addressController,
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
                      child:
                          Text('Criar Conta', style: TextStyle(fontSize: 18)),
                      onPressed: () {
                        if (_formKey.currentState.validate()) {
                          Map<String, dynamic> userData = {
                            "name": _nameController.text,
                            "email": _emailController.text,
                            "address": _addressController.text,
                          };
                          model.signUp(userData, _nameController.text,
                              _onSuccess, _onFail);
                        }
                      },
                    ))
              ]),
            );
          },
        ));
  }

  void _onSuccess() {
    var delay = Duration(seconds: 2);
    this._scaffoldKey.currentState.showSnackBar(SnackBar(
          content: Text("Usuário Criado com sucesso!"),
          backgroundColor: Theme.of(context).primaryColor,
          duration: delay,
        ));
    Future.delayed(delay);
  }

  void _onFail() {
    var delay = Duration(seconds: 2);
    this._scaffoldKey.currentState.showSnackBar(SnackBar(
          content: Text("Falha ao criar o usuário"),
          backgroundColor: Colors.red,
          duration: delay,
        ));
    Future.delayed(delay);
  }
}

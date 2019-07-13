import 'package:flutter/material.dart';
import 'package:flutter_loja_virtual/models/cart.dart';
import 'package:flutter_loja_virtual/models/user_model.dart';
import 'package:scoped_model/scoped_model.dart';

import 'Screens/home_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModel<UserModel>(
        model: new UserModel(),
        child:
            ScopedModelDescendant<UserModel>(builder: (context, child, model) {
          return ScopedModel<CartModel>(
            model: new CartModel(model),
            child: MaterialApp(
              title: "Flutter clothing",
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                  primarySwatch: Colors.blue,
                  primaryColor: Color.fromARGB(255, 4, 125, 141)),
              home: HomeScreen(),
            ),
          );
        }));
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_loja_virtual/models/cart.dart';
import 'package:flutter_loja_virtual/models/user_model.dart';
import 'package:scoped_model/scoped_model.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Meu Carrinho"),
        actions: <Widget>[
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.only(right: 8),
            child: ScopedModelDescendant<CartModel>(
                builder: (context, child, model) {
              int totalProducts = model.products.length ?? 0;
              return Text(
                "${totalProducts} ${totalProducts == 1 ? "Item" : "Items"}",
                style: TextStyle(fontSize: 17),
              );
            }),
          )
        ],
      ),
      body: ScopedModelDescendant<CartModel>(
        builder: (context, child, model) {
          var logged = UserModel.of(context).isLoggedIn();
          if (model.isLoading && logged) {
            return Center(child: CircularProgressIndicator());
          } else if (!logged) {
            return Container(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Icon(Icons.remove_shopping_cart,
                      size: 80, color: Theme.of(context).primaryColor),
                  SizedBox(height: 16),
                  Text("Faça o login para adicionar produtos",
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  SizedBox(height: 16),
                  RaisedButton(
                    onPressed: () {},
                    textColor: Colors.white,
                    color: Theme.of(context).primaryColor,
                    child: Text(
                      "Entrar",
                      style: TextStyle(fontSize: 18),
                    ),
                  )
                ],
              ),
            );
          }
        },
      ),
    );
  }
}

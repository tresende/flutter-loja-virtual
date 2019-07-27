import 'package:flutter/material.dart';
import 'package:flutter_loja_virtual/models/cart.dart';
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
    );
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_loja_virtual/models/cart_product.dart';
import 'package:flutter_loja_virtual/models/product.dart';

class CartTile extends StatelessWidget {
  final CartProduct cartProduct;

  CartTile(this.cartProduct);

  @override
  Widget build(BuildContext context) {
    Widget _buildContent() {
      return Row(
<<<<<<< HEAD
        mainAxisAlignment: MainAxisAlignment.center,
=======
>>>>>>> 80f33e4baa4cc6ff69d8a4b41161704a058f361b
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(8),
            width: 120,
            child: Image.network(cartProduct.productData.images[0],
                fit: BoxFit.cover),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(8),
              child: Column(
<<<<<<< HEAD
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
=======
>>>>>>> 80f33e4baa4cc6ff69d8a4b41161704a058f361b
                children: <Widget>[
                  Text(
                    cartProduct.productData.title,
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                  ),
                  Text(
                    "Tamanho ${cartProduct.size}",
                    style: TextStyle(fontWeight: FontWeight.w300),
                  ),
                  Text(
                    "R\$ ${cartProduct.productData.price.toStringAsFixed(2)}",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor),
                  ),
                  Row(
<<<<<<< HEAD
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      IconButton(
                        color: Theme.of(context).primaryColor,
                        icon: Icon(Icons.remove),
                        onPressed: cartProduct.quantity > 1 ? () {} : null,
                      ),
                      Text(cartProduct.quantity.toString()),
                      IconButton(
                        color: Theme.of(context).primaryColor,
=======
                    children: <Widget>[
                      IconButton(
                        icon: Icon(Icons.remove),
                        onPressed: () {},
                      ),
                      Text(cartProduct.quantity.toString()),
                      IconButton(
>>>>>>> 80f33e4baa4cc6ff69d8a4b41161704a058f361b
                        icon: Icon(Icons.add),
                        onPressed: () {},
                      ),
                      FlatButton(
                        child: Text("Remover"),
<<<<<<< HEAD
                        textColor: Colors.grey,
=======
                        color: Colors.grey,
>>>>>>> 80f33e4baa4cc6ff69d8a4b41161704a058f361b
                        onPressed: () {},
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      );
    }

    return Card(
        margin: EdgeInsets.symmetric(horizontal: 4, vertical: 8),
        child: cartProduct.productData == null
            ? FutureBuilder<DocumentSnapshot>(
                future: Firestore.instance
                    .collection("products")
                    .document(cartProduct.category)
                    .collection("items")
                    .document(cartProduct.pid)
                    .get(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    cartProduct.productData =
                        Product.fromDocument(snapshot.data);
                    return _buildContent();
                  } else {
                    return Container(
                        height: 70,
                        alignment: Alignment.center,
                        child: CircularProgressIndicator());
                  }
                })
            : _buildContent());
  }
}

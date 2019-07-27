import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_loja_virtual/Screens/login_screen.dart';
import 'package:flutter_loja_virtual/models/cart.dart';
import 'package:flutter_loja_virtual/models/cart_product.dart';
import 'package:flutter_loja_virtual/models/product.dart';
import 'package:flutter_loja_virtual/models/user_model.dart';

class ProductScreen extends StatefulWidget {
  final Product product;
  ProductScreen(this.product);

  @override
  _ProductScreenState createState() => _ProductScreenState(this.product);
}

class _ProductScreenState extends State<ProductScreen> {
  final Product product;

  String size;
  _ProductScreenState(this.product);

  @override
  Widget build(BuildContext context) {
    final Color primaryColor = Theme.of(context).primaryColor;

    return Scaffold(
      appBar: AppBar(
        title: Text(product.title),
        centerTitle: true,
      ),
      body: ListView(
        children: <Widget>[
          AspectRatio(
            aspectRatio: .9,
            child: Carousel(
              images:
                  this.product.images.map((url) => NetworkImage(url)).toList(),
              dotSize: 4,
              dotSpacing: 15,
              dotBgColor: Colors.transparent,
              dotColor: primaryColor,
              autoplay: false,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text(product.title,
                    maxLines: 3,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    )),
                Text("R\$ ${product.price.toStringAsFixed(2)}",
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: primaryColor)),
                SizedBox(
                  height: 16,
                ),
                Text("Tamanho",
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
                SizedBox(
                  height: 34,
                  child: GridView(
                    padding: EdgeInsets.symmetric(vertical: 4),
                    scrollDirection: Axis.horizontal,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 1,
                        crossAxisSpacing: 8,
                        childAspectRatio: 0.5),
                    children: this.product.sizes.map((s) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            size = s;
                          });
                        },
                        child: Container(
                          width: 100,
                          child: Text(s),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(4)),
                              border: Border.all(
                                  color: s == size
                                      ? primaryColor
                                      : Colors.grey[500],
                                  width: 3)),
                        ),
                      );
                    }).toList(),
                  ),
                ),
                SizedBox(height: 16),
                SizedBox(
                  height: 44,
                  child: RaisedButton(
                      color: primaryColor,
                      onPressed: size != null
                          ? () {
                              if (UserModel.of(context).isLoggedIn()) {
                                CartProduct cartProduct = new CartProduct();
                                cartProduct.size = size;
                                cartProduct.quantity = 1;
                                cartProduct.pid = product.id;
                                cartProduct.category = product.category;
                                cartProduct.productData = product;
                                CartModel.of(context).addCartItem(cartProduct);
                              } else {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => LoginScreen()));
                              }
                            }
                          : null,
                      textColor: Colors.white,
                      child: Text(
                          UserModel.of(context).isLoggedIn()
                              ? "Adicionar ao carrinho"
                              : "Entre para comprar",
                          style: TextStyle(fontSize: 18))),
                ),
                SizedBox(height: 16),
                Text("Descrição",
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
                Text(product.description, style: TextStyle(fontSize: 16)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

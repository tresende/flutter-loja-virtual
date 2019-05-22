import 'package:flutter/material.dart';
import 'package:flutter_loja_virtual/models/product.dart';

class ProductScreen extends StatefulWidget {
  final Product product;
  ProductScreen(this.product);

  @override
  _ProductScreenState createState() => _ProductScreenState(this.product);
}

class _ProductScreenState extends State<ProductScreen> {
  final Product product;
  _ProductScreenState(this.product);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

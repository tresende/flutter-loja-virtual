import 'package:flutter/material.dart';
import 'package:flutter_loja_virtual/models/product.dart';

class ProductTile extends StatelessWidget {
  final String type;
  final Product product;
  ProductTile(this.type, this.product);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        child: Card(
            child: this.type == "grid"
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      AspectRatio(
                        aspectRatio: 0.8,
                        child: Image.network(
                          this.product.images[0],
                          fit: BoxFit.cover,
                        ),
                      ),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.all(4.6),
                          child: Column(
                            children: <Widget>[
                              Text(
                                product.title,
                                style: TextStyle(fontWeight: FontWeight.w500),
                              ),
                              Text(
                                "R\$ ${product.price.toStringAsFixed(2)}",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17,
                                    color: Theme.of(context).primaryColor),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  )
                : Row(
                    children: <Widget>[
                      Flexible(
                        flex: 1,
                        child: Image.network(
                          this.product.images[0],
                          fit: BoxFit.cover,
                          height: 250,
                        ),
                      ),
                      Flexible(
                        flex: 1,
                        child: Container(
                          padding: EdgeInsets.all(4.6),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                product.title,
                                style: TextStyle(fontWeight: FontWeight.w500),
                              ),
                              Text(
                                "R\$ ${product.price.toStringAsFixed(2)}",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17,
                                    color: Theme.of(context).primaryColor),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  )));
  }
}

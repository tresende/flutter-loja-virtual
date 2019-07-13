import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_loja_virtual/models/product.dart';
import 'package:flutter_loja_virtual/tiles/product_tile.dart';

class CategoryScreen extends StatelessWidget {
  final DocumentSnapshot snapshot;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(snapshot.data["title"]),
          centerTitle: true,
          bottom: TabBar(
            indicatorColor: Colors.white,
            tabs: <Widget>[
              Tab(icon: Icon(Icons.grid_on)),
              Tab(icon: Icon(Icons.list)),
            ],
          ),
        ),
        body: FutureBuilder<QuerySnapshot>(
            future: Firestore.instance
                .collection("products")
                .document(snapshot.documentID)
                .collection("items")
                .getDocuments(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Center(child: CircularProgressIndicator());
              } else {
                return TabBarView(children: <Widget>[
                  GridView.builder(
                    padding: EdgeInsets.all(4),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 4,
                        mainAxisSpacing: 4,
                        childAspectRatio: 0.65),
                    itemCount: snapshot.data.documents.length,
                    itemBuilder: (context, index) {
                      var productData =
                          Product.fromDocument(snapshot.data.documents[index]);
                      productData.category = this.snapshot.documentID;
                      return ProductTile("grid", productData);
                    },
                  ),
                  ListView.builder(
                    padding: EdgeInsets.all(4),
                    itemCount: snapshot.data.documents.length,
                    itemBuilder: (context, index) {
                      var productData =
                          Product.fromDocument(snapshot.data.documents[index]);
                      productData.category = this.snapshot.documentID;
                      return ProductTile("list", productData);
                    },
                  ),
                ]);
              }
            }),
      ),
    );
  }

  CategoryScreen(this.snapshot);
}

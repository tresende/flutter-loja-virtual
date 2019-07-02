import 'package:cloud_firestore/cloud_firestore.dart';

class Product {
  String id;
  String title;
  String description;
  double price;
  List images;
  List sizes;
  String category;

  Product.fromDocument(DocumentSnapshot snapshot) {
    this.id = snapshot.documentID;
    this.title = snapshot.data['title'];
    this.description = snapshot.data['description'];
    this.price = snapshot.data['price'];
    this.images = snapshot.data['images'];
    this.sizes = snapshot.data['sizes'];
  }

  Map<String, dynamic> toResumedMap() {
    return {"title": title, "description": description, "price": price};
  }
}

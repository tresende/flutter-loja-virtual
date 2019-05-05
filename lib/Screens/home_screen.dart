import 'package:flutter/material.dart';
import 'package:flutter_loja_virtual/tabs/home_tab.dart';
import 'package:flutter_loja_virtual/tabs/products_tab.dart';
import 'package:flutter_loja_virtual/widgets/custom_drawer.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _pageController = PageController();

    return PageView(
      controller: _pageController,
      physics: NeverScrollableScrollPhysics(),
      children: <Widget>[
        Scaffold(
          body: HomeTab(),
          drawer: CustomDrawer(_pageController),
        ),
        Scaffold(
          appBar: AppBar(
            title: Text("Produtos"),
            centerTitle: true,
          ),
          drawer: CustomDrawer(_pageController),
          body: ProductsTab(),
        ),
        Container(color: Colors.yellow),
        Container(color: Colors.green),
      ],
    );
  }
}

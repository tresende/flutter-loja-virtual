import 'package:flutter/material.dart';
import 'package:flutter_loja_virtual/Tabs/home_tab.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

final _pageController = PageController();

    return PageView(
      controller: _pageController,
      physics: NeverScrollableScrollPhysics(

      ),
      children: <Widget>[
        HomeTab()
      ],
    );
  }
}
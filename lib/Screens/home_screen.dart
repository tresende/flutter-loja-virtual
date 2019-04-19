import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

final _pageController = PageController();

    return PageView(
      controller: _pageController,
      physics: NeverScrollableScrollPhysics(

      ),
      children: <Widget>[
        Container(
          color: Colors.yellow,
        ),Container(
          color: Colors.red,
        ),Container(
          color: Colors.green,
        )
      ],
    );
  }
}
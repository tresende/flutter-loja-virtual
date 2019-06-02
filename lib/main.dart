import 'package:flutter/material.dart';
import 'package:flutter_loja_virtual/Screens/login_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title:  "Flutter clothing",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: Color.fromARGB(255, 4, 125, 141)
      ),
      // home: HomeScreen(),
      home: LoginScreen()
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_3d/home_page.dart';
import 'package:flutter_3d/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter 3D',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //home: HomePage(),
      home: SplashScreen(),
    );
  }
}



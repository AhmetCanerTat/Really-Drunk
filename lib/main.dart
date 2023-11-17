import 'package:flutter/material.dart';
import 'package:reallydrunk/pages/home_page.dart';
import 'package:reallydrunk/pages/wheel_page.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lets get really drunk',
      debugShowCheckedModeBanner: false,
      home: Wheel(),
    );
  }
}

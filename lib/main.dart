import 'package:flutter/material.dart';
import 'package:reallydrunk/pages/home_page.dart';
import 'package:reallydrunk/widgets/wheel.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Lets get really drunk',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

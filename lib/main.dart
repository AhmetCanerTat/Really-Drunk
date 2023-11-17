import 'package:flutter/material.dart';
import 'package:reallydrunk/pages/home_page.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Ortalama Hesapla',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

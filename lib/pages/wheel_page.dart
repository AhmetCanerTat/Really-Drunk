import 'package:flutter/material.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';

class Wheel extends StatefulWidget {
  @override
  _WheelState createState() => _WheelState();
}

class _WheelState extends State<Wheel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FortuneWheel(items: const [
        FortuneItem(child: Text("Hi")),
        FortuneItem(child: Text("Hi")),
        FortuneItem(child: Text("Hi")),
        FortuneItem(child: Text("Hi"))
      ]),
    );
  }
}

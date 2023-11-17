import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';

class Wheel extends StatefulWidget {
  @override
  _WheelState createState() => _WheelState();
}

class _WheelState extends State<Wheel> {
  StreamController<int> selected = StreamController<int>();

  @override
  void dispose() {
    selected.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
        onTap: () {
          setState(() {
            selected.add(
              Fortune.randomInt(0, 4),
            );
          });
        },
        child: FortuneWheel(
            styleStrategy: const AlternatingStyleStrategy(),
            animateFirst: false,
            selected: selected.stream,
            items: const [
              FortuneItem(child: Text("Hi")),
              FortuneItem(child: Text("Hi")),
              FortuneItem(child: Text("Hi")),
              FortuneItem(child: Text("Hi"))
            ]));

  }
}

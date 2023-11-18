import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';

import 'package:reallydrunk/widgets/modal.dart';

// ignore: must_be_immutable
class Wheel extends StatefulWidget {
  final void Function() increaseTurn;

  Wheel({super.key, required this.increaseTurn});
  @override
  // ignore: library_private_types_in_public_api
  State<Wheel> createState() => _WheelState();
}

class _WheelState extends State<Wheel> {
  StreamController<int> selected = StreamController<int>();
  late int selectedOption = 0;

  @override
  void dispose() {
    selected.close();
    super.dispose();
  }

  void _showFullScreenModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      isDismissible: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
      ),
      builder: (BuildContext context) {
        return FullScreenModal();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final items = <String>[
      'Curse',
      'Minigame',
      'Give Sips',
    ];

    void delayedOption() {
      Future.delayed(const Duration(seconds: 5), () {
        _showFullScreenModal(context);
      });
    }

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedOption = Fortune.randomInt(0, items.length);
          selected.add(selectedOption);
          widget.increaseTurn();
          delayedOption();
        });
      },
      child: Column(
        children: [
          Expanded(
            child: FortuneWheel(
              animateFirst: false,
              selected: selected.stream,
              items: [
                for (var it in items) FortuneItem(child: Text(it)),
              ],
            ),
          ),
          Text(items[selectedOption])
        ],
      ),
    );
  }
}

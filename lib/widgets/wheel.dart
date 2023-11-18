import 'dart:async';
import 'dart:ffi';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';
import 'package:reallydrunk/library/library.dart';
import 'package:reallydrunk/model/option.dart';

import 'package:reallydrunk/widgets/modal.dart';

// ignore: must_be_immutable
class Wheel extends StatefulWidget {
  final void Function() increaseTurn;

  Wheel({super.key, required this.increaseTurn});
  @override
  // ignore: library_private_types_in_public_api
  State<Wheel> createState() => _WheelState();
}

class Item {
  String text = "";
  Color color = const Color(000000);
}

class _WheelState extends State<Wheel> {
  StreamController<int> selected = StreamController<int>();
  late int selectedOption = 0;

  @override
  void dispose() {
    selected.close();
    super.dispose();
  }

  void _showFullScreenModal(BuildContext context, Option option) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      isDismissible: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
      ),
      builder: (BuildContext context) {
        return FullScreenModal(
          option: option,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    bool isSpinning = false;
    Library library = Library();
    library.addCurses();
    library.addBlessings();
    library.addMinigamesMP();
    library.addMysteries();
    final items = <Item>[
      Item()
        ..text = "Take 2 Sips"
        ..color = Colors.blueAccent,
      Item()
        ..text = "Curse"
        ..color = const Color(0XFFDE3C4B),
      Item()
        ..text = "Minigame"
        ..color = const Color(0XFFF79D26),
      Item()
        ..text = "Take 2 Sips"
        ..color = Colors.blueAccent,
      Item()
        ..text = "Blessing"
        ..color = const Color(0XFF00A676),
      Item()
        ..text = "Mystery"
        ..color = const Color(0XFF74226C),
      Item()
        ..text = "Take 2 Sips"
        ..color = Colors.blueAccent,
      Item()
        ..text = "Curse"
        ..color = const Color(0XFFDE3C4B),
      Item()
        ..text = "Minigame"
        ..color = const Color(0XFFF79D26),
      Item()
        ..text = "Take 2 Sips"
        ..color = Colors.blueAccent,
      Item()
        ..text = "Blessing"
        ..color = const Color(0XFF00A676),
      Item()
        ..text = "Mystery"
        ..color = const Color(0XFF74226C),
    ];

    Option pickOption() {
      if (items[selectedOption].text == "Curse") {
        return library.curseList[Random().nextInt(library.curseList.length)];
      } else if (items[selectedOption].text == "Blessing") {
        return library
            .blessingList[Random().nextInt(library.blessingList.length)];
      } else if (items[selectedOption].text == "Mystery") {
        return library
            .mysteryList[Random().nextInt(library.mysteryList.length)];
      } else {
        return library
            .minigameMPList[Random().nextInt(library.minigameMPList.length)];
      }
    }

    void delayedOption() {
      Future.delayed(const Duration(seconds: 5), () {
        _showFullScreenModal(context, pickOption());
      });
    }

    return GestureDetector(
      onTap: () {
        if (!isSpinning) {
          setState(() {
            selectedOption = Fortune.randomInt(0, items.length);
            selected.add(selectedOption);
            widget.increaseTurn();
            delayedOption();
            isSpinning = true;
          });
          Timer(const Duration(seconds: 6), () {
            setState(() {
              isSpinning = false;
            });
          });
        }
      },
      child: Column(
        children: [
          Expanded(
            child: FortuneWheel(
              animateFirst: false,
              selected: selected.stream,
              items: [
                for (var it in items)
                  FortuneItem(
                      child: Text(it.text),
                      style: FortuneItemStyle(
                          color: it.color,
                          borderColor: const Color(0XFF353531),
                          borderWidth: 4)),
              ],
            ),
          ),
          Text(items[selectedOption].text)
        ],
      ),
    );
  }
}

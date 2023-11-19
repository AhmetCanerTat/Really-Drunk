import 'dart:async';
import 'dart:ffi';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';
import 'package:reallydrunk/library/library.dart';
import 'package:reallydrunk/model/blessing.dart';
import 'package:reallydrunk/model/curse.dart';
import 'package:reallydrunk/model/minigamemp.dart';
import 'package:reallydrunk/model/mystery.dart';
import 'package:reallydrunk/model/option.dart';
import 'package:reallydrunk/model/takesip.dart';

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
  late Library library;
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
  void initState() {
    // TODO: implement initState
    super.initState();
    library = Library();
    library.addCurses();
    library.addBlessings();
    library.addMinigamesMP();
    library.addMysteries();
  }

  @override
  Widget build(BuildContext context) {
    bool isSpinning = false;

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

    Curse randomCurse() {
      double random = Random().nextDouble() * library.totalCurseProbability;
      double accumulator = 0.0;
      for (Curse curse in library.curseList) {
        accumulator += curse.probability;
        if (random < accumulator) {
          return curse;
        }
      }
      return library.curseList.last;
    }

    Blessing randomBlessing() {
      double random = Random().nextDouble() * library.totalBlessingProbability;
      double accumulator = 0.0;
      for (Blessing blessing in library.blessingList) {
        accumulator += blessing.probability;
        if (random < accumulator) {
          return blessing;
        }
      }
      return library.blessingList.last;
    }

    Mystery randomMystery() {
      double random = Random().nextDouble() * library.totalMysteryProbability;
      double accumulator = 0.0;
      for (Mystery mystery in library.mysteryList) {
        accumulator += mystery.probability;
        if (random < accumulator) {
          return mystery;
        }
      }
      return library.mysteryList.last;
    }

    MinigameMP randomMinigameMP() {
      double random = Random().nextDouble() * library.totalMinigameProbability;
      double accumulator = 0.0;
      for (MinigameMP minigameMP in library.minigameMPList) {
        accumulator += minigameMP.probability;
        if (random < accumulator) {
          return minigameMP;
        }
      }
      return library.minigameMPList.last;
    }

    Curse curse = randomCurse();
    Blessing blessing = randomBlessing();
    Mystery mystery = randomMystery();
    MinigameMP minigameMP = randomMinigameMP();
    Curse pickCurse() {
      while (1 > 0) {
        Curse curse = randomCurse();
        if (library.lastCurses.contains(curse)) {
          continue;
        } else {
          library.lastCurses.add(curse);
          if (library.lastCurses.length > 3) {
            library.lastCurses.removeAt(0);
          }
          return curse;
        }
      }
      return curse;
    }

    Blessing pickBlessing() {
      while (1 > 0) {
        blessing = randomBlessing();
        if (library.lastBlessings.contains(blessing)) {
          continue;
        } else {
          library.lastBlessings.add(blessing);
          if (library.lastBlessings.length > 3) {
            library.lastBlessings.removeAt(0);
          }
          return blessing;
        }
      }
      return blessing;
    }

    Mystery pickMystery() {
      while (1 > 0) {
        mystery = randomMystery();
        if (library.lastMysteries.contains(mystery)) {
          continue;
        } else {
          library.lastMysteries.add(mystery);
          if (library.lastMysteries.length > 3) {
            library.lastMysteries.removeAt(0);
          }
          return mystery;
        }
      }
      return mystery;
    }

    MinigameMP pickMinigameMP() {
      while (1 > 0) {
        minigameMP = randomMinigameMP();
        if (library.lastMinigames.contains(minigameMP)) {
          continue;
        } else {
          library.lastMinigames.add(minigameMP);
          if (library.lastMinigames.length > 3) {
            library.lastMinigames.removeAt(0);
          }
          return minigameMP;
        }
      }
      return minigameMP;
    }

    Option pickOption() {
      if (items[selectedOption].text == "Curse") {
        return pickCurse();
      } else if (items[selectedOption].text == "Blessing") {
        return pickBlessing();
      } else if (items[selectedOption].text == "Mystery") {
        return pickMystery();
      } else if (items[selectedOption].text == "Minigame") {
        return pickMinigameMP();
      }
      return TakeSip("Take sip", "Take sip");
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
        ],
      ),
    );
  }
}

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:reallydrunk/library/library.dart';
import 'package:reallydrunk/model/curse.dart';
import 'package:reallydrunk/widgets/rockpaper.dart';

class FullScreenModal extends StatelessWidget {
  Library library = Library();

  @override
  Widget build(BuildContext context) {
    library.addCurses();
    Curse curse = library.curseList[Random().nextInt(library.curseList.length)];

    return GestureDetector(
      onTap: () {
        Navigator.pop(context); // Close the modal if tapped outside
      },
      child: Material(
        color: Colors.transparent,
        child: RockPaper(),
      ),
    );
  }

  Column curseMethod(Curse curse) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Expanded(
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Center(
                  child: Text(
                    curse.name,
                    style: const TextStyle(fontSize: 50),
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Center(
                    child: Text(
                      curse.description,
                      style: const TextStyle(fontSize: 30),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    "For ${curse.turn} turns",
                    style: const TextStyle(fontSize: 30),
                  ),
                )
                // Add more widgets for the modal content
              ],
            ),
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:reallydrunk/model/curse.dart';

class CurseModal extends StatelessWidget {
  Curse curse;
  CurseModal({super.key, required this.curse});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Expanded(
          child: Container(
            decoration: const BoxDecoration(
              color: Color(0XFFDE3C4B),
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

import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class RockPaper extends StatefulWidget {
  const RockPaper({super.key});

  @override
  State<RockPaper> createState() => _RockPaperState();
}

class _RockPaperState extends State<RockPaper> {
  bool showAnswer = false;
  bool buttonActive = false;
  int _countdown = 4;
  late Timer _timer;
  String answer = "";
  void rockPaperScissors(String option) {
    int rand = Random().nextInt(10);
    if (option == "Rock") {
      rand == 0 ? answer = "Scissors" : answer = "Paper";
    } else if (option == "Paper") {
      rand == 0 ? answer = "Rock" : answer = "Scissors";
    } else if (option == "Scissors") {
      rand == 0 ? answer = "Paper" : answer = "Rock";
    }
    setState(() {});
  }

  void startCountdown(String option) {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_countdown > 1) {
        setState(() {
          _countdown--;
        });
      } else {
        _timer.cancel(); // Cancel the timer when countdown reaches 0
        rockPaperScissors(option);
        buttonActive = true;
        showAnswer = true;
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel(); // Cancel the timer when the widget is disposed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0XFFF79D26),
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(),
          const Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "Rock Paper Scissors",
                  style: TextStyle(fontSize: 50),
                  textAlign: TextAlign.center,
                ),
              )),
          Expanded(
            flex: 2,
            child: Center(
              child: _countdown == 4
                  ? null
                  : Text(showAnswer ? answer : _countdown.toString(),
                      style: const TextStyle(fontSize: 30)),
            ),
          ),
          const Spacer(),
          Expanded(
            flex: 2,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          startCountdown("Rock");
                        },
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Colors.white60)),
                        child: const Text("Rock"),
                      ),
                      ElevatedButton(
                          onPressed: () {
                            startCountdown("Paper");
                          },
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.white60)),
                          child: const Text("Paper")),
                      ElevatedButton(
                          onPressed: () {
                            startCountdown("Scissors");
                          },
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.white60)),
                          child: const Text(
                            "Scissors",
                          ))
                    ]),
              ),
            ),
          ),
          buttonActive
              ? Center(
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 30),
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text("Continue")),
                  ),
                )
              : const Spacer()
        ],
      ),
    );
  }
}

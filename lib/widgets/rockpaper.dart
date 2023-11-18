import 'package:flutter/material.dart';

class RockPaper extends StatefulWidget {
  const RockPaper({super.key});

  @override
  State<RockPaper> createState() => _RockPaperState();
}

class _RockPaperState extends State<RockPaper> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.blueAccent,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(),
          const Expanded(
              child: Text(
            "Rock Paper Scissors",
            style: TextStyle(fontSize: 30),
          )),
          const Expanded(
            flex: 2,
            child: Center(
              child: Text("Answer"),
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
                        onPressed: null,
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Colors.white60)),
                        child: const Text("Rock"),
                      ),
                      ElevatedButton(
                          onPressed: null,
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.white60)),
                          child: const Text("Paper")),
                      ElevatedButton(
                          onPressed: null,
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.white60)),
                          child: const Text("Paper"))
                    ]),
              ),
            ),
          ),
          const Spacer()
        ],
      ),
    );
  }
}

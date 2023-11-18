import 'package:flutter/material.dart';
import 'package:reallydrunk/model/player.dart';
import 'package:reallydrunk/widgets/wheel.dart';

// ignore: must_be_immutable
class WheelyPage extends StatefulWidget {
  List<Player> players;
  WheelyPage({super.key, required this.players});

  @override
  State<WheelyPage> createState() => _WheelyPageState();
}

class _WheelyPageState extends State<WheelyPage> {
  int turnCount = 0;
  void increaseTurn() {
    setState(() {
      turnCount += 1;
    });
  }

  void delayedFunction() {
    Future.delayed(const Duration(seconds: 6), () {
      increaseTurn();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFF353531),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: Column(children: [
        Center(
          child: Text(
            widget.players[turnCount % widget.players.length].name,
            style: const TextStyle(
                color: Color(0XFFF79519),
                fontSize: 30,
                fontWeight: FontWeight.bold),
          ),
        ),
        Expanded(
          flex: 3,
          child: Container(
              margin: const EdgeInsets.all(10),
              child: Wheel(
                increaseTurn: delayedFunction,
              )),
        ),
        Expanded(child: BottomList(players: widget.players))
      ]),
    );
  }
}

// ignore: must_be_immutable
class BottomList extends StatelessWidget {
  List<Player> players;
  BottomList({super.key, required this.players});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 300,
        child: ElevatedButton(
          child: const Text('Players'),
          onPressed: () {
            showModalBottomSheet<void>(
              context: context,
              builder: (BuildContext context) {
                return Container(
                  height: 300,
                  color: Color(0XFFF79519),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Expanded(
                            child: players.isNotEmpty
                                ? ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: players.length,
                                    itemBuilder: ((context, index) => Center(
                                            child: Text(
                                          players[index].name,
                                          style: const TextStyle(
                                              fontSize: 30,
                                              color: Colors.white),
                                        ))))
                                : Container()),
                        Container(
                          margin: const EdgeInsets.only(bottom: 20),
                          child: ElevatedButton(
                            child: const Text('Close'),
                            onPressed: () => Navigator.pop(context),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}

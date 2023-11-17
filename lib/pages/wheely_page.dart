import 'package:flutter/material.dart';

// ignore: must_be_immutable
class WheelyPage extends StatefulWidget {
  List<String> persons;
  WheelyPage({super.key, required this.persons});

  @override
  State<WheelyPage> createState() => _WheelyPageState();
}

class _WheelyPageState extends State<WheelyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(children: [
        Center(
          child: Text(
            widget.persons[0],
            style: const TextStyle(color: Colors.amber, fontSize: 30),
          ),
        ),
        BottomList(persons: widget.persons)
      ]),
    );
  }
}

// ignore: must_be_immutable
class BottomList extends StatelessWidget {
  List<String> persons;
  BottomList({super.key, required this.persons});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 300,
        child: ElevatedButton(
          child: const Text('Players'),
          onPressed: () {
            showModalBottomSheet<void>(
              context: context,
              builder: (BuildContext context) {
                return Container(
                  height: 300,
                  color: Colors.amber,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Expanded(
                            child: persons.isNotEmpty
                                ? ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: persons.length,
                                    itemBuilder: ((context, index) => Center(
                                            child: Text(
                                          persons[index],
                                          style: const TextStyle(
                                              fontSize: 30,
                                              color: Colors.white),
                                        ))))
                                : Container()),
                        Container(
                          margin: EdgeInsets.only(bottom: 20),
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

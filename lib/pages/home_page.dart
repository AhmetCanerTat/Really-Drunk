import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late TextEditingController _controller;
  List<String> Persons = [];
  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void savePerson() {
    Persons.add(_controller.text);
    _controller.clear();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Center(
          child: Text(
            "Let's Get Really Drunk",
            style: TextStyle(
                color: Colors.amber, fontSize: 24, fontWeight: FontWeight.w400),
          ),
        ),
      ),
      body: Column(children: [
        const Spacer(
          flex: 1,
        ),
        Expanded(
            flex: 2,
            child: Column(
              children: [
                Container(
                  width: 200,
                  margin: const EdgeInsets.all(10),
                  child: TextField(controller: _controller),
                ),
                ElevatedButton(
                    onPressed: savePerson, child: const Text("Submit"))
              ],
            )),
        Spacer(),
        Expanded(
            flex: 4,
            child: Persons.isNotEmpty
                ? ListView.builder(
                    itemCount: Persons.length,
                    itemBuilder: ((context, index) => Center(
                            child: Text(
                          Persons[index],
                          style: const TextStyle(
                              fontSize: 30, color: Colors.orange),
                        ))))
                : Container()),
        Center(
            child: Container(
                margin: const EdgeInsets.all(50),
                child: const ElevatedButton(
                  onPressed: null,
                  child: Text("Play!"),
                )))
      ]),
    );
  }
}

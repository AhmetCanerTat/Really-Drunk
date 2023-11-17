import 'package:flutter/material.dart';
import 'package:reallydrunk/pages/wheely_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late TextEditingController _controller;
  List<String> persons = [];
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
    _controller.text.isNotEmpty ? persons.add(_controller.text) : null;
    _controller.clear();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
        const Spacer(),
        Expanded(
            flex: 4,
            child: persons.isNotEmpty
                ? ListView.builder(
                    itemCount: persons.length,
                    itemBuilder: ((context, index) => Center(
                            child: Text(
                          persons[index],
                          style: const TextStyle(
                              fontSize: 30, color: Colors.orange),
                        ))))
                : Container()),
        Center(
            child: Container(
                margin: const EdgeInsets.all(50),
                child: ElevatedButton(
                  onPressed: persons.isEmpty
                      ? null
                      : () {
                          Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          WheelyPage(persons: persons)))
                              .then((value) => setState(() {}));
                        },
                  child: const Text("Play!"),
                )))
      ]),
    );
  }
}

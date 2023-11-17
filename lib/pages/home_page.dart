import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late TextEditingController _controller;
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
        const Spacer(),
        Expanded(
            child: Column(
          children: [
            Container(
              width: 200,
              child: TextField(controller: _controller),
              margin: const EdgeInsets.all(10),
            ),
            const ElevatedButton(onPressed: null, child: Text("Submit"))
          ],
        )),
        Expanded(child: Container())
      ]),
    );
  }
}

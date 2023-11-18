import 'package:flutter/material.dart';
import 'package:reallydrunk/library/library.dart';

class FullScreenModal extends StatelessWidget {
  Library library = Library();

  @override
  Widget build(BuildContext context) {
    library.addCurses();
    return GestureDetector(
      onTap: () {
        Navigator.pop(context); // Close the modal if tapped outside
      },
      child: Material(
        color: Colors.transparent,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.red,
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(20.0)),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Center(
                      child: Text(library.curseList[0].name),
                    )
                    // Add more widgets for the modal content
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

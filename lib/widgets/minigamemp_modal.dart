import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:reallydrunk/model/minigamemp.dart';

class MinigameMPModal extends StatefulWidget {
  MinigameMP minigameMP;
  MinigameMPModal({super.key, required this.minigameMP});

  @override
  State<MinigameMPModal> createState() => _MinigameMPModalState();
}

class _MinigameMPModalState extends State<MinigameMPModal> {
  final int _duration = 10;
  final CountDownController _controller = CountDownController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller.start();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Expanded(
          child: GestureDetector(
            onTap: () {
              _controller.start();
            },
            child: Container(
              decoration: const BoxDecoration(
                color: Color(0XFFF79D26),
                borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Center(
                    child: Text(
                      widget.minigameMP.name,
                      style: const TextStyle(fontSize: 50),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  CircularCountDownTimer(
                    // Countdown duration in Seconds.
                    duration: widget.minigameMP.time,

                    // Countdown initial elapsed Duration in Seconds.
                    initialDuration: 0,

                    // Controls (i.e Start, Pause, Resume, Restart) the Countdown Timer.
                    controller: _controller,

                    // Width of the Countdown Widget.
                    width: MediaQuery.of(context).size.width / 3,

                    // Height of the Countdown Widget.
                    height: MediaQuery.of(context).size.height / 3,

                    // Ring Color for Countdown Widget.
                    ringColor: Colors.grey[300]!,

                    // Ring Gradient for Countdown Widget.
                    ringGradient: null,

                    // Filling Color for Countdown Widget.
                    fillColor: Colors.amber[100]!,

                    // Filling Gradient for Countdown Widget.
                    fillGradient: null,

                    // Background Color for Countdown Widget.
                    backgroundColor: Colors.amber[500],

                    // Background Gradient for Countdown Widget.
                    backgroundGradient: null,

                    // Border Thickness of the Countdown Ring.
                    strokeWidth: 20.0,

                    // Begin and end contours with a flat edge and no extension.
                    strokeCap: StrokeCap.round,

                    // Text Style for Countdown Text.
                    textStyle: const TextStyle(
                      fontSize: 33.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),

                    // Format for the Countdown Text.
                    textFormat: CountdownTextFormat.S,

                    // Handles Countdown Timer (true for Reverse Countdown (max to 0), false for Forward Countdown (0 to max)).
                    isReverse: true,

                    // Handles Animation Direction (true for Reverse Animation, false for Forward Animation).
                    isReverseAnimation: false,

                    // Handles visibility of the Countdown Text.
                    isTimerTextShown: true,

                    // Handles the timer start.
                    autoStart: false,

                    // This Callback will execute when the Countdown Starts.
                    onStart: () {
                      // Here, do whatever you want
                      debugPrint('Countdown Started');
                    },

                    // This Callback will execute when the Countdown Ends.
                    onComplete: () {
                      // Here, do whatever you want
                      Navigator.pop(context);
                    },

                    // This Callback will execute when the Countdown Changes.
                    onChange: (String timeStamp) {
                      // Here, do whatever you want
                      debugPrint('Countdown Changed $timeStamp');
                    },

                    /* 
              * Function to format the text.
              * Allows you to format the current duration to any String.
              * It also provides the default function in case you want to format specific moments
                as in reverse when reaching '0' show 'GO', and for the rest of the instances follow 
                the default behavior.
            */
                    timeFormatterFunction:
                        (defaultFormatterFunction, duration) {
                      if (duration.inSeconds == widget.minigameMP.time) {
                        // only format for '0'
                        return "Start";
                      } else {
                        // other durations by it's default format
                        return Function.apply(
                            defaultFormatterFunction, [duration]);
                      }
                    },
                  ),

                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Center(
                      child: Text(
                        widget.minigameMP.description,
                        style: const TextStyle(fontSize: 30),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 50,
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text("Exit")),
                  )

                  // Add more widgets for the modal content
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

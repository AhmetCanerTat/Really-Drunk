import 'package:flutter/material.dart';
import 'package:reallydrunk/library/library.dart';
import 'package:reallydrunk/model/blessing.dart';
import 'package:reallydrunk/model/curse.dart';
import 'package:reallydrunk/model/minigamemp.dart';
import 'package:reallydrunk/model/mystery.dart';
import 'package:reallydrunk/model/option.dart';
import 'package:reallydrunk/widgets/blessing_modal.dart';
import 'package:reallydrunk/widgets/curse_modal.dart';
import 'package:reallydrunk/widgets/minigamemp_modal.dart';
import 'package:reallydrunk/widgets/mystery_modal.dart';

import 'package:reallydrunk/widgets/takesip.dart';

// ignore: must_be_immutable
class FullScreenModal extends StatelessWidget {
  Library library = Library();
  Option option;
  FullScreenModal({super.key, required this.option});

  Widget chooseOption(Option option) {
    Widget selectedWidget = const Text("test");
    if (option.type == "Curse") {
      Curse curse = option as Curse;
      selectedWidget = CurseModal(curse: curse);
    } else if (option.type == "MinigameMP") {
      MinigameMP minigameMP = option as MinigameMP;
      selectedWidget = MinigameMPModal(minigameMP: minigameMP);
    } else if (option.type == "Mystery") {
      Mystery mystery = option as Mystery;
      selectedWidget = MysteryModal(mystery: mystery);
    } else if (option.type == "Blessing") {
      Blessing blessing = option as Blessing;
      selectedWidget = BlessingModal(blessing: blessing);
    } else {
      selectedWidget = TakeSip();
    }
    return selectedWidget;
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: chooseOption(option),
    );
  }
}

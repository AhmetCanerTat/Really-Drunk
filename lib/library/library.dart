import 'package:reallydrunk/model/blessing.dart';
import 'package:reallydrunk/model/curse.dart';
import 'package:reallydrunk/model/minigame.dart';
import 'package:reallydrunk/model/mystery.dart';

class Library {
  List<Curse> curseList = [];
  List<Minigame> minigameList = [];
  List<Blessing> blessingList = [];
  List<Mystery> mysteryList = [];

  void addCurses() {
    curseList.add(Curse("You have to sit on the ground", "Too Comfortable", 5));
    curseList
        .add(Curse("You cannot speak! If you do, take 5 sips.", "Silence", 5));
    curseList.add(
        Curse("All sips that you receive are doubled", "Double or Nothing", 5));
    curseList.add(Curse(
        "Everytime someone drinks you must also drink (half the amount)",
        "Empathy",
        3));
    curseList
        .add(Curse("You must drink without using your hands.", "Amputee", 3));
  }
}

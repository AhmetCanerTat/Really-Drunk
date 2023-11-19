import 'package:reallydrunk/model/blessing.dart';
import 'package:reallydrunk/model/curse.dart';
import 'package:reallydrunk/model/minigamemp.dart';
import 'package:reallydrunk/model/mystery.dart';

class Library {
  List<Curse> curseList = [];
  List<MinigameMP> minigameMPList = [];
  List<Blessing> blessingList = [];
  List<Mystery> mysteryList = [];
  double totalCurseProbability = 0,
      totalMinigameProbability = 0,
      totalBlessingProbability = 0,
      totalMysteryProbability = 0;

  void addCurses() {
    curseList.add(Curse("You have sit on anything other than a chair",
        "Too Comfortable", 5, 0.2));
    curseList.add(
        Curse("You cannot speak! If you do, take 5 sips.", "Silence", 5, 0.2));
    curseList.add(Curse(
        "All sips that you receive are doubled", "Double or Nothing", 5, 0.05));
    curseList.add(Curse(
        "Everytime someone drinks you must also drink (half the amount)",
        "Empathy",
        3,
        0.3));
    curseList.add(
        Curse("You must drink without using your hands.", "Amputee", 3, 0.05));
    curseList.add(Curse(
        "You have to drink whenever the person on your left has to drink",
        "False Love",
        5,
        0.2));
    curseList.add(Curse("Everytime you drink you have get up and spin 3 times",
        "Beyblade", 3, 0.15));
    curseList.add(Curse("You have dinosaur hands", "Chicken?", 5, 0.15));
    for (Curse curse in curseList) {
      totalCurseProbability += curse.probability;
    }
  }

  void addMinigamesMP() {
    minigameMPList.add(MinigameMP(
        "You are it, play tag with the person on your left for 10 seconds. Whoever is 'it' at the end must drink 5 sips",
        "Tag",
        10,
        0.2));
    minigameMPList.add(MinigameMP(
        "The last player touching the floor must drink 5 sips.",
        "The floor is Lava",
        8,
        0.2));
    minigameMPList.add(
        MinigameMP("You have to stand on your one foot", "One Leg", 20, 0.2));
    minigameMPList.add(MinigameMP(
        "You have to arm wrestle the person on your left ",
        "Arm Wrestle",
        180,
        0.2));
    minigameMPList.add(MinigameMP(
        "Staring Contest the person on your left ", "Eyes dont lie", 30, 0.2));

    for (MinigameMP minigameMP in minigameMPList) {
      totalMinigameProbability += minigameMP.probability;
    }
  }

  void addMysteries() {
    mysteryList.add(Mystery("Last person in the room must finish their drink.",
        "Evacuate", 0, 0.19));
    mysteryList.add(Mystery("Every player must take 2 sips", "Toast", 0, 0.5));
    mysteryList.add(Mystery("You must finish your drink.", "Unlucky", 0, 0.01));
    mysteryList.add(Mystery(
        "Everyone go silent. First to talk must take 3 sips.",
        "Awkward",
        0,
        0.3));
    for (Mystery mystery in mysteryList) {
      totalMysteryProbability += mystery.probability;
    }
  }

  void addBlessings() {
    blessingList.add(
        Blessing("Any curses you currently have are gone", "Cure", 0, 0.25));
    blessingList.add(Blessing("Give another player 3 sips", "Gift", 0, 0.25));
    blessingList.add(Blessing(
        "Next time you drink you can pass it to someone", "Reflect", 0, 0.25));
    blessingList.add(Blessing(
        "Choose two player to be mate, whenever one drink other has to drink aswell",
        "Cupid",
        0,
        0.25));
    for (Blessing blessing in blessingList) {
      totalBlessingProbability += blessing.probability;
    }
  }
}

import 'package:reallydrunk/model/blessing.dart';
import 'package:reallydrunk/model/curse.dart';
import 'package:reallydrunk/model/minigamemp.dart';
import 'package:reallydrunk/model/mystery.dart';

class Library {
  List<Curse> curseList = [];
  List<MinigameMP> minigameMPList = [];
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
    curseList.add(Curse(
        "You have to drink whenever the person on your left has to drink",
        "False Love",
        5));
    curseList.add(Curse(
        "Everytime you drink you have get up and spin 3 times", "Beyblade", 3));
    curseList.add(Curse("You have dinosaur hands", "Chicken?", 5));
  }

  void addMinigamesMP() {
    minigameMPList.add(MinigameMP(
        "You are it, play tag with the person on your left for 10 seconds. Whoever is 'it' at the end must drink 5 sips",
        "Tag",
        10));
    minigameMPList.add(MinigameMP(
        "The last player touching the floor must drink 5 sips.",
        "The floor is Lava",
        8));
    minigameMPList
        .add(MinigameMP("You have to stand on your one foot", "One Leg", 20));
    minigameMPList.add(MinigameMP(
        "You have to arm wrestle the person on your left ",
        "Arm Wrestle",
        180));
    minigameMPList.add(MinigameMP(
        "Staring Contest the person on your left ", "Eyes dont lie", 30));
  }

  void addMysteries() {
    mysteryList.add(Mystery(
        "Last person in the room must finish their drink.", "Evacuate", 0));
    mysteryList.add(Mystery("Every player must take 2 sips", "Toast", 0));
    mysteryList.add(Mystery("You must finish your drink.", "Unlucky", 0));
    mysteryList.add(Mystery("Drink some water B*tch", "Hydration", 0));
    mysteryList.add(Mystery(
        "Everyone go silent. First to talk must take 3 sips.", "Awkward", 0));
  }

  void addBlessings() {
    blessingList
        .add(Blessing("Any curses you currently have are gone", "Cure", 0));
    blessingList.add(Blessing("Give another player 3 sips", "Gift", 0));
    blessingList.add(Blessing(
        "Next time you drink you can pass it to someone", "Reflect", 0));
    blessingList.add(Blessing(
        "Choose two player to be mate, whenever one drink other has to drink aswell",
        "Cupid",
        0));
  }
}

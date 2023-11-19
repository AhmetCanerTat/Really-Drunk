import 'package:reallydrunk/model/option.dart';

class MinigameMP extends Option {
  late int time;

  MinigameMP(String description, String name, this.time, double probability)
      : super(name, description, "MinigameMP", probability);
}

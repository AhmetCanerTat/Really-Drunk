import 'package:reallydrunk/model/option.dart';

class Mystery extends Option {
  late int turn;
  Mystery(String description, String name, this.turn, double probability)
      : super(name, description, "Mystery", probability);
}

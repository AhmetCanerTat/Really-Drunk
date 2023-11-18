import 'package:reallydrunk/model/option.dart';

class Curse extends Option {
  late int turn;
  Curse(String description, String name, this.turn)
      : super(name, description, "Curse");
}

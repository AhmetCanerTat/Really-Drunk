import 'package:reallydrunk/model/option.dart';

class Blessing extends Option {
  late int turn;
  Blessing(String description, String name, this.turn)
      : super(name, description, "Blessing");
}

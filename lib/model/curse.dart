import 'package:reallydrunk/model/option.dart';

class Curse extends Option {
  late int round;
  Curse(String description, String name, this.round, double probability)
      : super(name, description, "Curse", probability);
}

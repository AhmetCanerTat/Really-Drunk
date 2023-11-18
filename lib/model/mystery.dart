import 'package:reallydrunk/model/option.dart';

class Mystery extends Option {
  late int turn;
  Mystery(String description, String name, this.turn)
      : super(name, description,"Mystery");
}

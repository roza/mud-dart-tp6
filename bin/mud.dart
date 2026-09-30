import 'package:mud/box.dart';
import 'package:mud/thing.dart';

void main() {
  print('Bienvenue dans le MUD !');

  final coffre = Box(capacity: 5);
  coffre.actionAdd(Thing('épée', volume: 3));
  coffre.actionAdd(Thing('potion', volume: 1));
  print(coffre.actionLook());

  if (!coffre.actionAdd(Thing('bouclier', volume: 4))) {
    print("Le bouclier ne rentre pas dans le coffre.");
  }
}

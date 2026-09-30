import 'thing.dart';

/// Une boite qui peut contenir des choses.
class Box {
  final List<Thing> _contents = [];
  bool _open;

  /// Capacité de la boite : `null` signifie « capacité illimitée ».
  int? capacity;

  Box({bool open = true, this.capacity}) : _open = open;

  void add(Thing thing) => _contents.add(thing);

  bool contains(Thing thing) => _contents.contains(thing);

  /// Retire [thing] de la boite. Renvoie `false` s'il n'y était pas.
  bool remove(Thing thing) => _contents.remove(thing);

  bool get isOpen => _open;

  void open() => _open = true;

  void close() => _open = false;

  String actionLook() {
    if (!isOpen) return 'la boite est fermee';
    final names = _contents.map((t) => t.name).join(', ');
    return 'la boite contient: $names';
  }

  /// Volume total occupé par les choses de la boite.
  int get usedVolume => _contents.fold(0, (sum, t) => sum + t.volume);

  bool hasRoomFor(Thing thing) {
    final cap = capacity;
    if (cap == null) return true;
    return usedVolume + thing.volume <= cap;
  }

  /// Ajoute [thing] seulement si la boite est ouverte et qu'il y a la place.
  /// Renvoie `true` si l'ajout a eu lieu.
  bool actionAdd(Thing thing) {
    if (!isOpen || !hasRoomFor(thing)) return false;
    add(thing);
    return true;
  }

  /// Cherche une chose par son nom. Renvoie `null` si la boite est fermée
  /// ou si rien ne porte ce nom.
  Thing? find(String name) {
    if (!isOpen) return null;
    return _contents.where((t) => t.hasName(name)).firstOrNull;
  }
}

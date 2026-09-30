/// Une chose que l'on peut ranger dans une boite.
class Thing {
  String name;
  final int volume;

  Thing(this.name, {this.volume = 0});

  bool hasName(String name) => this.name == name;

  @override
  String toString() => name;
}

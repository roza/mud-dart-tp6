import 'package:mud/box.dart';
import 'package:mud/thing.dart';
import 'package:test/test.dart';

void main() {
  group('Box : création et contenu', () {
    test('on peut créer une boite', () {
      final b = Box();
      expect(b, isA<Box>());
    });

    test('on peut mettre des choses dedans', () {
      final b = Box();
      b.add(Thing('truc1'));
      b.add(Thing('truc2'));
    });

    test('contains', () {
      final b = Box();
      final t = Thing('truc');
      expect(b.contains(t), isFalse);
      b.add(t);
      expect(b.contains(t), isTrue);
    });

    test('remove retire la chose', () {
      final b = Box();
      final t = Thing('truc');
      b.add(t);
      expect(b.remove(t), isTrue);
      expect(b.contains(t), isFalse);
    });

    test('remove renvoie false si la chose est absente', () {
      expect(Box().remove(Thing('truc')), isFalse);
    });
  });

  group('Box : ouverture', () {
    test('une boite est ouverte par défaut', () {
      expect(Box().isOpen, isTrue);
    });

    test('close puis open', () {
      final b = Box();
      b.close();
      expect(b.isOpen, isFalse);
      b.open();
      expect(b.isOpen, isTrue);
    });

    test('on peut créer une boite fermée', () {
      expect(Box(open: false).isOpen, isFalse);
    });
  });

  group('Box : actionLook', () {
    test('boite ouverte', () {
      final b = Box();
      b.add(Thing('ceci'));
      b.add(Thing('cela'));
      expect(b.actionLook(), equals('la boite contient: ceci, cela'));
    });

    test('boite fermée', () {
      final b = Box();
      b.close();
      expect(b.actionLook(), equals('la boite est fermee'));
    });
  });

  group('Box : capacité', () {
    test('capacité illimitée (null) par défaut', () {
      expect(Box().capacity, isNull);
    });

    test('on peut fixer la capacité', () {
      final b = Box();
      b.capacity = 5;
      expect(b.capacity, equals(5));
      expect(Box(capacity: 3).capacity, equals(3));
    });

    test('hasRoomFor tient compte du volume déjà occupé', () {
      final b = Box(capacity: 5);
      final t3 = Thing('t3', volume: 3);
      expect(b.hasRoomFor(t3), isTrue);
      b.add(t3);
      expect(b.hasRoomFor(Thing('t2', volume: 2)), isTrue);
      expect(b.hasRoomFor(Thing('t3bis', volume: 3)), isFalse);
    });

    test('une boite sans capacité a toujours de la place', () {
      expect(Box().hasRoomFor(Thing('enorme', volume: 1000)), isTrue);
    });
  });

  group('Box : actionAdd', () {
    test("ajoute s'il y a la place", () {
      final b = Box(capacity: 5);
      final t = Thing('t', volume: 3);
      expect(b.actionAdd(t), isTrue);
      expect(b.contains(t), isTrue);
    });

    test("échoue s'il n'y a pas la place", () {
      final b = Box(capacity: 2);
      final t = Thing('t', volume: 3);
      expect(b.actionAdd(t), isFalse);
      expect(b.contains(t), isFalse);
    });

    test('échoue si la boite est fermée', () {
      final b = Box(open: false);
      final t = Thing('t');
      expect(b.actionAdd(t), isFalse);
      expect(b.contains(t), isFalse);
    });
  });

  group('Box : find', () {
    test('trouve une chose par son nom', () {
      final b = Box();
      final t = Thing('bidule');
      b.add(Thing('truc'));
      b.add(t);
      expect(b.find('bidule'), same(t));
    });

    test('renvoie null si rien ne porte ce nom', () {
      expect(Box().find('bidule'), isNull);
    });

    test('renvoie null si la boite est fermée', () {
      final b = Box();
      b.add(Thing('bidule'));
      b.close();
      expect(b.find('bidule'), isNull);
    });
  });
}

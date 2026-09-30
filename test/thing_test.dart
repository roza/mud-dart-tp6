import 'package:mud/thing.dart';
import 'package:test/test.dart';

void main() {
  group('Thing', () {
    test('a un nom', () {
      final t = Thing('bidule');
      expect(t.name, equals('bidule'));
    });

    test('a un volume nul par défaut', () {
      expect(Thing('bidule').volume, equals(0));
    });

    test('peut avoir un volume', () {
      final t = Thing('bidule', volume: 3);
      expect(t.volume, equals(3));
    });

    test('peut changer de nom', () {
      final t = Thing('bidule');
      t.name = 'truc';
      expect(t.name, equals('truc'));
    });

    test("s'affiche avec son nom", () {
      expect(Thing('bidule').toString(), equals('bidule'));
      expect('chose: ${Thing('bidule')}', equals('chose: bidule'));
    });

    test('hasName', () {
      final t = Thing('bidule');
      expect(t.hasName('bidule'), isTrue);
      expect(t.hasName('truc'), isFalse);
    });
  });
}

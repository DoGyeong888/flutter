import 'package:flutter_test/flutter_test.dart';
import 'package:ready_flutter_template/src/domain/utils/text_utils.dart';

void main() {
  group('buildGreeting', () {
    test('returns default greeting for empty input', () {
      expect(buildGreeting('   '), 'Hello there!');
    });

    test('capitalizes provided name', () {
      expect(buildGreeting('flutter'), 'Hello, Flutter!');
    });
  });
}

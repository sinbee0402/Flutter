import 'package:dart_basic/homework/test_function.dart';
import 'package:test/test.dart';

void main() {
  String str;

  test('reverseString 테스트', () {
    str = 'Hello';

    final result = reverseString(str);

    expect(result, 'olleH');
  });

  test('reverseString 테스트', () {
    str = 'Hello';

    final result = reverseString(str);

    expect(result, 'Hello');
  });

  test('reverseString 테스트', () {
    str = 'abcdEF';

    final result = reverseString(str);

    expect(result, 'FEdcba');
  });

  test('reverseString 테스트', () {
    str = 'abcdEF';

    final result = reverseString(str);

    expect(result, 'FE  ba'); // error
  });
}

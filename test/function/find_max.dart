import 'package:dart_basic/homework/test_function.dart';
import 'package:test/test.dart';

// 06.13.과제
// 3번.

void main() {
  List<int> list;

  test('findMax 함수 테스트', () {
    // given
    list = [2, 5, 1, 9, 3];
    // when
    final result = findMax(list);
    // then
    expect(result, 9);
  });

  test('findMax 함수 테스트', () {
    // given
    list = [2, 5, 1, 9, 9];
    // when
    final result = findMax(list);
    // then
    expect(result, 9);
  });

  test('findMax 함수 테스트', () {
    // given
    list = [1, 1, 1, 1, 1];
    // when
    final result = findMax(list);
    // then
    expect(result, 1);
  });

  test('findMax 함수 테스트', () {
    // given
    list = [1, 1, 1, 1, 1];
    // when
    final result = findMax(list);
    // then
    expect(result, 9); // error
  });

  test('findMax 함수 테스트', () {
    // given
    list = [-1, -1, 1, -1, 0];
    // when
    final result = findMax(list);
    // then
    expect(result, 0); // error
  });
}

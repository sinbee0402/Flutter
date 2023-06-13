import 'package:dart_basic/homework/is_even.dart';
import 'package:test/test.dart';

// 06.13.과제
// 2번.

void main() {
  test('짝수 테스트', () {
    // given 준비
    int i = 0;
    // when 실행
    final result = isEven(i);
    // then 검증
    expect(result, true);
  });

  test('짝수 테스트', () {
    // given 준비
    int i = 0;
    // when 실행
    final result = isEven(i);
    // then 검증
    expect(result, false); // error
  });

  test('짝수 테스트', () {
    // given 준비
    int i = 4;
    // when 실행
    final result = isEven(i);
    // then 검증
    expect(result, true);
  });

  test('홀수 테스트', () {
    // given 준비
    int i = 7;
    // when 실행
    final result = isEven(i);
    // then 검증
    expect(result, false);
  });

  test('홀수 테스트', () {
    // given 준비
    int i = 7;
    // when 실행
    final result = isEven(i);
    // then 검증
    expect(result, true); // error
  });
}

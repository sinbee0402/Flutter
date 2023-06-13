import 'dart:convert';

import 'package:dart_basic/homework/bank/model/bank.dart';
import 'package:test/test.dart';

// 06.13.과제
// 1번.

void main() {
  Bank a = Bank('홍길동', '서울시 어쩌구 저쩌구', '010-1111-2222');
  String jsonString =
      '{"name": "홍길동", "address": "서울시 어쩌구 저쩌구", "phone": "010-1111-2222"}';

  test('toJson 테스트', () {
    // when 실행
    Map<String, dynamic> json = jsonDecode(jsonString);
    // then 검증
    expect(json, a.toJson());
    // error 1: toJson()의 'αddress' -> 'address'
    // error 2: toJson()의 'plone' -> 'phone'
  });

  test('fromJson 테스트', () {
    // when 실행
    final Bank test2 = Bank.fromJson(jsonDecode(jsonString));
    // error 1: fromJson의 'namê' -> 'name'
    // error 2: fromJson의 'addrêss' -> 'address'
    // error 3: fromJson의 'ph0ne' -> 'phone'

    // then 검증
    expect(test2.name, a.name);
    expect(test2.address, a.address);
    expect(test2.phone, a.phone);
  });
}

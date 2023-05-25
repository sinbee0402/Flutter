import 'wand.dart';

//05.24.

class Wizard {
  String _name; // 이름
  int _hp; // hp
  int _mp; // mp
  Wand wand; // 지팡이

  String get name => _name;
  int get hp => _hp;
  int get mp => _mp;

  Wizard(
      {required String name,
      required int hp,
      required int mp,
      required this.wand})
      : _name = name,
        _hp = hp,
        _mp = mp;

  // 10-2, 1번
  set name(String value) {
    if (value.length < 3) {
      throw Exception('Wizard의 name 값은 3문자 이상어이야 합니다!');
    }
    _name = value;
  }

  // 10-2, 5번
  set hp(int value) {
    if (value < 0) {
      _hp = 0;
    }
  }

  // 10-2, 4번
  set mp(int value) {
    if (value < 0) {
      throw Exception('mp 값이 0 미만입니다!');
    }
    _mp = value;
  }
}

void main() {
  final test1 =
      Wizard(name: 'a', hp: 50, mp: 10, wand: Wand(name: 'aaa', power: 10));
  test1.name = 'a'; // test1 : 1번. Wizard의 name 값 test

  final test2 =
      Wizard(name: 'bbb', hp: 50, mp: 10, wand: Wand(name: 'b', power: 10));
  test2.wand.name = 'b'; // test2 : 1번. Wand의 name 값 test

  final test3 = Wizard(
      name: 'ccc', hp: 50, mp: 10, wand: Wand(name: 'ccccc', power: 0.1));
  test3.wand.power = 0.1; // 양수 // test3 : 2번. Wand의 power 값 test1
  test3.wand.power = -1; // 음수

  final test4 = Wizard(
      name: 'dddd', hp: 50, mp: 10, wand: Wand(name: 'dddd', power: 120));
  test4.wand.power = 120; // test4 : 2번. Wand의 power 값 test2

  final test5 =
      Wizard(name: 'e-e', hp: 50, mp: -5, wand: Wand(name: 'e-e-e', power: 10));
  test5.mp = -5; // test5 : 4번. Wizard의 mp 값 test

  final test6 = Wizard(
      name: 'fffff', hp: -20, mp: 10, wand: Wand(name: '_-f-_', power: 10));
  test6.hp = -20; // test6 : 5번. Wizard의 hp 값이 0보다 작을 때, 0으로 설정 test
  print(test6.hp);

  // 3번. Wizard의 wand는 Non-nullable이기 때문에 null로 설정하면 error //
  // wand의 getter, setter를 삭제함에 따라 3번 테스트가 사라짐.
}

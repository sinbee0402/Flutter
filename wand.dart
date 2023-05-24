//05.24.과제

class Wand {
  String _name; // 이름
  double _power; // 마력

  String get name => _name;
  double get power => _power;

  Wand({required String name, required double power})
      : _name = name,
        _power = power;

  // 10-2, 1번
  set name(String value) {
    if (value.length < 3) {
      throw Exception('Wand의 name 값은 3문자 이상어이야 합니다!');
    } else if (value == null) {
      throw Exception('name 값이 null 입니다!');
    }
    _name = value;
  }

  // 10-2, 2번
  set power(double value) {
    if (value < 0.5) {
      throw Exception('Wand의 power 값은 0.5 이상이여야 합니다!');
    } else if (value > 100.0) {
      throw Exception('Wand의 power 값은 100.0이하여야 합니다!');
    }
    _power = value;
  }
}

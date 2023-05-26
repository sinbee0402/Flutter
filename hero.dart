// 05.23.
// 05.25.과제

class Hero {
  int _hp;

  int get hp => _hp;
  set hp(int value) {
    if (value <= 0) {
      throw Exception('용사의 hp가 0입니다.');
    }
    _hp = value;
  }

  Hero(this._hp);
}

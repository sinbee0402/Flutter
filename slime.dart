import '../hero.dart';

// 05.25.과제
// 11-3

class Slime {
  int hp = 50;
  final String suffix;

  Slime(this.suffix);

  void attack(Hero hero) {
    print('슬라임 $suffix이/가 공격했다');
    print('10포인트의 데미지');
    hero.hp -= 10;
    print('용사의 남은 HP: ${hero.hp}\n');
  }
}

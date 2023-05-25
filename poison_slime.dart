import '../hero.dart';
import 'slime.dart';

class PoisonSlime extends Slime {
  int attackCount = 5;

  PoisonSlime(super.suffix);

  @override
  void attack(Hero hero) {
    super.attack(hero);
    int afterHp;

    if (attackCount > 0) {
      print('추가로, 독 포자를 살포했다!');
      afterHp = hero.hp - 5;
      print('5포인트의 데미지');
      print('용사의 남은 HP: $afterHp');
      attackCount -= 1;
      hero.hp = afterHp;
      print('독 포자의 남은 횟수: $attackCount\n');
    } else {
      print('독 포자를 살포할 수 없다!');
      print('독 포자의 남은 횟수: $attackCount\n');
    }
  }
}

void main() {
  Hero hero = Hero(hp: 100);
  PoisonSlime poisonSlime = PoisonSlime('A');
  poisonSlime.attack(hero); // 1번째 공격
  poisonSlime.attack(hero); // 2번째 공격
  poisonSlime.attack(hero); // 3번째 공격
  poisonSlime.attack(hero); // 4번째 공격
  poisonSlime.attack(hero); // 5번째 공격
  poisonSlime.attack(hero); // 6번째 공격
}

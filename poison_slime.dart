import '../hero.dart';
import 'slime.dart';

class PoisonSlime extends Slime {
  // private -> public
  int _attackCount = 5;

  PoisonSlime(super.suffix);

  @override
  void attack(Hero hero) {
    // 보통 공격
    super.attack(hero);

    // 선생님 코드
    // if (_attackCount > 0) {
    //   print('추가로 독포자를 살포했다');
    //   _attackCount--;
    //   //hero.hp = (hero.hp * 4 / 5) as int; // type casting
    //   //hero.hp = (hero.hp * 4 / 5).toInt();
    //   hero.hp = hero.hp * 4 ~/ 5; // 몫 구하기 : ~/
    // }

    int afterHp;

    if (_attackCount > 0) {
      print('추가로, 독 포자를 살포했다!');
      afterHp = hero.hp - 5;
      print('5포인트의 데미지');
      print('용사의 남은 HP: $afterHp');
      _attackCount -= 1;
      hero.hp = afterHp;
      print('독 포자의 남은 횟수: $_attackCount\n');
    } else {
      print('독 포자를 살포할 수 없다!');
      print('독 포자의 남은 횟수: $_attackCount\n');
    }
  }
}

void main() {
  final Hero hero = Hero(100);
  final PoisonSlime poisonSlime = PoisonSlime('A');
  poisonSlime.attack(hero); // 1번째 공격
  poisonSlime.attack(hero); // 2번째 공격
  poisonSlime.attack(hero); // 3번째 공격
  poisonSlime.attack(hero); // 4번째 공격
  poisonSlime.attack(hero); // 5번째 공격
  poisonSlime.attack(hero); // 6번째 공격 - test 성공
}

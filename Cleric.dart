import 'dart:math';

//05.23.과제

class Cleric {
  static const int maxHp = 50;
  static const int maxMp = 10;

  String name;
  int hp;
  int mp;

  // HP와 최대 HP는 정수로 초기치 50
  // MP와 최대 MP는 정수로 초기치 10

  Cleric(
    this.name, {
    this.hp = maxHp,
    this.mp = maxMp,
  });

  void selfAid() {
    print('mp: $mp');

    if (mp < 5) {
      print('mp가 부족합니다');
    } else {
      mp -= 5;
      hp = maxHp;
      print('mp: $mp, hp: $hp');
    }
  }

  int pray(int sec) {
    int recoveryMp = sec + Random().nextInt(3); //회복된 mp 양 = sec+(0~2);
    final int afterMp = mp + recoveryMp; //회복후 mp 양

    // mp, 회복된 mp양, 회복후 mp양
    print('mp: $mp, recoveryMp: $recoveryMp, afterMp: $afterMp');

    if (afterMp > maxMp) {
      recoveryMp = maxMp - mp;
      print(recoveryMp);
    }
    return recoveryMp;
  }
}

void main() {
  // 과제 1.
  final cleric = Cleric('Cleric');
  print('mp: ${cleric.mp}');
  cleric.selfAid();
  cleric.pray(5); //3~5 값

  // 과제 2.
  final clericA = Cleric('아서스', hp: 40, mp: 5);
  final clericB = Cleric('아서스', hp: 35);
  final clericC = Cleric('아서스');

  print('${clericA.name}, ${clericA.hp}, ${clericA.mp}');
  print('${clericB.name}, ${clericB.hp}, ${clericB.mp}');
  print('${clericC.name}, ${clericC.hp}, ${clericC.mp}');
}

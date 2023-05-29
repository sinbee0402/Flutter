// 05.26.과제
// 13-5
import 'terran.dart';

abstract interface class Zerg implements Bionic {
  // 자동 회복
  void autoRecovery();
}

class Building implements Zerg {
  @override
  void autoRecovery() {
    // 자동 회복
  }

  @override
  void unitDesignation(int unit) {
    // 부대 지정
  }
}

class Unit extends Medic implements Zerg {
  @override
  void heal() {
    // Medic 치료
    super.heal();
  }

  @override
  void autoRecovery() {
    // 자동 회복
  }

  @override
  void unitDesignation(int unit) {
    // 부대 지정
  }
}

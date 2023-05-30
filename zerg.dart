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

class ZergBionic implements Zerg {
  @override
  void autoRecovery() {
    // 자동 회복
  }

  @override
  void unitDesignation(int unit) {
    // 부대 지정
  }
}

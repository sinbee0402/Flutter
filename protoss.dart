// 05.26.과제
// 13-7
import 'terran.dart';

abstract interface class Protoss {
  // 서서히 회복하는 방어막
  void shield();
}

class Zealot implements Protoss, Bionic {
  @override
  void shield() {
    // 방어막
  }

  @override
  void unitDesignation(int unit) {
    // 부대 지정
  }
}

class Dragoon implements Protoss, Mechanic {
  @override
  void shield() {
    // 방어막
  }

  @override
  void unitDesignation(int unit) {
    // 부대 지정
  }
}

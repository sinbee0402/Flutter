// 05.26.과제
// 13-4
import 'zerg.dart';

abstract interface class Terran {}

abstract interface class Unit {
  // 13-6
  void unitDesignation(int unit); // 부대 지정 12개까지
}

abstract interface class Bionic implements Unit {} // 생물

abstract interface class Mechanic implements Unit {} // 기계

class Marine implements Terran, Bionic {
  @override
  void unitDesignation(int unit) {
    // 부대 지정
  }
}

class Medic implements Terran, Bionic {
  // Bionic과 SCV만 회복
  void heal(Bionic bionic) {
    if (bionic is! Building) {
      print('Medic이 해당 개체를 치료하는 중입니다.');
    }
  }

  @override
  void unitDesignation(int unit) {
    // 부대 지정
  }
}

class Tank implements Terran, Mechanic {
  @override
  void unitDesignation(int unit) {
    // 부대 지정
  }
}

class Vulture implements Terran, Mechanic {
  @override
  void unitDesignation(int unit) {
    // 부대 지정
  }
}

class SCV implements Terran, Mechanic, Bionic {
  void gather() {
    // 자원 채취
    print('자원을 채취하는 중입니다.');
  }

  void repair(Mechanic mechanic) {
    // Mechanic 수리
  }

  @override
  void unitDesignation(int unit) {
    // 부대 지정
  }
}

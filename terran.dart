// 05.26.과제
// 13-4
abstract interface class Terran {}

abstract interface class Bionic {
  // 생물
  // 13-6
  void unitDesignation(int unit); // 부대 지정 12개까지
}

abstract interface class Mechanic {} // 기계

class Marine extends Medic implements Terran, Bionic {
  @override
  void heal() {
    // Medic 치료
    super.heal();
  }

  @override
  void unitDesignation(int unit) {
    // 부대 지정
  }
}

class Medic implements Terran, Bionic {
  // Terran-Bionic과 SCV, Zerg-Bionic-Unit만 회복
  void heal() {
    print('Medic이 해당 개체를 치료하는 중입니다.');
  }

  @override
  void unitDesignation(int unit) {
    // 부대 지정
  }
}

class Tank implements Terran, Mechanic {}

class Vulture implements Terran, Mechanic {}

class SCV extends Medic implements Terran, Mechanic {
  void gather() {
    // 자원 채취
    print('자원을 채취하는 중입니다.');
  }

  void repair() {
    // Mechanic 수리
  }

  @override
  void heal() {
    // Medic 치료
    super.heal();
  }
}

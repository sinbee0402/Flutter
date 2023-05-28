// 05.26.과제
// 13-4
abstract interface class Terran {}

abstract interface class Bionic implements Terran {}

abstract interface class Mechanic implements Terran {}

class Marine implements Bionic {}

class Medic implements Bionic {
  void heal() {
    // Bionic과 SCV만
  }
}

class Tank implements Mechanic {}

class Vulture implements Mechanic {}

class SCV implements Mechanic {
  void gather() {
    // 자원 채취
  }

  void fix() {
    // Mechanic 수리
  }
}

abstract interface class X {
  void a();
}

abstract class Y implements X {
  void b();
}

class A extends Y {
  @override
  void a() {
    print('Aa');
  }

  @override
  void b() {
    print('Ab');
  }

  void c() {
    print('Ac');
  }
}

class B extends Y {
  @override
  void a() {
    print('Ba');
  }

  @override
  void b() {
    print('Bb');
  }

  void c() {
    print('Bc');
  }
}

// X obj = A(); 로 A인스턴스를 생성한 후,
// 변수 obj에서 호출할 수 있는 메소드를 a(), b(), c() 중에 골라보시오.
// Y y1 = A();
// Y y2 = B(); 로 A와 B의 인스턴스를 생성한 후
// y1.a();
// y2.a(); 를 실행했을 때에 화면에 표시되는 내용을 말하시오.

void main() {
  X obj = A();
  obj.a();
  // b,c가 안되는 이유 : X타입의 A메서드만 호출된다.

  Y y1 = A();
  Y y2 = B();
  y1.a();
  y2.a();
  // y1.a() : Y타입의 A메서드만 호출
  // y2.a() : Y타입의 B메서드만 호출 -> b메서드도 된다.
  
  // 13-3
  final A a = A();
  final B b = B();
  List<Y> abList = [a, b];

  for (final i in abList) {
    i.b();
  }
}

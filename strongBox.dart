// 05.31.과제
// 1번.
// 2번.

class StrongBox<E> {
  E? _asset; //좀더 추상적인 선언
  KeyType key;
  int _count = 0;

  StrongBox(this.key);

  void put(E asset) {
    _asset = asset;
  }

  E? get() {
    _count += 1;
    switch (key) {
      case KeyType.padlock:
        if (_count >= 1024) {
          return null;
        } else {
          print('key: $key\ncount: $_count');
        }
        break;
      case KeyType.button:
        if (_count >= 10000) {
          return _asset;
        } else {
          print('key: $key\ncount: $_count');
        }
        break;
      case KeyType.dial:
        if (_count >= 30000) {
          return _asset;
        } else {
          print('key: $key\ncount: $_count');
        }
        break;
      case KeyType.finger:
        if (_count >= 1000000) {
          return _asset;
        } else {
          print('key: $key\ncount: $_count');
        }
        break;
    }
  }
}

enum KeyType {
  padlock,
  button,
  dial,
  finger,
}

void main() {
  KeyType keyType = KeyType.padlock;
  StrongBox<int> box = StrongBox(keyType);

  for (int i = 0; i <= 1023; i++) {
    box.get();
    // 1022일 때, 1023 값이 나오는 것을 확인.
    // 1023일 때, null 값을 리턴하는 것을 확인.
  }
}

// 05.31.과제
// 1번.
// 2번.

class StrongBox<E> {
  E? _gold;
  KeyType key;
  int count = 0;

  StrongBox(this.key);

  void put(E gold) {
    _gold = gold;
  }

  E? get() {
    count += 1;
    return _gold;
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

  switch (box.key) {
    case KeyType.padlock:
      if (box.count >= 1024) {
        return;
      } else {
        print('key: ${box.key}\ncount: ${box.count}');
      }
      break;
    case KeyType.button:
      if (box.count >= 10000) {
        return;
      } else {
        print('key: ${box.key}\ncount: ${box.count}');
      }
      break;
    case KeyType.dial:
      if (box.count >= 30000) {
        return;
      } else {
        print('key: ${box.key}\ncount: ${box.count}');
      }
      break;
    case KeyType.finger:
      if (box.count >= 1000000) {
        return;
      } else {
        print('key: ${box.key}\ncount: ${box.count}');
      }
      break;
  }
}

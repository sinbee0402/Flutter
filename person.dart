//05.24.과제

// 2-1
// 1번. Set
// 2번. List
// 3번. Map

class Person {
  final String name; // 이름

  Person(this.name);
}

void main() {
  // 2-2
  final persons = <Person>[];
  final hong = Person('홍길동');
  final han = Person('한석봉');

  persons.add(hong);
  persons.add(han);

  for (final person in persons) {
    print(person.name);
  }

  // 2-3
  final personList = <String, int>{};

  personList[hong.name] = 20;
  personList[han.name] = 25;

  personList.forEach((key, value) {
    print('$key의 나이는 $value살');
  });
}

import 'dart:math';

// 06.02.과제

class Trader {
  String name;
  String city;

  Trader(this.name, this.city);
}

class Transaction {
  Trader trader;
  int year;
  int value;

  Transaction(this.trader, this.year, this.value);
}

final transactions = [
  Transaction(Trader("Brian", "Cambridge"), 2011, 300),
  Transaction(Trader("Raoul", "Cambridge"), 2012, 1000),
  Transaction(Trader("Raoul", "Cambridge"), 2011, 400),
  Transaction(Trader("Mario", "Milan"), 2012, 710),
  Transaction(Trader("Mario", "Milan"), 2012, 700),
  Transaction(Trader("Alan", "Cambridge"), 2012, 950),
];

void main() {
  final list = [];
  // 1번.
  // 2011년에 일어난 모든 트랜잭션/가격 기준 오름차순/이름 나열
  transactions.where((e) => e.year == 2011).forEach((e) {
    list.add(e);
  });
  list.sort((a, b) => a.value.compareTo(b.value));
  final names = list.map((e) => e.trader.name).toList();
  print(names);

  // 2번.
  // 거래자가 근무하는 모든 도시/중복없이/나열
  list.clear();
  transactions.forEach((e) {
    list.add(e.trader.city);
  });
  print(list.toSet().toList());

  // 3번.
  // 케임브리지에서 근무하는 모든 거래자/이름순 정렬/나열
  list.clear();
  transactions.where((e) => e.trader.city == 'Cambridge').forEach((e) {
    list.add(e.trader.name);
  });
  list.sort();
  print(list);

  // 4번.
  // 모든 거래자의 이름/알파벳순 정렬/나열
  list.clear();
  transactions.forEach((e) {
    list.add(e.trader.name);
  });
  list.sort();
  print(list);

  // 5번.
  // 밀라노에 거래자가 있는지
  list.clear();
  transactions.where((e) => e.trader.city == 'Milan').forEach((e) {
    list.add(e.trader.name);
  });
  print(list);

  // 6번.
  // 케임브리지에 거주하는 거래자/모든 트랙잭션값/출력
  // 트랜잭션값이 거래값인가..? value값??
  transactions.where((e) => e.trader.city == 'Cambridge').forEach((e) {
    print('Transaction 값');
    print('${e.trader.name}, ${e.trader.city}');
    print('${e.year}, ${e.value}');
    print('------------------------');
  });

  // 7번.
  // 전체 트랜잭션 중 최대값
  // list.clear();
  // transactions.map((e) => list.add(e.value));
  // final maxValue = list.reduce((e, v) => max(e, v)); // 이거 왜 안되는거지..
  //print(list.reduce((e, v) => e > v ? e : v));  // 왜 자꾸 안된대!
  final maxValue = transactions.fold(
      0,
      (previousValue, transaction) => previousValue > transaction.value
          ? previousValue
          : transaction.value);
  print(maxValue);

  // 8번.
  // 전체 트랜잭션 중 최소값
  final minValue = transactions.fold(
      maxValue,
      (previousValue, transaction) => previousValue < transaction.value
          ? previousValue
          : transaction.value);
  print(minValue);
}

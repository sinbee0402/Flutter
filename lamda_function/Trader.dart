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
  // forEach에서 add를 하는 것보다 addAll로 하는게 더 낫다.
  // final list = [];
  // list.addAll(transactions.where((e) => e.year == 2011));

  // 1번.
  // 2011년에 일어난 모든 트랜잭션/가격 기준 오름차순/이름 나열
  // final result1 = transactions
  //     .where((e) => e.year == 2011)
  //     .toList()
  //     .sort((a, b) => a.value.compareTo(b.value));
  ((transactions.where((e) => e.year == 2011).toList())
        ..sort((a, b) => a.value.compareTo(b.value)))
      .map((e) => e.trader.name)
      .forEach(print);

  // 2번.
  // 거래자가 근무하는 모든 도시/중복없이/나열
  transactions.map((e) => e.trader.city).toSet().forEach(print);

  // 3번.
  // 케임브리지에서 근무하는 모든 거래자/이름순 정렬/나열
  ((transactions.where((e) => e.trader.city == 'Cambridge').toList())
        ..sort((a, b) => a.trader.name.compareTo(b.trader.name)))
      .forEach(print);

  // 4번.
  // 모든 거래자의 이름/알파벳순 정렬/나열
  ((transactions.map((e) => e.trader.name).toList())
        ..sort((a, b) => a.compareTo(b)))
      .forEach(print);

  // 5번.
  // 밀라노에 거래자가 있는지
  print(transactions.any((e) => e.trader.city == 'Milan'));

  // 6번.
  // 케임브리지에 거주하는 거래자/모든 트랙잭션값/출력
  transactions.where((e) => e.trader.city == 'Cambridge').forEach(print);

  // 7번.
  // 전체 트랜잭션 중 최대값
  // list.clear();
  // transactions.map((e) => list.add(e.value));
  // final maxValue = list.reduce((e, v) => max); // 이거 왜 안되는거지..
  // print(list.reduce((e, v) => e > v ? e : v));
  // final maxValue = transactions.fold(
  //     0,
  //     (previousValue, transaction) => previousValue > transaction.value
  //         ? previousValue
  //         : transaction.value);
  // print(maxValue);
  // print(transactions.map((e) => e.value).toList().reduce(max));
  // print(transactions.map((e) => e.value).reduce((value, element) => value>element? value:element));
  print(transactions.map((e) => e.value).fold<int>(0, max));

  // 8번.
  // 전체 트랜잭션 중 최소값
  // final minValue = transactions.fold(
  //     maxValue,
  //     (previousValue, transaction) => previousValue < transaction.value
  //         ? previousValue
  //         : transaction.value);
  // print(minValue);
  print(transactions.map((e) => e.value).reduce(min));
}

import 'asset.dart';
import 'thing.dart';

// 05.25.과제

abstract class TangibleAsset extends Asset implements Thing {
  final String color;
  double _weight = 0;
  //late final double _weight;
  // 쓰지 않는게 좋다. 이렇게 변수선언만 해도 오류가 안나기 때문이다.
  // late를 쓰고 생성자에서 초기화를 하지 않는다면 터지기 때문이다.

  // 12-1
  TangibleAsset({
    required super.name,
    required super.price,
    required this.color,
  });

  // 12-4
  @override
  double get weight => _weight;

  @override
  set weight(double value) {
    _weight = value;
  }
}

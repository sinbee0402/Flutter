import 'asset.dart';
import 'thing.dart';

// 05.25.과제

abstract class TangibleAsset extends Asset implements Thing {
  int price;
  String color;
  late final double _weight;

  // 12-1
  TangibleAsset({
    required super.name,
    required this.price,
    required this.color,
    required double weight,
  }) : _weight = weight;

  // 12-4
  @override
  double get weight => _weight;

  @override
  set weight(double value) {
    _weight = value;
  }
}

import 'tangible_asset.dart';

// 05.25.과제
// 12-1

class Computer extends TangibleAsset {
  String makerName;

  Computer({
    required super.name,
    required super.price,
    required super.color,
    required this.makerName,
    required super.weight,
  });
}

import 'tangible_asset.dart';

// 05.25.과제
// 12-1

class Book extends TangibleAsset {
  final String isbn;

  Book({
    required super.name,
    required super.price,
    required super.color,
    required this.isbn,
  });
}

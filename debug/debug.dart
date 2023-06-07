import 'dart:convert';
import 'list_data.dart';

// 06.02.과제

void main() {
  final String json = '''{
    "collectionChartDataList": [
      {"collectionName": "collectionName", "collectionSalePrice": null},
      {
        "collectionName": "collectionName",
        "collectionSalePrice": [
          {"price": 59.75, "cvtDatetime": "2023-03-26T08:08:35"},
          {"price": 60.00, "cvtDatetime": "2023-03-26T08:08:45"}
        ]
      }
    ]
  }''';
  // 역직렬화
  ListData listData = ListData.fromJson(jsonDecode(json));

  // 직렬화
  final serialization = jsonEncode(listData.toJson());

  print('직렬화');
  print(serialization);

  print('역직렬화');
  print('ListData:');
  print('collectionChartDataList:');
  if (listData.collectionChartDataList != null) {
    for (var chartData in listData.collectionChartDataList!) {
      print('  collectionName: ${chartData.collectionName}');
      print('  collectionSalePrice:');
      if (chartData.collectionSalePrice != null) {
        for (var salePrice in chartData.collectionSalePrice!) {
          print('    price: ${salePrice.price}');
          print('    cvtDatetime: ${salePrice.cvtDatetime}');
        }
      } else {
        print('    null');
      }
    }
  }
}

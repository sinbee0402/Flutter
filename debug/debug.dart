import 'dart:convert';

import 'list_data.dart';

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
  for (CollectionChartDataList collectionChartDataList
      in listData.collectionChartDataList) {
    print('Collection Name: ${collectionChartDataList.collectionName}');
    if (collectionChartDataList.collectionSalePrice != null) {
      collectionChartDataList.collectionSalePrice?.forEach((e) {
        print('Price: ${e.price}');
        print('DateTime: ${e.cvtDatetime}');
      });
    } else {
      print('SalePrice: null');
    }
  }
}

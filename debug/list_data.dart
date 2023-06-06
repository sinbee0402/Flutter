// 06.02.과제
// 1번.

// 문제 : List로 받아야하는 데이터를 null로 받았기 때문에, Exception이 발생한다.
// json 데이터를 [] 빈 List로 받아오거나, 저 값에 맞게 코드를 수정해야함.

// 답안1) 서버 개발자에게 지적해서 알맞은 데이터로 달라고 하기
// 답안2) 이 데이터로 받을 수 있게 코드 수정하기

class ListData {
  List<CollectionChartDataList> collectionChartDataList;

  ListData(
    this.collectionChartDataList,
  );

  ListData.fromJson(dynamic json)
      : collectionChartDataList = List.from(json['collectionChartDataList'])
            .map((e) => CollectionChartDataList.fromJson(e))
            .toList();

  Map<String, dynamic> toJson() => {
        'collectionChartDataList':
            collectionChartDataList.map((e) => e.toJson()).toList()
      };
}

class CollectionChartDataList {
  String collectionName;
  List<CollectionSalePrice>? collectionSalePrice;

  CollectionChartDataList(
    this.collectionName,
    this.collectionSalePrice,
  );

  // error 발생.. 선생님 도와주세요ㅠㅠ
  CollectionChartDataList.fromJson(Map<String, dynamic> json) {
    collectionName = json['collectionName'];
    if (json['collectionSalePrice'] != null) {
      collectionSalePrice = <CollectionSalePrice>[];
      json['collectionSalePrice'].forEach((e) {
        collectionSalePrice.add(CollectionSalePrice.fromJson(e));
      });
    } else {
      collectionSalePrice = null;
    }
  }

  // null 값밖에 안들어가는 코드
  // CollectionChartDataList.fromJson(Map<String, dynamic> json)
  //     : collectionName = json['collectionName'],
  //       collectionSalePrice = null;

  Map<String, dynamic> toJson() => {
        'collectionName': collectionName,
        'collectionSalePrice': collectionSalePrice,
      };
}

class CollectionSalePrice {
  double price;
  String cvtDatetime;

  CollectionSalePrice(this.price, this.cvtDatetime);

  CollectionSalePrice.fromJson(Map<String, dynamic> json)
      : price = json['price'],
        cvtDatetime = json['cvtDatetime'];

  Map<String, dynamic> toJson() => {
        'price': price,
        'cvtDatetime': cvtDatetime,
      };
}

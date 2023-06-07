// 06.02.과제
// 1번.

// 문제 : List로 받아야하는 데이터를 null로 받았기 때문에, Exception이 발생한다.
// json 데이터를 [] 빈 List로 받아오거나, 저 값에 맞게 코드를 수정해야함.

// 답안1) 서버 개발자에게 지적해서 알맞은 데이터로 달라고 하기
// 답안2) 이 데이터로 받을 수 있게 코드 수정하기

class ListData {
  ListData({
    this.collectionChartDataList,
  });

  ListData.fromJson(dynamic json) {
    if (json['collectionChartDataList'] != null) {
      collectionChartDataList = [];
      json['collectionChartDataList'].forEach((v) {
        collectionChartDataList?.add(CollectionChartDataList.fromJson(v));
      });
    }
  }
  List<CollectionChartDataList>? collectionChartDataList;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (collectionChartDataList != null) {
      map['collectionChartDataList'] =
          collectionChartDataList?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class CollectionChartDataList {
  CollectionChartDataList({
    this.collectionName,
    this.collectionSalePrice,
  });

  CollectionChartDataList.fromJson(dynamic json) {
    collectionName = json['collectionName'];
    if (json['collectionSalePrice'] != null) {
      collectionSalePrice = [];
      json['collectionSalePrice'].forEach((v) {
        collectionSalePrice?.add(CollectionSalePrice.fromJson(v));
      });
    }
  }
  String? collectionName;
  List<CollectionSalePrice>? collectionSalePrice;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['collectionName'] = collectionName;
    if (collectionSalePrice != null) {
      map['collectionSalePrice'] =
          collectionSalePrice?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class CollectionSalePrice {
  CollectionSalePrice({
    this.price,
    this.cvtDatetime,
  });

  CollectionSalePrice.fromJson(dynamic json) {
    price = json['price'];
    cvtDatetime = json['cvtDatetime'];
  }
  num? price;
  String? cvtDatetime;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['price'] = price;
    map['cvtDatetime'] = cvtDatetime;
    return map;
  }
}

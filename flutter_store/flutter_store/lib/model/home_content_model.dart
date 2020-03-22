class HomeSliderModel {
  String image;
  int urlType;
  String goodsId;

  HomeSliderModel({this.image, this.urlType, this.goodsId});

  factory HomeSliderModel.fromJson(dynamic json) {
    return HomeSliderModel(
      image: json['image'],
      urlType: json['urlType'],
      goodsId: json['goodsId'],
    );
  }
}

class HomeSliderListModel {
  List<HomeSliderModel> data;
  HomeSliderListModel(this.data);

  factory HomeSliderListModel.fromJson(List json) {
    return HomeSliderListModel(
        json.map((value) => HomeSliderModel.fromJson((value))).toList()
    );
  }
}

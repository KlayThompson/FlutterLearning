class ProductItemModel {
  String desc;
  String imageUrl;
  String type;
  String name;

  ProductItemModel({this.name, this.desc, this.imageUrl, this.type});

  factory ProductItemModel.fromJson(dynamic json) {
    return ProductItemModel(
      desc: json['desc'],
      imageUrl: json['imageUrl'],
      type: json['type'],
      name: json['name'],
    );
  }
}

class ProductItemListModel {
  List<ProductItemModel> data;
  ProductItemListModel(this.data);

  factory ProductItemListModel.fromJson(List json) {
    return ProductItemListModel(
      json.map((value) => ProductItemModel.fromJson((value))).toList()
    );
  }
}

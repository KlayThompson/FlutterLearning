class NewsItemModel {
  String author;
  String title;
  String content;
  String imgUrl;

  NewsItemModel({this.author, this.title, this.content, this.imgUrl});

  factory NewsItemModel.fromJson(dynamic json) {
    return NewsItemModel(
        author: json['author'],
        title: json['title'],
        content: json['content'],
        imgUrl: json['imgUrl']

    );
  }
}

class NewsItemListModel {
  List<NewsItemModel> data;
  NewsItemListModel(this.data);

  factory NewsItemListModel.fromJson(List json) {
    return NewsItemListModel(
        json.map((value) => NewsItemModel.fromJson((value))).toList()
    );
  }
}

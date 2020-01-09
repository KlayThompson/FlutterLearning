import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SubscribeAccountCard extends StatelessWidget {
  final SubscribeAccountViewModel data;
  const SubscribeAccountCard({
    Key key,
    this.data
  }) : super(key: key);

  Widget renderAccountInfo() {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              CircleAvatar(
                radius: 15,
                backgroundColor: Colors.grey,
                backgroundImage: NetworkImage(this.data.accountImgUrl),
              ),
              Padding(padding: EdgeInsets.only(left: 10),),
              Text(
                this.data.accountName,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff666666)
                ),
              )
            ],
          ),
          Text(
            this.data.publishTime,
            style: TextStyle(
              fontSize: 13,
              color: Color(0xff999999)
            ),
          )
        ],
      ),
    );
  }

  Widget renderCover() {
    final article = this.data.articles[0];
    final shouldClip = this.data.articles.length <= 1;
    return ClipRRect(
      borderRadius: !shouldClip
      ? BorderRadius.circular(0)
      : BorderRadius.only(
        bottomLeft: Radius.circular(8),
        bottomRight: Radius.circular(8),
      ),
      child: Stack(
        fit: StackFit.passthrough,
        children: <Widget>[
          Image.network(
            article.coverImgUrl,
            height: 150,
            fit: BoxFit.cover,
          ),
          Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              height: 100,
              child: Container(
                padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
                alignment: Alignment.bottomLeft,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.transparent, Colors.black54]
                  )
                ),
                child: Text(
                  article.title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w500
                  ),
                ),
              )
          )
        ],
      ),
    );
  }

  Widget renderArticleList() {
    final articles = this.data.articles.sublist(1);
    return ListView.separated(
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.all(15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  child: Text(
                    articles[index].title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: Color(0xff333333)
                    ),
                  ),
                ),
                Padding(padding: EdgeInsets.all(10),),
                Image.network(
                  articles[index].coverImgUrl,
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                )
              ],
            ),
          );
        },
        separatorBuilder: (context, index) {
          return Container(
            height: .5,
            color: Color(0xffdddddd),
            margin: EdgeInsets.symmetric(horizontal: 15),
          );
        },
        itemCount: articles.length,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
    );
  }
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.fromLTRB(16, 16, 16, 0),
      decoration: BoxDecoration(
        color: Color(0xffffffff),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          this.renderAccountInfo(),
          this.renderCover(),
          this.renderArticleList()
        ],
      ),
    );
  }
}

class SubscribeAccountViewModel {
  /// 公众号头像
  final String accountImgUrl;

  /// 公众号名字
  final String accountName;

  /// 发布时间
  final String publishTime;

  /// 文章列表
  final List<Article> articles;

  const SubscribeAccountViewModel({
    this.publishTime,
    this.accountImgUrl,
    this.accountName,
    this.articles
  });
}

class Article {
  /// 封面图
  final String coverImgUrl;

  /// 文章标题
  final String title;

  const Article({
    this.coverImgUrl,
    this.title
  });
}
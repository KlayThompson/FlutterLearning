import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewsCard extends StatelessWidget {
  final NewsViewModel data;
  const NewsCard({Key key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: EdgeInsets.all(15.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  this.data.title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 15,
                    color: Color(0xff333333),
                    fontWeight: FontWeight.w500
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 12),),
                Row(
                  children: <Widget>[
                    Text(
                      this.data.source,
                      style: TextStyle(
                        fontSize: 12,
                        color: Color(0xff999999)
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(left: 10),),
                    Text(
                      '${this.data.comments}评论',
                      style: TextStyle(
                          fontSize: 12,
                          color: Color(0xff999999)
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          Padding(padding: EdgeInsets.only(left: 10),),
          Image.network(
            this.data.coverImgUrl,
            width: 100,
            height: 60,
            fit: BoxFit.cover,
          )
        ],
      ),
    );
  }
}

class NewsViewModel {
  /// 新闻标题
  final String title;

  /// 来源
  final String source;

  /// 评论数量
  final int comments;

  /// 新闻配图
  final String coverImgUrl;

  const NewsViewModel({
    this.coverImgUrl,
    this.title,
    this.source,
    this.comments
  });
}
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TimeLine extends StatelessWidget {
  final TimeLineViewModel data;

  const TimeLine({Key key, this.data}) : super(key: key);

  Widget renderComments() {
    return Container(
      margin: EdgeInsets.only(top: 10.0),
      padding: EdgeInsets.all(10.0),
      color: Color(0xfff3f3f5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: this.data.comments.map((comment) {
          return Text.rich(
            TextSpan(
              style: TextStyle(
                fontSize: 15,
                color: Color(0xff333333),
              ),
              children: [
                TextSpan(
                  text: comment.fromUser,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Color(0xff636f80),
                  ),
                ),
                TextSpan(text: '：${comment.content}'),
              ]..insertAll(1, comment.source ? [TextSpan()] : [
                TextSpan(text: '回复 '),
                TextSpan(
                  text: comment.toUser,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Color(0xff636f80),
                  )
                )
              ])
            )
          );
        }).toList(),
      ),
    );
  }

//  Widget renderNew() {
//    return CustomScrollView(
//      shrinkWrap: true,
//      slivers: <Widget>[
//        SliverPadding(
//          padding: EdgeInsets.all(20.0),
//          sliver: SliverList(
//            delegate: SliverChildListDelegate(
//              <Widget>[
//                Text('1111'),
//                Text('121212')
//              ]
//            ),
//          ),
//        )
//      ],
//    );
//  }
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.only(top: 16.0),
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: Image.network(
              this.data.userImgUrl,
              width: 50,
              height: 50,
            ),
          ),
          Padding(padding: EdgeInsets.only(left: 12),),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  this.data.userName,
                  style: TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff636f80),
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 2.0),),
                Text(
                  this.data.saying,
                  style: TextStyle(
                    fontSize: 15,
                    height: 1,
                    color: Color(0xff333333),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.0),
                  child: Image.network(
                    this.data.pic,
                    fit: BoxFit.fitWidth,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      this.data.publishTime,
                      style: TextStyle(
                        fontSize: 13,
                        color: Color(0xff999999),
                      ),
                    ),
                    Icon(
                      Icons.comment,
                      size: 16,
                      color: Color(0xff999999),
                    )
                  ],
                ),
                this.renderComments()
              ],
            ),
          )
        ],
      ),
    );
  }
}

class TimeLineViewModel {
  /// 用户名
  final String userName;

  /// 用户头像地址
  final String userImgUrl;

  /// 说说
  final String saying;

  /// 图片
  final String pic;

  ///发布时间
  final String publishTime;

  /// 评论内容
  final List<Comment> comments;

  const TimeLineViewModel({
    this.userName,
    this.userImgUrl,
    this.saying,
    this.pic,
    this.publishTime,
    this.comments,
  });
}

class Comment {
  /// 是否发起人
  final bool source;

  /// 评论者
  final String fromUser;

  /// 被评论者
  final String toUser;

  // 评论内容
  final String content;

  const Comment({
    this.source,
    this.fromUser,
    this.toUser,
    this.content,
  });
}
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PetCard(),
    );
  }
}

class PetCard extends StatelessWidget {
//  final PetCardViewModel data;
//  final PetCardViewModel data;
//
//  const PetCard({
//    Key key,
//    this.data,
//  }) : super(key: key);

  final PetCardViewModel data = PetCardViewModel(
    coverUrl: 'https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=1425538345,901220022&fm=26&gp=0.jpg',
    avatarUrl: 'https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=1699287406,228622974&fm=26&gp=0.jpg',
    userName: '大米要煮小米粥',
    description: '小米 | 我家的小仓鼠',
    publishTime: '12:59',
    topic: '萌宠小屋',
    publishContent: '今天带着小VIVI去了爪子生活体验馆，好多好玩的小东西都想带回家！',
    replies: 356,
    likes: 258,
    shares: 126,
  );

  Widget renderCover() {
    return Stack(
      fit: StackFit.passthrough,
      children: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(8),
            topRight: Radius.circular(8)
          ),
          child: Image.network(
            data.coverUrl,
            height: 200,
            fit: BoxFit.fitWidth,
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          top: 100,
          bottom: 0,
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color.fromARGB(0, 0, 0, 0),
                  Color.fromARGB(80, 0, 0, 0)
                ],
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget renderUserInfo() {
    return Container(
      margin: EdgeInsets.only(top: 16.0),
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Row(
            children: <Widget>[
              CircleAvatar(
                radius: 20,
                backgroundColor: Color(0xFFCCCCCC),
                backgroundImage: NetworkImage(data.avatarUrl),
              ),
              Padding(padding: EdgeInsets.only(left: 8.0),),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    data.userName,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF333333),
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(top: 2),),
                  Text(
                    data.description,
                    style: TextStyle(
                      fontSize: 12,
                      color: Color(0xFF999999),
                    ),
                  ),
                ],
              )
            ],
          ),
          Text(
            data.publishTime,
            style: TextStyle(
              fontSize: 13,
              color: Color(0xFF999999)
            ),
          )
        ],
      ),
    );
  }

  Widget renderPublishContent() {
    return new Container(
      margin: EdgeInsets.only(top: 16.0),
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(bottom: 14.0),
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
            decoration: BoxDecoration(
              color: Color(0xFFFFC600),
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(8),
                bottomLeft: Radius.circular(8),
                bottomRight: Radius.circular(8)
              ),
            ),
            child: Text(
              '# ${data.topic}',
              style: TextStyle(
                fontSize: 12,
                color: Colors.white
              ),
            ),
          ),
          Text(
            data.publishContent,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: Color(0xff333333)
            ),
          )
        ],
      ),
    );
  }

  Widget renderInteractionArea() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 16),
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              Icon(
                Icons.message,
                size: 16,
                color: Color(0xff999999),
              ),
              Padding(padding: EdgeInsets.only(left: 6),),
              Text(
                data.replies.toString(),
                style: TextStyle(
                  fontSize: 15,
                  color: Color(0xff999999)
                ),
              )
            ],
          ),
          Row(
            children: <Widget>[
              Icon(
                Icons.favorite,
                size: 16,
                color: Color(0xff999999),
              ),
              Padding(padding: EdgeInsets.only(left: 6),),
              Text(
                data.likes.toString(),
                style: TextStyle(
                    fontSize: 15,
                    color: Color(0xff999999)
                ),
              )
            ],
          ),
          Row(
            children: <Widget>[
              Icon(
                Icons.share,
                size: 16,
                color: Color(0xff999999),
              ),
              Padding(padding: EdgeInsets.only(left: 6),),
              Text(
                data.shares.toString(),
                style: TextStyle(
                    fontSize: 15,
                    color: Color(0xff999999)
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            blurRadius: 6,
            spreadRadius: 4,
            color: Color.fromARGB(20, 0, 0, 0),
          )
        ]
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          this.renderCover(),
          this.renderUserInfo(),
          this.renderPublishContent(),
          this.renderInteractionArea()
        ],
      ),
    );
  }
}
















class PetCardViewModel {
  /// 封面地址
  final String coverUrl;

  /// 用户头像地址
  final String avatarUrl;

  /// 用户名
  final String userName;

  /// 用户描述
  final String description;

  /// 话题
  final String topic;

  /// 发布时间
  final String publishTime;

  /// 发布内容
  final String publishContent;

  /// 回复数量
  final int replies;

  /// 喜欢数量
  final int likes;

  /// 分享数量
  final int shares;

  const PetCardViewModel({
    this.coverUrl,
    this.avatarUrl,
    this.userName,
    this.description,
    this.topic,
    this.publishTime,
    this.publishContent,
    this.replies,
    this.likes,
    this.shares
  });
}
/// 宠物卡片mock数据
const PetCardViewModel petCardData = PetCardViewModel(
  coverUrl: 'https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=1425538345,901220022&fm=26&gp=0.jpg',
  avatarUrl: 'https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=1699287406,228622974&fm=26&gp=0.jpg',
  userName: '大米要煮小米粥',
  description: '小米 | 我家的小仓鼠',
  publishTime: '12:59',
  topic: '萌宠小屋',
  publishContent: '今天带着小VIVI去了爪子生活体验馆，好多好玩的小东西都想带回家！',
  replies: 356,
  likes: 258,
  shares: 126,
);
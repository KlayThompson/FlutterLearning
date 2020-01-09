import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FriendCard extends StatelessWidget {
  final FriendViewModel data;

  const FriendCard({Key key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(15),
      child: Row(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: Image.network(
              this.data.userImgUrl,
              width: 40,
              height: 40,
            ),
          ),
          Padding(padding: EdgeInsets.only(left: 15.0),),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      this.data.userName,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff333333)
                      ),
                    ),
                    Text(
                      this.data.msgTime,
                      style: TextStyle(
                        fontSize: 13,
                        color: Color(0xff999999)
                      ),
                    )
                  ],
                ),
                Padding(padding: EdgeInsets.only(top: 10.0),),
                Text(
                  this.data.msgContent,
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xff666666)
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class FriendViewModel {
  /// 用户昵称
  final String userName;

  /// 用户头像
  final String userImgUrl;

  /// 消息内容
  final String msgContent;

  /// 消息收到时间
  final String msgTime;

  const FriendViewModel({
    this.userName,
    this.userImgUrl,
    this.msgContent,
    this.msgTime
  });
}
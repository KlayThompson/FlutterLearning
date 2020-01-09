import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:train_ui/list_view/friend_card.dart';
import 'package:train_ui/list_view/mock_data.dart';

class FriendList extends StatelessWidget {
  const FriendList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView.separated(
        itemBuilder: (context, index) {
          return FriendCard(data: friendList[index]);
        },
        separatorBuilder: (context, index) {
          return Divider(
            height: .5,
            indent: 75,
            color: Color(0xffdddddd),
          );
        },
        itemCount: friendList.length
    );
  }
}
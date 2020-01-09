import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';
import 'package:train_ui/list_view/mock_data.dart';
import 'package:train_ui/list_view/news_card.dart';

class PullDownRefreshList extends StatefulWidget {
  const PullDownRefreshList({Key key}) : super(key: key);

  @override
  _PullDownRefreshList createState() => _PullDownRefreshList();
}

class _PullDownRefreshList extends State<PullDownRefreshList> {

  List list = newsList;

  Future onRefresh() {
    return Future.delayed(Duration(seconds: 1), () {
        Toast.show('当前已是最新数据', context);
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return RefreshIndicator(
      onRefresh: this.onRefresh,
      child: ListView.separated(
          itemBuilder: (context, index) {
            return NewsCard(data: this.list[index],);
          },
          separatorBuilder: (context, index) {
            return Divider(height: .5, color: Color(0xffdddddd),);
          },
          itemCount: this.list.length
      ),
    );
  }
}
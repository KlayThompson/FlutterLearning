import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:train_ui/list_view/mock_data.dart';
import 'package:train_ui/list_view/news_card.dart';

class PullUpLoadMoreList extends StatefulWidget {
  const PullUpLoadMoreList({Key key}) : super(key: key);

  @override
  _PullUpLoadMoreList createState() => _PullUpLoadMoreList();
}

class _PullUpLoadMoreList extends State<PullUpLoadMoreList> {
  bool isLoading = false;
  ScrollController scrollController = ScrollController();
  List<NewsViewModel> list = List.from(newsList);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.scrollController.addListener(() {
      if (!this.isLoading &&
          this.scrollController.position.pixels >=
              this.scrollController.position.maxScrollExtent) {
        this.setState(() {
          this.isLoading = true;
          this.loadMoreData();
        });
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    // 组件销毁时，释放资源（一定不能忘，否则可能会引起内存泄露）
    this.scrollController.dispose();
  }

  Future loadMoreData() {
    return Future.delayed(Duration(seconds: 1), () {
      setState(() {
        this.isLoading = false;
        this.list.addAll(newsList);
      });
    });
  }

  Widget renderBottom() {
    if (this.isLoading) {
      return Container(
        padding: EdgeInsets.symmetric(vertical: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '热门内容稍后呈现...',
              style: TextStyle(fontSize: 15, color: Color(0xff333333)),
            ),
            Padding(
              padding: EdgeInsets.only(left: 15),
            ),
            SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(
                strokeWidth: 3,
              ),
            )
          ],
        ),
      );
    } else {
      return Container(
        padding: EdgeInsets.symmetric(vertical: 15),
        child: Text(
          '上拉加载更多',
          style: TextStyle(fontSize: 15, color: Color(0xff333333)),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView.separated(
      controller: this.scrollController,
      itemCount: this.list.length + 1,
      itemBuilder: (context, index) {
        if (index < this.list.length) {
          return NewsCard(data: this.list[index]);
        } else {
          return this.renderBottom();
        }
      },
      separatorBuilder: (context, index) {
        return Divider(
          height: .5,
          color: Color(0xffdddddd),
        );
      },
    );
  }
}

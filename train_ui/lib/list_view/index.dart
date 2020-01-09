import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:train_ui/common/demo_tabs.dart';
import 'package:train_ui/list_view/builder_usage.dart';
import 'package:train_ui/list_view/normal_list.dart';
import 'package:train_ui/list_view/pull_down_refresh_usage.dart';
import 'package:train_ui/list_view/pull_up_load_more_usage.dart';
import 'package:train_ui/list_view/separater_usage.dart';

const List<DemoTabViewModel> demos = [
  DemoTabViewModel(title: '普通用法', widget: NormalList()),
  DemoTabViewModel(title: 'builder用法', widget: SubscribeAccountList()),
  DemoTabViewModel(title: 'separater用法', widget: FriendList()),
  DemoTabViewModel(title: '下拉刷新用法', widget: PullDownRefreshList()),
  DemoTabViewModel(title: '上拉加载用法', widget: PullUpLoadMoreList())
];

class ListViewDemo extends StatefulWidget {
  @override
  _ListViewDemoState createState() => _ListViewDemoState();
}

class _ListViewDemoState extends State<ListViewDemo>
    with SingleTickerProviderStateMixin {
  TabController tabController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.tabController = TabController(length: demos.length, vsync: this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    this.tabController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return DemoTabs(
      title: 'ListView组件',
      demos: demos,
      tabController: this.tabController,
    );
  }
}
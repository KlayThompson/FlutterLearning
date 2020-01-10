import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:train_ui/common/demo_tabs.dart';
import 'package:train_ui/grid_view/colorful_grid.dart';
import 'package:train_ui/grid_view/guess_like_list.dart';
import 'package:train_ui/grid_view/service_categories.dart';

List<DemoTabViewModel> demos = [
  DemoTabViewModel(title: '彩色格子', widget: ColorfulGrid()),
  DemoTabViewModel(title: '美团服务菜单', widget: ServiceCategories()),
  DemoTabViewModel(title: '相声列表', widget: GuessLikeList())
];

class GridViewDemo extends StatefulWidget {

  @override
  _GridViewDemo createState() => _GridViewDemo();
}

class _GridViewDemo extends State<GridViewDemo> with SingleTickerProviderStateMixin {
  TabController tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.tabController = new TabController(length: demos.length, vsync: this);
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
      title: 'GridView组件',
      tabController: this.tabController,
      demos: demos,
    );
  }
}
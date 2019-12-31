import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:train_ui/basic_widgets/pet_card.dart';
import 'package:train_ui/common/demo_tabs.dart';

List<DemoTableViewModel> demos = [
  DemoTableViewModel(title: '宠物卡片', widget: PetCard())
].map((item) => DemoTableViewModel(
  title: item.title,
  widget: Column(
    mainAxisSize: MainAxisSize.min,
    children: <Widget>[item.widget],
  ),
)).toList();

class BasicWidgetsDemo extends StatefulWidget {
  @override
  _BasicWidgetsDemoState createState() => _BasicWidgetsDemoState();
}

class _BasicWidgetsDemoState extends State<BasicWidgetsDemo> with SingleTickerProviderStateMixin {
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
      title: '基础组件',
      tabController: this.tabController,
      tabScrollable: false,
      demos: demos,
    );
  }
}
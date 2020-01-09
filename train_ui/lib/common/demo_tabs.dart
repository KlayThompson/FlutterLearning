import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DemoTabViewModel {
  final String title;
  final Widget widget;
  
  const DemoTabViewModel({
    this.title,
    this.widget
  });
}

class DemoTabs extends StatelessWidget {
  final String title;
  final List<DemoTabViewModel> demos;
  final bool tabScrollable;
  final TabController tabController;

  DemoTabs({
    this.title,
    this.demos,
    this.tabController,
    this.tabScrollable = true
  });

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(this.title),
        bottom: TabBar(
          controller: tabController,
          isScrollable: this.tabScrollable,
          tabs: this.demos.map((item) => Tab(text: item.title)).toList(),
        ),
      ),
      body: TabBarView(
        controller: this.tabController,
        children: this.demos.map((item) => item.widget).toList(),
      ),
    );
  }
}
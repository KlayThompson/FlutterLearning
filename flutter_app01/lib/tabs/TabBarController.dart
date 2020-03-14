import 'package:flutter/material.dart';

class TabBarControllerPage extends StatefulWidget {
  @override
  _TabBarControllerPageState createState() => _TabBarControllerPageState();
}

class _TabBarControllerPageState extends State<TabBarControllerPage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _tabController.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = new TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          bottom: TabBar(controller: this._tabController, tabs: [
            Tab(
              text: 'Hot',
            ),
            Tab(
              text: 'Sex',
            )
          ]),
        ),
        body: TabBarView(controller: this._tabController, children: [
          Center(
            child: Text('Hot pot'),
          ),
          Center(
            child: Text('Sex body'),
          )
        ]));
  }
}

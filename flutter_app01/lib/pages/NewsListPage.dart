import 'package:flutter/material.dart';

class NewsListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
//          leading: IconButton(icon: Icon(Icons.menu), onPressed: () {}),
            centerTitle: true,
            actions: <Widget>[
              IconButton(icon: Icon(Icons.search), onPressed: () {}),
              IconButton(icon: Icon(Icons.message), onPressed: () {})
            ],
            title: Text('news'),
            bottom: TabBar(
                tabs: [
                  Tab(text: '热门',),
                  Tab(text: '最新',)
                ]
            ),
          ),
          body: TabBarView(children: [
            ListTile(title: Text('第一个Tab'),),
            ListTile(title: Text('第二个Tab'),),
          ])
      ),
    );
  }
}

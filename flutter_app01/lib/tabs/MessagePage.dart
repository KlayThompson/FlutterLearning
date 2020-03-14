import 'package:flutter/material.dart';

class MessagePage extends StatefulWidget {
  @override
  _MessagePageState createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
            appBar: AppBar(
              title: Row(
                children: <Widget>[
                 Expanded(child:  TabBar(tabs: [
                   Tab(text: '最新消息',),
                   Tab(text: '历史消息',)
                 ]))
                ],
              ),
            ),
            body: TabBarView(children: [
              ListView(
                children: <Widget>[
                  ListTile(
                    leading: Icon(Icons.message),
                    title: Text('张珊珊发来一条消息'),
                  ),
                  ListTile(
                    leading: Icon(Icons.message),
                    title: Text('李思思发来一条消息'),
                  ),
                  ListTile(
                    leading: Icon(Icons.message),
                    title: Text('王武武发来一条消息'),
                  )
                ],
              ),
              Text('暂无历史消息')
            ])
        ));
  }
}

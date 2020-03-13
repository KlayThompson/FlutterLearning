import 'package:flutter/material.dart';
import 'package:flutter_app01/tabs/HomePage.dart';
import 'package:flutter_app01/tabs/MessagePage.dart';
import 'package:flutter_app01/tabs/MorePage.dart';

class TabsPage extends StatefulWidget {
  @override
  _TabsPageState createState() => _TabsPageState();
}

class _TabsPageState extends State<TabsPage> {
  int _currentIndex = 0;
  List _pageList = [
    HomePage(),
    MessagePage(),
    MorePage()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Material App Bar'),
      ),
      body: Center(
        child: Container(
          child: this._pageList[this._currentIndex],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: this._currentIndex,
          selectedItemColor: Colors.red,
          onTap: (int index) {
            setState(() {
              this._currentIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text('Home'),
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.message), title: Text('Message')),
            BottomNavigationBarItem(icon: Icon(Icons.more), title: Text('More'))
          ]),
    );
  }
}

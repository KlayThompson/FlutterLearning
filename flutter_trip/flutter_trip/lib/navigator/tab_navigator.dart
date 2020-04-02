import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_trip/pages/home_page.dart';
import 'package:flutter_trip/pages/mine_page.dart';
import 'package:flutter_trip/pages/search_page.dart';
import 'package:flutter_trip/pages/travel_page.dart';

class TabNavigatorPage extends StatefulWidget {
  @override
  _TabNavigatorPageState createState() => _TabNavigatorPageState();
}

class _TabNavigatorPageState extends State<TabNavigatorPage> {

  final List<BottomNavigationBarItem> bottomTabs = [
    BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.home),
        title: Text('首页')
    ),
    BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.search),
        title: Text('搜索')
    ),
    BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.photo_camera),
        title: Text('旅拍')
    ),
    BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.profile_circled),
        title: Text('我的')
    )
  ];

  final List<Widget> bodyPages = [
    HomePage(),
    SearchPage(),
    TravelPage(),
    MinePage()
  ];
  int _index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: bodyPages[_index],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
          onTap: (tappedItemIndex) =>
              setState(() {
                print(tappedItemIndex);
                _index = tappedItemIndex;
              }),
          currentIndex: _index,
          items: bottomTabs
      ),
    );
  }
}
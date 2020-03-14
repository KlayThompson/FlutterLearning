import 'package:flutter/material.dart';
import 'package:flutter_app01/tabs/DrawerPage.dart';
import 'package:flutter_app01/tabs/HomePage.dart';
import 'package:flutter_app01/tabs/MessagePage.dart';
import 'package:flutter_app01/tabs/MorePage.dart';

class TabsPage extends StatefulWidget {
  final index;
  const TabsPage({Key key, this.index = 0}) : super(key: key);
  @override
  _TabsPageState createState() => _TabsPageState(this.index);
}

class _TabsPageState extends State<TabsPage> {
  int _currentIndex = 0;
  _TabsPageState(index) {
    this._currentIndex = index;
  }
  List _pageList = [HomePage(), MessagePage(), MorePage()];
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
      floatingActionButton: Container(
        width: 70,
        height: 70,
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(35),
        ),
        child:  FloatingActionButton(
          child: Icon(Icons.add, size: 30,color: _currentIndex == 1?Colors.white:Colors.black,),
          backgroundColor: _currentIndex == 1 ? Colors.red : Colors.yellow,
          onPressed: () {
            print('floating button');
            setState(() {
              this._currentIndex = 1;
            });
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      drawer: DrawerPage(),
    );
  }
}

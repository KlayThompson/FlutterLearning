import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  int _index = 0;
  @override
  Widget build(BuildContext context) {
     // Make sure this is outside build(), otherwise every setState will chage the value back to 0

    return Scaffold(
      appBar: AppBar(
        title: Text('这是搜索界面'),
      ),
      body: Center(
        child: Container(child: Text('This is search page')),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () =>
            Navigator.pop(context),
        tooltip: 'Increment Counter',
        child: Text('返回🔙'), //Change Icon
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation
          .endFloat, //Change for different locations
    );
  }
}

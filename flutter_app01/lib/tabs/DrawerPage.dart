import 'package:flutter/material.dart';

class DrawerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 6,
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                  child: DrawerHeader(
                    child: Text(
                      '1111',
                      style: TextStyle(color: Colors.white),
                    ),
                    decoration: BoxDecoration(
                        color: Colors.red,
                        image: DecorationImage(
                            image: NetworkImage(
                                'https://www.itying.com/images/flutter/2.png'),
                            fit: BoxFit.cover)),
                  ))
            ],
          ),
          ListView(
            shrinkWrap: true,
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.home),
                title: Text('系统首页'),
              ),
              Divider(),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text('系统设置'),
              ),
              Divider(),
              ListTile(
                leading: Icon(Icons.people),
                title: Text('个人中心'),
              ),
              Divider(),
            ],
          )
        ],
      ),
    );
  }
}

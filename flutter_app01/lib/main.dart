//import 'package:flutter/cupertino.dart';
//import 'package:flutter/material.dart';
//import 'res/listData.dart';
//
//void main() => runApp(MyAPP());
//
//class MyAPP extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    // TODO: implement build
//    return MaterialApp(
//      home: Scaffold(
//        appBar: AppBar(
//          title: Text('ListView'),
//        ),
//        body: MyApp(),
//      ),
//    );
//  }
//}

//class MyApp extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    // TODO: implement build
//    return ListView(
//      padding: EdgeInsets.only(top: 20),
//      children: <Widget>[
//        ListTile(
//          leading: Icon(Icons.add, color: Colors.red, size: 50,),
//          title: Text('title.......'),
//          subtitle: Text('subtitle.'),
//          trailing: Icon(Icons.map),
//        ),
//        ListTile(
//          leading: Image.network('https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1583246804736&di=89f4ec1d4d9c8567b5c37081afde101d&imgtype=0&src=http%3A%2F%2Fimages.999ask.com%2Fupload%2F2016%2Flmm_tk%2F01%2F13%2FD32273F2-23F2-EB22-73DF-15F3DA7A822A.jpg'),
//          title: Text('title.......'),
//          subtitle: Text('subtitle.'),
//        ),
//        ListTile(
//          leading: Icon(Icons.share, color: Colors.yellow, size: 50,),
//          title: Text('title.......'),
//          subtitle: Text('subtitle.'),
//        ),
//      ],
//    );
//  }
//}

//class MyApp extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    // TODO: implement build
//    return ListView(
////      scrollDirection: Axis.horizontal,
//      padding: EdgeInsets.all(10),
//      children: <Widget>[
//        Image.network('https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1583246804736&di=89f4ec1d4d9c8567b5c37081afde101d&imgtype=0&src=http%3A%2F%2Fimages.999ask.com%2Fupload%2F2016%2Flmm_tk%2F01%2F13%2FD32273F2-23F2-EB22-73DF-15F3DA7A822A.jpg'),
//        Padding(padding: EdgeInsets.only(top: 10)),
//        Image.network('https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1583247130666&di=79b625df523a682c1fa14471d6400145&imgtype=jpg&src=http%3A%2F%2Fimg0.imgtn.bdimg.com%2Fit%2Fu%3D112810685%2C556736810%26fm%3D214%26gp%3D0.jpg'),
//        Image.network('https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1583246804735&di=371f8e393ff8950b929c77413ddc7077&imgtype=0&src=http%3A%2F%2Fwww.qqoi.cn%2Fimg_meinv%2F278570283.jpeg'),
//        Image.network('https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1583246804735&di=41ea41ff98627d509d6255317cda1538&imgtype=0&src=http%3A%2F%2Fpic1.win4000.com%2Fwallpaper%2F2017-10-10%2F59dc796257be7.jpg')
//      ],
//    );
//  }
//}

//class MyApp extends StatelessWidget {
//
//  List<Widget> _getData() {
//    List<Widget> datas = new List();
//    for (int i = 0; i < 20; i++) {
//      datas.add(
//          ListTile(
//            title: Text('这是${i}个标题'),
//            subtitle: Text('这是$i个副标题'),
//          )
//      );
//    }
//    return datas;
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    // TODO: implement build
//    return ListView(
//      children: this._getData(),
//    );
//  }
//}

//class MyApp extends StatelessWidget {
//
//  List<Widget> _getData() {
//    var tempList = listData.map((value) {
//      return ListTile(
//        leading: Image.network(value['imageUrl']),
//        title: Text(value['title']),
//        subtitle: Text(value['subTitle']),
//      );
//    });
//    return tempList.toList();
//  }
//
//
//  @override
//  Widget build(BuildContext context) {
//    // TODO: implement build
//    return ListView(
//      children: this._getData(),
//    );
//  }
//}

//class MyApp extends StatelessWidget {
//
//  List<Widget> _getListData() {
//    var tempList = listData.map((value) {
//      return Container(
//        child: Column(
//          children: <Widget>[
//            Image.network(value['imageUrl']),
////            Padding(padding: EdgeInsets.only(top: 10)),
//          SizedBox(height: 20,),
//            Text(
//              value['title'],
//              style: TextStyle(
//                fontSize: 18,
//              ),
//            )
//          ],
//        ),
//        decoration: BoxDecoration(
//          border: Border.all(
//            width: 1,
//            color: Colors.grey
//          )
//        ),
//      );
//    });
//    return tempList.toList();
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    // TODO: implement build
//    return GridView.count(
//        crossAxisCount: 3,
//        crossAxisSpacing: 10,
//        mainAxisSpacing: 10,
//        padding: EdgeInsets.all(10),
//        children: this._getListData(),
//    );
//  }
//}

//class MyApp extends StatelessWidget {
//  Widget _getGridViewData(context, index) {
//    return Container(
//      child: Column(
//        children: <Widget>[
//          Image.network(listData[index]['imageUrl']),
////            Padding(padding: EdgeInsets.only(top: 10)),
//          SizedBox(
//            height: 20,
//          ),
//          Text(
//            listData[index]['title'],
//            style: TextStyle(
//              fontSize: 18,
//            ),
//          )
//        ],
//      ),
//      decoration:
//          BoxDecoration(border: Border.all(width: 1, color: Colors.grey)),
//    );
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    // TODO: implement build
//    return Container(
//      padding: EdgeInsets.all(10),
//      child: GridView.builder(
//          itemCount: listData.length,
//          gridDelegate:
//          SliverGridDelegateWithFixedCrossAxisCount(
//              crossAxisCount: 3,
//              crossAxisSpacing: 10,
//              mainAxisSpacing: 10
//          ),
//          itemBuilder: this._getGridViewData
//      ),
//    );
//  }
//}

//class MyApp extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    // TODO: implement build
//    return Column(
//      children: <Widget>[
//        Container(
//          height: 180,
//          color: Colors.black,
//        ),
//        SizedBox(height: 10,),
//        Row(
//          children: <Widget>[
//            Expanded(
//                flex: 2,
//                child: Container(
//                  height: 180,
//                  child: Image.network('https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1583246804735&di=41ea41ff98627d509d6255317cda1538&imgtype=0&src=http%3A%2F%2Fpic1.win4000.com%2Fwallpaper%2F2017-10-10%2F59dc796257be7.jpg', fit: BoxFit.cover,),
//                )
//            ),
//            SizedBox(width: 10,),
//            Expanded(
//              flex: 1,
//                child: Container(
//                  height: 180,
//                  child: ListView(
//                    children: <Widget>[
//                      Container(
//                        height: 85,
//                        child: Image.network('https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1583246804735&di=41ea41ff98627d509d6255317cda1538&imgtype=0&src=http%3A%2F%2Fpic1.win4000.com%2Fwallpaper%2F2017-10-10%2F59dc796257be7.jpg', fit: BoxFit.cover),
//                      ),
//                      SizedBox(height: 10,),
//                      Container(
//                        height: 85,
//                        child: Image.network('https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1583246804735&di=41ea41ff98627d509d6255317cda1538&imgtype=0&src=http%3A%2F%2Fpic1.win4000.com%2Fwallpaper%2F2017-10-10%2F59dc796257be7.jpg', fit: BoxFit.cover),
//                      )
//                    ],
//                  ),
//                )
//            )
//          ],
//        )
//      ],
//    );
//  }
//}

//class MyApp extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    // TODO: implement build
//    return ListView(
//      children: <Widget>[
//        Stack(
//          alignment: Alignment.center,
//          children: <Widget>[
//            Positioned(
//              child: Image.network(
//                  'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1583246804735&di=41ea41ff98627d509d6255317cda1538&imgtype=0&src=http%3A%2F%2Fpic1.win4000.com%2Fwallpaper%2F2017-10-10%2F59dc796257be7.jpg'),
//            ),
//            Positioned(
//              child: Text(
//                'Hello World',
//                style: TextStyle(fontSize: 25, color: Colors.white),
//              ),
//              bottom: 50,
//            )
//          ],
//        ),
//        SizedBox(height: 10,),
//        Container(
//          child: Stack(
//            children: <Widget>[
//              Image.network(
//                  'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1583246804735&di=41ea41ff98627d509d6255317cda1538&imgtype=0&src=http%3A%2F%2Fpic1.win4000.com%2Fwallpaper%2F2017-10-10%2F59dc796257be7.jpg'),
//              Positioned(
//                bottom: 50,
//                left: 130,
//                child: Text(
//                  'Hello Word',
//                  style: TextStyle(
//                      fontSize: 25,
//                      color: Colors.white,
//                      backgroundColor: Colors.grey),
//                ),
//              )
//            ],
//          ),
//        )
//      ],
//    );
//  }
//}

//class MyApp extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    // TODO: implement build
//    return AspectRatio(//设置宽高比，根据父元素来设置
//      aspectRatio: 2/1,
//      child: Container(
//        color: Colors.yellow,
//      ),
//    );
//  }
//}

//class MyApp extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    // TODO: implement build
//    return Container(
//      color: Colors.grey,
//      child: ListView(
//        children: <Widget>[
//          Card(
//            margin: EdgeInsets.all(10),
//            child: Column(
//              children: <Widget>[
//                ListTile(
//                  title: Text('张三', style: TextStyle(fontSize: 24),),
//                  subtitle: Text('上海安悦节能技术有限公司'),
//                ),
//                ListTile(
//                  title: Text('Tel:192929291992'),
//                ),
//                ListTile(title: Text('Email: sunshinenate@sina.com'),)
//              ],
//            ),
//          ),
//          Card(
//            margin: EdgeInsets.all(10),
//            child: Column(
//              children: <Widget>[
//                ListTile(
//                  title: Text('张三', style: TextStyle(fontSize: 24),),
//                  subtitle: Text('上海安悦节能技术有限公司'),
//                ),
//                ListTile(
//                  title: Text('Tel:192929291992'),
//                ),
//                ListTile(title: Text('Email: sunshinenate@sina.com'),)
//              ],
//            ),
//          )
//        ],
//      ),
//    );
//  }
//}

//class MyApp extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    // TODO: implement build
//    return ListView(
//      children: <Widget>[
//        Card(
//          margin: EdgeInsets.all(10),
//          child: Column(
//            children: <Widget>[
//              //image 适配屏幕宽度
//              AspectRatio(aspectRatio: 16/9,child: Image.network('https://www.itying.com/images/flutter/1.png', fit: BoxFit.cover,),),
//              ListTile(
//                leading: CircleAvatar(backgroundImage:NetworkImage('https://www.itying.com/images/flutter/1.png'),),
//                title: Text('this is title...'),
//                subtitle: Text('this is subtitle'),
//              )
//            ],
//          ),
//        )
//      ],
//    );
//  }
//}

//class MyApp extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    // TODO: implement build
//    return ListView(
//      children: exampleData.map((value) {
//        return Card(
//          margin: EdgeInsets.all(10),
//          child: Column(
//            children: <Widget>[
//              AspectRatio(aspectRatio: 16/9,child: Image.network(value['imageUrl'],fit: BoxFit.cover,),),
//              ListTile(
//                leading: CircleAvatar(
//                  backgroundImage: NetworkImage(value['imageUrl']),
//                ),
//                title: Text(value['title'],style: TextStyle(fontSize: 22),),
//                subtitle: Text(value['description'],overflow: TextOverflow.ellipsis,),
//              )
//            ],
//          ),
//        );
//      }).toList(),
//    );
//  }
//}

//
//class MyApp extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    // TODO: implement build
//    return Wrap(
//      spacing: 10,
//      runSpacing: 15,
//      children: <Widget>[
//        MyButton('第一集'),
//        MyButton('第一集'),
//        MyButton('第一集'),
//        MyButton('第一集'),
//        MyButton('第一集'),
//        MyButton('第一集'),
//        MyButton('第一集'),
//        MyButton('第一集'),
//        MyButton('第一集'),
//        MyButton('第一集'),
//        MyButton('第一集'),
//        MyButton('第一集'),
//        MyButton('第一集'),
//      ],
//    );
//  }
//}

//class MyButton extends StatelessWidget {
//  final String title;
//  const MyButton(this.title, {Key key}) : super(key: key);
//  @override
//  Widget build(BuildContext context) {
//    // TODO: implement build
//    return RaisedButton(
//      child: Text(this.title),
//      textColor: Theme.of(context).accentColor,
//        onPressed: (){
//
//    });
//  }
//}

//class MyApp extends StatefulWidget {
//  @override
//  _MyAppState createState() => _MyAppState();
//}
//
//class _MyAppState extends State<MyApp> {
//  List datas = new List();
//  @override
//  Widget build(BuildContext context) {
//    return ListView(
//      children: <Widget>[
//        Column(
//          children: this.datas.map((value) {
//            return ListTile(title: Text(value),);
//          }).toList(),
//        ),
//        RaisedButton(
//          child: Text('ADD NEW LINE'),
//          onPressed: () {
//            setState(() {
//              this.datas.add('第${datas.length}行');
//            });
//          },
//        )
//      ],
//    );
//
//  }
//}

import 'package:flutter/material.dart';
import 'package:flutter_app01/tabs/TabsPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: TabsPage(),
    );
  }
}

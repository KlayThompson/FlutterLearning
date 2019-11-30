import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    var ratings = new Container(
      padding: const EdgeInsets.all(20.0),
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          new Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              new Icon(Icons.star, color: Colors.black,),
              new Icon(Icons.star, color: Colors.black,),
              new Icon(Icons.star, color: Colors.black,),
              new Icon(Icons.star, color: Colors.black,),
              new Icon(Icons.star, color: Colors.black,)
            ],
          ),
          new Text(
            '170 Reviews',
            style: new TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w800,
                fontFamily: 'Roboto',
                letterSpacing: 0.5,
                fontSize: 20.0
            ),
          ),
        ],
      ),
    );

    var descTextStyle = new TextStyle(
      fontSize: 18.0,
      height: 2.0,
      letterSpacing: 0.5,
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w800,
      color: Colors.black
    );

    // DefaultTextStyle.merge可以允许您创建一个默认的文本样式，该样式会被其
    // 所有的子节点继承
    var iconList = DefaultTextStyle.merge(
      style: descTextStyle,
      child: new Container(
        padding: const EdgeInsets.all(20.0),
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            new Column(
              children: <Widget>[
                new Icon(Icons.kitchen, color: Colors.green[500],),
                new Text('PREP:'),
                new Text('25 min')
              ],
            ),
            new Column(
              children: <Widget>[
                new Icon(Icons.timer, color: Colors.green[500],),
                new Text('COOK:'),
                new Text('1 hr'),
              ],
            ),
            new Column(
              children: <Widget>[
                new Icon(Icons.restaurant, color: Colors.green[500],),
                new Text('FEEDS:'),
                new Text('4-6'),
              ],
            )
          ],
        ),
      )
    );
    
    var titleText = DefaultTextStyle.merge(
      child: new Row(
        children: <Widget>[
          new Text('Strawberry Pavlova')
        ],
      )
    );

    var subTitle = new Container(
      padding: const EdgeInsets.all(32.0),
      child: new Text(
        '''
        Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese Alps. Situated 1,578 meters above sea level, it is one of the larger Alpine Lakes. A gondola ride from Kandersteg, followed by a half-hour walk through pastures and pine forest, leads you to the lake, which warms to 20 degrees Celsius in the summer.
        ''',
        softWrap: true,
      ),
    );

    var leftColumn = new Container(
      padding: new EdgeInsets.fromLTRB(20.0, 30.0, 20.0, 20.0),
      child: new Column(
        children: <Widget>[
          titleText,
          subTitle,
          ratings,
          iconList
        ],
      ),
    );

    return new MaterialApp(
      title: 'Food Rating',
      home: Scaffold(
        appBar: AppBar(
          title: new Text('Food Rating'),
        ),
        body: new Center(
          child: new Container(
            margin: new EdgeInsets.fromLTRB(0.0, 40.0, 0, 30.0),
            height: 600.0,
            child: new Card(
              child: new Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new Container(
                    width: 440.0,
                    child: leftColumn,
                  ),
                  new Image.asset(
                    'images/lake.jpg',
                    height: 400.0,
                    fit: BoxFit.cover,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
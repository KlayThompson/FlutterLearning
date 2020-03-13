import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BasicDemo extends StatelessWidget {
  final String title;
  BasicDemo({Key key, @required this.title}) : super(key: key);

  Widget renderHeader(String title) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 16),
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(this.title),
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          this.renderHeader('SliverGrid'),
          SliverGrid.count(
              crossAxisCount: 3,
              children: colorList.map((color) => Container(color: color,)).toList(),
          ),
          this.renderHeader('SliverList'),
          SliverFixedExtentList(
            delegate: SliverChildBuilderDelegate(
                (context, index) => Container(color: colorList[index],),
              childCount: colorList.length
            ),
            itemExtent: 10,
          )
        ],
      ),
    );
  }
}

final List<Color> colorList = [
Colors.red,
Colors.orange,
Colors.green,
Colors.purple,
Colors.blue,
Colors.yellow,
Colors.pink,
Colors.teal,
Colors.deepPurpleAccent
];
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SnapDemo extends StatelessWidget {
  final String title;
  SnapDemo({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            floating: true,
            snap: true,
//            pinned: true,
            expandedHeight: 250,
            elevation: 0,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(this.title),
              background: Image.network(
                'https://www.apple.com.cn/cn/home/images/heroes/cny/cny_hero__gf8jok8hn9qy_large_2x.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverFixedExtentList(
            delegate: SliverChildBuilderDelegate(
                (context, index) {
                  final isOdd = index%2 == 1;
                  return Container(
                    alignment: Alignment.center,
                    color: isOdd ? Colors.white : Color(0xffeaeaea),
                    child: Text(
                      index.toString(),
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w500,
                        color: Colors.black
                      ),
                    ),
                  );
                },
              childCount: 50,
            ),
            itemExtent: 100,
          )
        ],
      ),
    );
  }
}
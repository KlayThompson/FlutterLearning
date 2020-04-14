import 'package:flutter/material.dart';
import 'package:flutter_trip/model/home_model.dart';

class SalesNavWidget extends StatelessWidget {
  final SalesBox salesBox;
  SalesNavWidget(this.salesBox);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: Column(
        children: <Widget>[
          _titleWidget(),
          _bigCardRow(),
          _smallCardWidget()
        ],
      ),
    );
  }

  Widget _titleWidget() {
    return Container(
      padding: EdgeInsets.fromLTRB(15, 10, 0, 10),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(width: 1, color: Color(0xffdfdfdf))
        )
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Image.network(salesBox.icon,fit: BoxFit.fill,height: 15,),
          _tagTileWidget('获取更多福利 >')
        ],
      ),
    );
  }

  Widget _bigCardRow() {
    return Container(
      child: Row(
        children: <Widget>[
          Expanded(flex: 1,child: Image.network(salesBox.bigCard1.icon)),
          Expanded(flex: 1,child: Image.network(salesBox.bigCard2.icon))
        ],
      ),
    );
  }

  Widget _smallCardWidget() {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Expanded(child: Image.network(salesBox.smallCard1.icon)),
            Expanded(child: Image.network(salesBox.smallCard2.icon)),
          ],
        ),
        Row(
          children: <Widget>[
            Expanded(child: Image.network(salesBox.smallCard3.icon)),
            Expanded(child: Image.network(salesBox.smallCard4.icon)),
          ],
        )
      ],
    );
  }

  Widget _tagTileWidget(String title) {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 3, 10, 3),
      margin: EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [Color(0xffff4e63), Color(0xffff6cc9)]),
          borderRadius: BorderRadius.circular(15)
      ),
      child: Text(title, style: TextStyle(color: Colors.white,fontSize: 13),),
    );
  }
}

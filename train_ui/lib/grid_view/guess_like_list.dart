import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:train_ui/grid_view/mock_data.dart';
import 'package:train_ui/grid_view/programe.dart';

class GuessLikeList extends StatelessWidget {

  Widget renderHeader() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            '猜你喜欢',
            style: TextStyle(
              color: Color(0xff333333),
              fontSize: 22,
              fontWeight: FontWeight.bold
            ),
          ),
          Row(
            children: <Widget>[
              Text(
                '查看更多',
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xff666666),
                ),
              ),
              Icon(
                Icons.keyboard_arrow_right,
                size: 20,
                color: Color(0xff999999),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget renderBody() {
    return GridView.builder(
      shrinkWrap: true,
        itemCount: programmeList.length,
        physics: NeverScrollableScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 16),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,//一行显示几个item
          mainAxisSpacing: 10,//上下item间距,
          crossAxisSpacing: 10,//左右间距
          childAspectRatio: 0.7//子元素的宽高比例
        ),
        itemBuilder: (context, index) {
          return Programe(data: programmeList[index],);
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          this.renderHeader(),
          this.renderBody()
        ],
      ),
    );
  }
}
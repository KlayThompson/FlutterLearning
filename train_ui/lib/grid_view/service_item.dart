import 'package:flutter/cupertino.dart';

class ServiceItem extends StatelessWidget {
  final ServiceItemViewModel data;
  ServiceItem({Key key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.only(bottom: 5),
      child: Column(
        children: <Widget>[
          Expanded(child: this.data.icon,),
          Text(
            this.data.title,
            style: TextStyle(
              fontSize: 14,
              color: Color(0xff333333)
            ),
          )
        ],
      ),
    );
  }
}

class ServiceItemViewModel {
  /// 图标
  final Icon icon;

  /// 标题
  final String title;
  const ServiceItemViewModel({
    this.title,
    this.icon
  });
}
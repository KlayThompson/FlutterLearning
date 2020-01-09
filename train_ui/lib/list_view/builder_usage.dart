import 'package:flutter/cupertino.dart';
import 'package:train_ui/list_view/mock_data.dart';
import 'package:train_ui/list_view/subscribe_account_card.dart';

class SubscribeAccountList extends StatelessWidget {
  const SubscribeAccountList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      color: Color(0xffefefef),
      child: ListView.builder(
          itemCount: subscribeAccountList.length,
          itemBuilder: (context, index) {
            return SubscribeAccountCard(data: subscribeAccountList[index]);
          }
      ),
    );
  }
}
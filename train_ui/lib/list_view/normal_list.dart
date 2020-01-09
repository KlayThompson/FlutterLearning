import 'package:flutter/cupertino.dart';
import 'package:train_ui/basic_widgets/credit_card.dart';
import 'package:train_ui/basic_widgets/mock_data.dart';
import 'package:train_ui/basic_widgets/pet_card.dart';
import 'package:train_ui/basic_widgets/timeline.dart';

class NormalList extends StatelessWidget {

  const NormalList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView(
      children: <Widget>[
        PetCard(data: petCardData,),
        CreditCard(data: creditCardData,),
        TimeLine(data: timeLineData,)
      ],
    );
  }
}
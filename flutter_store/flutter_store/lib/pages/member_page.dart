import 'package:flutter/material.dart';
import 'package:flutter_store/provide/counter.dart';
import 'package:provider/provider.dart';

class MemberPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('会员中心'),
        ),
        body: Container(child:Column(
          children: <Widget>[
            Center(
                child:Consumer<Counter>(
                    builder: (context, counter, child) {
                      return Text('会员中心页面${counter.count}');
                    }
                )
            ),
            MyButton()
          ],
        )
        )
    );;
  }
}


class MyButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _counter = Provider.of<Counter>(context);
    return Container(child: RaisedButton(onPressed: () {
      _counter.addCountNum();
    },
    child: Text('+'),
    ),
    );
  }
}

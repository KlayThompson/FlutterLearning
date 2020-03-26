import 'package:flutter/material.dart';
import 'package:flutter_website/model/counter_model.dart';
import 'package:provider/provider.dart';

class TestProviderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('TestProvider'),
        ),
        body: Container(
          child: Center(child: Consumer<CounterModel>(builder: (context, counter, child) {
            return Text('this should show add num${counter.value}');
          })
          ),
        )
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:train_ui/sliver_widgets/basic_usage.dart';
import 'package:train_ui/sliver_widgets/custom_sliver_header.dart';
import 'package:train_ui/sliver_widgets/float_usage.dart';
import 'package:train_ui/sliver_widgets/pinned_usage.dart';
import 'package:train_ui/sliver_widgets/snap_usage.dart';
import 'package:train_ui/sliver_widgets/sticky_usage.dart';

final List<DemoViewModel> lists = [
  DemoViewModel(title: 'Sliver - Grid和List混合使用', demo: BasicDemo(title: 'Sliver - Grid和List混合使用',)),
  DemoViewModel(title: 'Sliver - float效果', demo: FloatDemo(title: 'Sliver - float效果',)),
  DemoViewModel(title: 'Snap - snap效果', demo: SnapDemo(title: 'Snap - snap效果',)),
  DemoViewModel(title: 'Pinned - pinned效果', demo: PinnedDemo(title: 'Pinned - pinned效果',)),
  DemoViewModel(title: 'Sticky - sticky效果', demo: StickyDemo(title: 'Sticky - sticky效果',)),
  DemoViewModel(title: 'Sliver - 自定义效果', demo: CustomSliverHeaderDemo(title: '哪吒之魔童降世',))
];

class SliverWidgetsDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Sliver系列组件'),
      ),
      body: ListView.builder(
          itemCount: lists.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
              child: RaisedButton(
                padding: EdgeInsets.symmetric(vertical: 13),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => lists[index].demo
                        )
                    );
                  },
                child: Text(lists[index].title),
              ),
            );
          }
      ),
    );
  }
}

class DemoViewModel {
  final String title;
  final Widget demo;
  
  const DemoViewModel({
    this.title,
    this.demo
  });
}
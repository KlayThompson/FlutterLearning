import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  final bool isCover;
  final Widget child;
  final loading;
  LoadingWidget(
      {@required this.child, @required this.loading, this.isCover = false});
  @override
  Widget build(BuildContext context) {
    return !isCover
        ? !loading ? child : _loading()
        : Stack(
            children: <Widget>[child, loading ? _loading() : null],
          );
  }

  Widget _loading() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}

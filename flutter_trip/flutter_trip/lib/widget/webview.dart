import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:flutter_trip/model/home_model.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class WebViewWidget extends StatefulWidget {
  final String title;
  final String url;
  final String statusBarColor;
  final bool hideAppbar;
  WebViewWidget({this.title,this.url,this.statusBarColor,this.hideAppbar});
//  final LocalNavList localNavList;
//  WebViewWidget({this.localNavList});
  @override
  _WebViewWidgetState createState() => _WebViewWidgetState();
}

class _WebViewWidgetState extends State<WebViewWidget> {
  final _plugin = FlutterWebviewPlugin();
  StreamSubscription<String> _onUrlChanged;
  StreamSubscription<WebViewStateChanged> _onStateChanged;
  StreamSubscription<WebViewHttpError> _onHttpError;
  final List<String> catchUrls = ['m.ctrip.com/','m.ctrip.com/html5/','m.ctrip.com/html5','m.ctrip.com/webapp/you/'];
  bool exiting = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _plugin.close();
    _onUrlChanged = _plugin.onUrlChanged.listen((onData) {});
    _onStateChanged =
        _plugin.onStateChanged.listen((WebViewStateChanged state) {
      switch (state.type) {
        case WebViewState.startLoad:
          if (_isToMain(state.url) && !exiting) {
            exiting = true;
            Navigator.pop(context);
          }
          break;
        default:
          break;
      }
    });
    _onHttpError = _plugin.onHttpError.listen((WebViewHttpError err) {
      print(err);
    });
  }

  bool _isToMain(String url) {
    bool contain = false;
    for (String value in catchUrls) {
      if (url?.endsWith(value) ?? false) {
        contain = true;
        break;
      }
    }
    return contain;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _onUrlChanged.cancel();
    _onStateChanged.cancel();
    _onHttpError.cancel();
    _plugin.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final statusBarColorStr = widget.statusBarColor ?? 'ffffff';
    Color backBtnColor;
    if (statusBarColorStr == 'ffffff') {
      backBtnColor = Colors.black;
    } else {
      backBtnColor = Colors.white;
    }
    return Scaffold(
        body: Column(
      children: <Widget>[
        _appbar(Color(int.parse('0xff' + statusBarColorStr)), backBtnColor),
        Container(
          child: Expanded(
              child: WebviewScaffold(
                  url: widget.url,
                withZoom: true,
                withLocalStorage: true,
                hidden: true,
                initialChild: Center(
                  child: CircularProgressIndicator(),
                ),
              )
          ),
        )
      ],
    ));
  }

  Widget _appbar(Color barColor, Color backIconColor) {
    if (widget.hideAppbar) {
      return Container(
        color: barColor,
        height: ScreenUtil().setHeight(60),
      );
    }
    return Container(
      child: FractionallySizedBox(
        widthFactor: 1,
        child: Stack(
          children: <Widget>[
            // 返回按钮
            IconButton(
                icon: Icon(
                  CupertinoIcons.clear_thick,
                  color: backIconColor,
                ),
                onPressed: () {}),
            Positioned(
                left: 0,
                top: 0,
                child: Container(
                  child: Center(
                    child: Text(
                      widget.title ?? '',
                      style: TextStyle(color: backIconColor, fontSize: 22),
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}

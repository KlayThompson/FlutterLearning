import 'package:flutter/material.dart';

class LoadingPage extends StatefulWidget {
  @override
  _LoadingPageState createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 3), (){
      Navigator.of(context).pushReplacementNamed('/app');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: <Widget>[
          Image.asset('assets/03.jpg'),
          Positioned(
              bottom: 100,
              child: Text(
                '上汽集团',
                style: TextStyle(
                    fontSize: 36,
                    color: Colors.white,
                    decoration: TextDecoration.none),
              )
          )
        ],
      ),
    );
  }
}

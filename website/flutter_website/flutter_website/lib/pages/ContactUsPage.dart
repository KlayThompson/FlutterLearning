import 'package:flutter/material.dart';

class ContactUsPage extends StatefulWidget {
  @override
  _ContactUsPageState createState() => _ContactUsPageState();
}

class _ContactUsPageState extends State<ContactUsPage> {
  String inputName;
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          title: Text('联系我们'),
        ),
        body: ListView(
          children: <Widget>[
            Column(
              children: <Widget>[
                AspectRatio(aspectRatio: 16 / 9,
                  child: Image.network(
                    'http://pic1.win4000.com/wallpaper/2020-03-11/5e68b19deb1b5.jpg',
                    fit: BoxFit.cover,),),
                SizedBox(height: 30,),
                Container(
                    width: screenWidth - 100,
                    child: Column(
                      children: <Widget>[
                        TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: '请输入姓名',
                            prefixIcon: Icon(Icons.people)
                          ),
                          onChanged: (value) {
                            setState(() {
                              this.inputName = value;
                            });
                          },
                        ),
                        SizedBox(height: 20,),
                        Container(
                          width: 200,
                          height: 50,
                          child: RaisedButton(
                            onPressed: () {print(this.inputName);},
                            child: Text('提交'),
                            color: Colors.redAccent,
                            textColor: Colors.white,
                          ),
                        )
                      ],
                    )
                ),
              ],
            )
          ],
        )
    );
  }
}

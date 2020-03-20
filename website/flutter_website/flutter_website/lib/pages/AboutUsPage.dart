import 'package:flutter/material.dart';

class AboutUsPage extends StatefulWidget {
  @override
  _AboutUsPageState createState() => _AboutUsPageState();
}

class _AboutUsPageState extends State<AboutUsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('关于我们'),
        ),
        body: ListView(
          children: <Widget>[
            AspectRatio(
                aspectRatio: 16/9,
              child: Image.network('http://pic1.win4000.com/wallpaper/2020-03-11/5e68b19deb1b5.jpg',fit: BoxFit.cover,),
            ),
            SizedBox(height: 10,),
            ListTile(
              leading: Icon(Icons.business),
              title: Text('公司简介'),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.of(context).pushNamed('/webView', arguments: {'title': '公司简介', 'webUrl': 'https://www.baidu.com'});
              },
            ),
            Divider(height: 20, color: Colors.grey,),
            ListTile(
              leading: Icon(Icons.star),
              title: Text('给我评分'),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
            Divider(height: 20, color: Colors.grey,),
            ListTile(
              leading: Icon(Icons.local_phone),
              title: Text('联系我们'),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.of(context).pushNamed('/contact');
              },
            ),
            Divider(height: 20, color: Colors.grey,),
          ],
        )
    );
  }
}

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class LeaderInfoWidget extends StatelessWidget {
  final String imgUrl;
  final String phoneNum;
  LeaderInfoWidget({this.imgUrl, this.phoneNum});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: InkWell(
        onTap: _launchUrl,
        child: Image.network(imgUrl),
      ),
    );
  }

  _launchUrl() async{
    var url = 'tel:' + this.phoneNum;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw Exception('无法打开此url：$url');
    }
  }
}

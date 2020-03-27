import 'package:flutter/material.dart';
import 'package:flutter_store/app.dart';

class AdBannerWidget extends StatelessWidget {
  final String adImageUrl;
  AdBannerWidget({this.adImageUrl});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: InkWell(
        onTap: () {},
        child: Image.network(this.adImageUrl),
      ),
    );
  }
}

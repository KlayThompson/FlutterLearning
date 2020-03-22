import 'package:flutter/material.dart';

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

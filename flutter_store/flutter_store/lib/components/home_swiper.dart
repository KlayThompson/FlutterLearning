import 'package:flutter/material.dart';
import 'package:flutter_store/model/home_content_model.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class HomeSwiperWidget extends StatelessWidget {
  List items;
  HomeSwiperWidget({this.items});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: AspectRatio(
        aspectRatio: 16 / 9,
        child: Swiper(
          itemCount: items.length,
          itemBuilder: (context, index) {
            return Image.network(this.items[index]['image'],fit: BoxFit.cover,);
          },
          autoplay: true,
          pagination: SwiperPagination(),
        ),
      ),
    );
  }
}

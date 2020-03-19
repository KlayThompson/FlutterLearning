import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class BannerWidget extends StatelessWidget {

  List <String> lists = [
    'http://pic1.win4000.com/wallpaper/2020-03-11/5e68b19ad4819.jpg',
    'http://pic1.win4000.com/wallpaper/2020-03-11/5e68b19bd58c2.jpg',
    'http://pic1.win4000.com/wallpaper/2020-03-11/5e68b19cd7ce5.jpg',
    'http://pic1.win4000.com/wallpaper/2020-03-11/5e68b19deb1b5.jpg',
    'http://pic1.win4000.com/wallpaper/2020-03-11/5e68b19f07443.jpg',
    'http://pic1.win4000.com/wallpaper/2020-03-11/5e68b1a018996.jpg',
    'http://pic1.win4000.com/wallpaper/2020-03-11/5e68b1a12ee93.jpg',
    'http://pic1.win4000.com/wallpaper/2020-03-11/5e68b1a23963d.jpg'
  ];

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 16/9,
      child: Swiper(
          itemCount: lists.length,
          itemBuilder: (BuildContext context, int index) {
            return Image.network(lists[index], fit: BoxFit.cover,);
    },
        autoplay: true,
      ),
    );
  }
}

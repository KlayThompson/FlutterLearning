import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeBannerWidget extends StatelessWidget {
  final List<String> bannerList = [
    'http://pages.ctrip.com/commerce/promote/20180718/yxzy/img/640sygd.jpg',
    'https://dimg04.c-ctrip.com/images/700c10000000pdili7D8B_780_235_57.jpg',
    'https://dimg04.c-ctrip.com/images/700u0r000000gxvb93E54_810_235_85.jpg'
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().setWidth(750),
      height: ScreenUtil().setHeight(300),
      child: Swiper(
        itemCount: bannerList.length,
        autoplay: true,
        pagination: SwiperPagination(),
        itemBuilder: (context, index) {
          return Image.network(
            bannerList[index],
            fit: BoxFit.fill,
          );
        },
      ),
    );
  }
}
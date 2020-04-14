import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_trip/model/home_model.dart';

class HomeBannerWidget extends StatelessWidget {
  final List<BannerList> bannerList;
  HomeBannerWidget(this.bannerList);
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
            bannerList[index].icon,
            fit: BoxFit.fill,
          );
        },
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_store/model/home_content_model.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeSwiperWidget extends StatelessWidget {
  List items;
  HomeSwiperWidget({this.items});

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 750, height: 1334);
    return Container(
      height: ScreenUtil().setHeight(333),
      width: ScreenUtil().setWidth(750),
      child: Swiper(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Image.network(this.items[index]['image'],fit: BoxFit.fill,);
        },
        autoplay: true,
        pagination: SwiperPagination(
          builder: DotSwiperPaginationBuilder(
            color: Color.fromRGBO(0, 0, 0, .3),
            activeColor: Color(0xff333333)
          )
        ),
      ),
    );
  }
}

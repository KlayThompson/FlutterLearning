import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_store/provide/category_provide.dart';
import 'package:flutter_store/model/category_model.dart';
import 'package:flutter_store/service/category_service.dart';
import 'package:provider/provider.dart';

class CategoryRightChannelWidget extends StatefulWidget {
  @override
  _CategoryRightChannelWidgetState createState() =>
      _CategoryRightChannelWidgetState();
}

class _CategoryRightChannelWidgetState
    extends State<CategoryRightChannelWidget> {

  @override
  Widget build(BuildContext context) {
    final _channelsProvider = Provider.of<CategorySubProvide>(context);
    return Container(
      height: ScreenUtil().setHeight(80),
      width: ScreenUtil().setWidth(750 - 220),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            bottom: BorderSide(width: 1.0, color: Colors.black12),
            right: BorderSide(width: 1.0, color: Colors.black12),
          )),
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: _channelsProvider.subCategories.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return _getSingleCell(_channelsProvider.subCategories[index], index);
          }),
    );
  }

  _getSingleCell(BxMallSubDto item, int index) {
    final _provider = Provider.of<CategorySubProvide>(context);
    bool isSelect = _provider.selectIndex == index? true : false;
    return InkWell(
      onTap: () {
        _provider.setSubCategorySelectIndex(index, item.mallSubId);
        //请求子分类商品数据
        getCategoryProductList(context,categoryId: _provider.categoryId, categorySubId: _provider.subCategoryId);
      },
      child: Container(
        padding: EdgeInsets.fromLTRB(5, 10, 5, 10),
        child: Text(
          item.mallSubName,
          style: TextStyle(
              fontSize: ScreenUtil().setSp(26),
              color: isSelect ? Colors.pink : Color(0xff333333)
          ),
        ),
      ),
    );
  }
}

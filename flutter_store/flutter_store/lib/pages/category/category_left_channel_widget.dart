import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_store/model/category_model.dart';
import 'package:flutter_store/provide/category_provide.dart';
import 'package:flutter_store/service/category_service.dart';
import 'package:provider/provider.dart';


class CategoryLeftWidget extends StatefulWidget {
  final List<CategoryModel> lists;
  CategoryLeftWidget({this.lists});
  @override
  _CategoryLeftWidgetState createState() =>
      _CategoryLeftWidgetState(categories: lists);
}

class _CategoryLeftWidgetState extends State<CategoryLeftWidget> {
  var selectIndex = 0;
  final List<CategoryModel> categories;
  _CategoryLeftWidgetState({this.categories});

  //list view
  Widget _getSingleCategoryWidget(context,index) {
    final _provider = Provider.of<CategorySubProvide>(context);
    bool isSelect = index == selectIndex ? true : false;
    //map data
    return InkWell(
      onTap: () {
        setState(() {
          selectIndex = index;
        });
        _provider.setSubCategory(categories[index].bxMallSubDto, categories[index].mallCategoryId);
        //request subcategory
        getCategoryProductList(context, categoryId: categories[index].mallCategoryId);
      },
      child: Container(
        height: ScreenUtil().setHeight(100),
        padding: EdgeInsets.only(left: 15, top: 15),
        decoration: BoxDecoration(
            border:
            Border(
                bottom: BorderSide(width: 1.0, color: Colors.black12),
              right: BorderSide(width: 1.0, color: Colors.black12),
            ),
          color: isSelect ? Color.fromRGBO(244, 245, 245, 1.0) : Colors.white
        ),
        child: Text(
          categories[index].mallCategoryName,
          style: TextStyle(
              color: Color(0xff333333), fontSize: ScreenUtil().setSp(28)),
        ),
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCategoryProductList(context);
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: ScreenUtil().setWidth(220),
      child: this.categories.length > 0 ? ListView.builder(
          itemCount: categories.length,
          itemBuilder: (context, index) {
            return _getSingleCategoryWidget(context,index);
          }
      ) : Container(child: Center(child: CircularProgressIndicator(),),)
    );
  }
}

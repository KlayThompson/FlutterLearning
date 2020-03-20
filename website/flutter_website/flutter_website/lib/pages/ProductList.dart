
import 'package:flutter/material.dart';
import 'package:flutter_website/model/ProductModel.dart';

class ProductListPage extends StatelessWidget {
  final ProductItemListModel dataList;
  final VoidCallback getNextPage;
  ProductListPage({this.dataList, this.getNextPage});
  @override
  Widget build(BuildContext context) {
    return dataList.data.length == 0?
    Center(child: CircularProgressIndicator(),) :
      ListView.builder(
        itemCount: dataList.data.length,
        itemBuilder: (context, index) {
          ProductItemModel model = dataList.data[index];
          if ((index + 4) == dataList.data.length) {
            getNextPage();
          }
          return InkWell(
            onTap: () {
              Navigator.of(context).pushNamed('/productDetail',arguments: model);
            },
            child: Container(
              color: Colors.white,
              padding: EdgeInsets.only(top: 5, left: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Image.network(model.imageUrl,width: 120,height: 120,fit: BoxFit.cover,),
                  Expanded(
                      child: Container(
                        padding: EdgeInsets.only(left: 10),
                        height: 120,
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: Color(0xfff8f8f8),
                              width: 1
                            )
                          )
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(model.name, maxLines: 2, overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 16, color: Color(0xff333333)),),
                            Row(
                              children: <Widget>[
                                SizedBox(
                                  width: 5,
                                ),
                                Container(
                                  width: 50,
                                  decoration: BoxDecoration(border: Border.all(width: 1, color: Colors.blue),borderRadius: BorderRadius.circular(5)),
                                  alignment: Alignment.center,
                                  child: Text(model.type, style: TextStyle(color: Colors.grey),),
                                )
                              ],
                            ),
                            Text(model.desc, style: TextStyle(color: Colors.orange),)
                          ],
                        ),
                      )
                  )
                ],
              ),
            ),
          );
        }
    );
  }
}

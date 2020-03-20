import 'package:flutter/material.dart';
import 'package:flutter_website/model/NewsModel.dart';
import 'package:flutter_website/service/NewsService.dart';

class NewsPage extends StatefulWidget {
  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  NewsItemListModel listDta = NewsItemListModel([]);
  getNews() async {
    var json = await getNewsList();
    NewsItemListModel temp = NewsItemListModel.fromJson(json);
    setState(() {
      listDta.data.addAll(temp.data);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('新闻'),
        ),
        body: this.listDta.data.length == 0
            ? Center(child: CircularProgressIndicator(),)
            : ListView.separated(
                itemBuilder: (context, index) {
                  NewsItemModel model = listDta.data[index];
                  return ListTile(
                    title: Text(model.title),
                    subtitle: Text(model.author),
                    leading: Image.network(model.imgUrl),
                    contentPadding: EdgeInsets.all(10),
                    trailing: Icon(Icons.chevron_right),
                    onTap: () {
                      Navigator.of(context).pushNamed('/newsDetail', arguments: model);
                    },
                  );
                },
                separatorBuilder: (context, index) => Divider(
                      height: 0.5,
                      color: Colors.grey,
                    ),
                itemCount: listDta.data.length
        )
    );
  }
}

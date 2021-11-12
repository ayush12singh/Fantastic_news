/*This is the screen which will open when you click on categories */

import "package:flutter/material.dart";
import 'package:flutter_news/helper/news.dart';
import 'package:flutter_news/model/articlemodel.dart';
import 'home.dart';

class CategoryNews extends StatefulWidget {
  final String category;
  // ignore: use_key_in_widget_constructors, prefer_const_constructors_in_immutables
  CategoryNews({required this.category});
  @override
  _CategoryNewsState createState() => _CategoryNewsState();
}

class _CategoryNewsState extends State<CategoryNews> {
  var articles = <ArticleModel>[];
  bool load = true;
  @override
  void initState() {
    super.initState();
    getcategorynews();
  }

  getcategorynews() async {
    CategoriesNews newsobj = CategoriesNews();
    await newsobj.getNews(widget.category);

    articles = newsobj.categorynews;

    setState(() {
      load = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Fantastic',
              style: TextStyle(
                  color: Colors.blue,
                  fontSize: 23,
                  fontWeight: FontWeight.w500),
            ),
            IconButton(
                icon: const Icon(Icons.book_rounded, color: Colors.black87),
                onPressed: () {}),
            const Text('News',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 23,
                    fontWeight: FontWeight.w500))
          ],
        ),
        actions: <Widget>[
          Opacity(
            opacity: 0,
            child: Container(
              child: const Icon(
                Icons.save,
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16),
            ),
          )
        ],
        elevation: 10.0,
      ),
      body: load == true
          // ignore: avoid_unnecessary_containers
          ? Container(child: const Center(child: CircularProgressIndicator()))
          : SingleChildScrollView(
              child: Container(
                margin: const EdgeInsets.only(top: 10),
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.only(top: 15),
                      child: ListView.builder(
                          physics: const ClampingScrollPhysics(),
                          itemCount: articles.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            // ignore: avoid_print
                            print(articles[index].title);
                            return MainTile(
                              imgurl: articles[index].imgurl,
                              title: articles[index].title,
                              desc: articles[index].description,
                              url: articles[index].url,
                            );
                          }),
                    )
                  ],
                ),
              ),
            ),
    );
  }
}

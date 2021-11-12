/* Home Screen of our app*/

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_news/helper/data.dart';
import 'package:flutter_news/helper/news.dart';
import 'package:flutter_news/model/articlemodel.dart';
import 'package:flutter_news/model/catmodel.dart';
import 'package:flutter_news/views/article.dart';
import 'package:flutter_news/views/category.dart';

// ignore_for_file: prefer_const_constructors
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var categories = <CategoryModel>[];
  var articles = <ArticleModel>[];
  bool load = true;
  @override
  void initState() {
    super.initState();
    categories = getCategories();
    getnews();
  }

  getnews() async {
    News newsobj = News();
    await newsobj.getNews();
    articles = newsobj.news;

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
              Text(
                'Fantastic',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 23,
                    fontWeight: FontWeight.w500),
              ),
              IconButton(
                icon: Icon(Icons.book_rounded),
                onPressed: () {},
              ),
              Text('News',
                  style: TextStyle(
                      color: Colors.blue,
                      fontSize: 23,
                      fontWeight: FontWeight.w500))
            ],
          ),
          elevation: 0.0,
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
                        // ignore: sized_box_for_whitespace
                        Container(
                          child: ListView.builder(
                              itemCount: categories.length,
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return Category(
                                  imgurl: categories[index].imgurl,
                                  categoriename: categories[index].categoryname,
                                );
                              }),
                          height: 70,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        // ignore: avoid_unnecessary_containers
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
                    )),
              ));
  }
}
/*This is the category section of news */

class Category extends StatelessWidget {
  final String imgurl, categoriename;
  // ignore: use_key_in_widget_constructors
  const Category({required this.imgurl, required this.categoriename});

  @override
  Widget build(BuildContext context) {
    // ignore: avoid_unnecessary_containers
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => CategoryNews(
                      category: categoriename.toLowerCase(),
                    )));
      },
      child: Container(
        padding: const EdgeInsets.only(right: 19),
        child: Stack(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: CachedNetworkImage(
                imageUrl: imgurl,
                width: 120,
                height: 80,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              alignment: Alignment.center,
              child: Text(
                categoriename,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: Colors.black26,
              ),
              width: 120,
              height: 80,
            )
          ],
        ),
      ),
    );
  }
}
/*This is the main section of news */

// ignore: must_be_immutable
class MainTile extends StatelessWidget {
  String imgurl, title, desc, url;

  // ignore: use_key_in_widget_constructors
  MainTile(
      {required this.imgurl,
      required this.title,
      required this.desc,
      required this.url});

  @override
  Widget build(BuildContext context) {
    // ignore: avoid_unnecessary_containers

    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ArticleView(articleurl: url)));
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 20),
        child: Column(
          children: <Widget>[
            ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(imgurl)),
            const SizedBox(
              height: 10,
            ),
            Text(title,
                style: const TextStyle(
                    color: Colors.black87,
                    fontSize: 18,
                    fontWeight: FontWeight.w500)),
            const SizedBox(
              height: 8,
            ),
            Text(desc, style: const TextStyle(color: Colors.black54))
          ],
        ),
      ),
    );
  }
}

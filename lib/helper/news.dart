/*It shows the lastest news acquired through API */

import 'dart:convert';
import 'package:flutter_news/model/articlemodel.dart';
import 'package:http/http.dart' as http;

/*It shows news without any category */

class News {
  var news = <ArticleModel>[];

  Future<void> getNews() async {
    var apiKEY = ""; //use your own API key
    var response = await http.get(Uri.parse(
        "https://newsapi.org/v2/top-headlines?country=in&apiKey=$apiKEY"));

    var jsondata = jsonDecode(response.body);

    if (jsondata['status'] == 'ok') {
      jsondata['articles'].forEach((element) {
        if (element['urlToImage'] != null && element['description'] != null) {
          ArticleModel articleModel = ArticleModel(
            author: element['author'].toString(),
            title: element['title'].toString(),
            description: element['description'].toString(),
            url: element['url'].toString(),
            imgurl: element['urlToImage'].toString(),
            content: element['content'].toString(),
          );

          news.add(articleModel);
        }
      });
    }
  }
}

/*It shows news based on a category*/

class CategoriesNews {
  var categorynews = <ArticleModel>[];

  Future<void> getNews(String categoryname) async {
    var apiKEY = ""; //use your own API key
    var response = await http.get(Uri.parse(
        "https://newsapi.org/v2/top-headlines?country=in&category=$categoryname&apiKey=$apiKEY"));

    var jsondata = jsonDecode(response.body);

    if (jsondata['status'] == 'ok') {
      jsondata['articles'].forEach((element) {
        if (element['urlToImage'] != null && element['description'] != null) {
          ArticleModel articleModel = ArticleModel(
            author: element['author'].toString(),
            title: element['title'].toString(),
            description: element['description'].toString(),
            url: element['url'].toString(),
            imgurl: element['urlToImage'].toString(),
            content: element['content'].toString(),
          );

          categorynews.add(articleModel);
        }
      });
    }
  }
}

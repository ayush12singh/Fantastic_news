/*This is the webview screen which will open when you click on any particular news */

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

// ignore_for_file: prefer_const_constructors
class ArticleView extends StatefulWidget {
  final String articleurl;
  // ignore: use_key_in_widget_constructors
  const ArticleView({required this.articleurl});

  @override
  _ArticleViewState createState() => _ArticleViewState();
}

class _ArticleViewState extends State<ArticleView> {
  final Completer<WebViewController> _completer =
      Completer<WebViewController>();
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
                    color: Colors.blue,
                    fontSize: 23,
                    fontWeight: FontWeight.w500),
              ),
              IconButton(
                  icon: Icon(Icons.book_rounded, color: Colors.black87),
                  onPressed: () {}),
              Text('News',
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
                child: Icon(
                  Icons.save,
                ),
                padding: EdgeInsets.symmetric(horizontal: 16),
              ),
            )
          ],
          elevation: 10.0,
        ),
        // ignore: avoid_unnecessary_containers
        body: Container(
          child: WebView(
            initialUrl: widget.articleurl,
            onWebViewCreated: ((WebViewController webViewController) {
              _completer.complete(webViewController);
            }),
          ),
        ));
  }
}

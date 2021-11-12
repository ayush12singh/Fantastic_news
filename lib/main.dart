import 'package:flutter/material.dart';
import 'package:flutter_news/views/home.dart';

void main() {
  runApp(const Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Fantastic_news',
        theme: ThemeData(primaryColor: Colors.white),
        home: const Home());
  }
}

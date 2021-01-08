import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart'; //常用英文单词

import 'pages/main/main.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // final wordPair = new WordPair.random();
    return MaterialApp(
      title: '首页',
      home: MainPage()
    );
  }
}

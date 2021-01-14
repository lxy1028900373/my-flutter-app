import 'package:flutter/material.dart';
import 'package:flutter_app/core/router/router.dart';
import 'pages/main/main.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // final wordPair = new WordPair.random();
    return MaterialApp(
      title: '首页',
      // home: MainPage(),  //注册路由后，须删除该页面路由
      // 路由
      initialRoute: MyRouter.initialRoute,
      routes: MyRouter.routes,
      onGenerateRoute: MyRouter.generateRoute,
      onUnknownRoute: MyRouter.unknownRoute,
    );
  }
}

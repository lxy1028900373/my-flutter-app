import 'package:flutter/material.dart';
import 'package:flutter_app/pages/detail/detail.dart';
import 'package:flutter_app/pages/home/home.dart';
import 'package:flutter_app/pages/main/main.dart';
import 'package:flutter_app/pages/no_found.dart';


class MyRouter {
  static final String initialRoute = MainPage.routeName;

  static final Map<String, WidgetBuilder> routes = {
    MainPage.routeName: (ctx) => MainPage(),
    DetailPage.routeName: (ctx) => DetailPage(),
  };

  //生成路由
  static final RouteFactory generateRoute = (settings) {
    if (settings.name == MainPage.routeName) {
      return MaterialPageRoute(
          builder: (ctx) {
            return HomePage();
          },
          fullscreenDialog: true
      );
    }

    return null;
  };

  // 路由不匹配
  static final RouteFactory unknownRoute = (settings) {
    print('onUnknownRoute:$settings');
    return MaterialPageRoute(builder: (BuildContext context) {
      return NoFoundPage();
    });
  };
}
import 'package:flutter/material.dart';

//路由不匹配提示页
class NoFoundPage extends StatelessWidget {
  static const String routeName = "/no_found";
  
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('NoFoundPage'),
      ),
    );
  }
}

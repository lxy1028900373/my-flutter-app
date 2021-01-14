import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  static const String routeName = "/detail";
  
  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    String lessonName;
    String lessonId;

    // 获取参数
    dynamic options = ModalRoute.of(context).settings.arguments;
    if (options != null) {
      lessonName = options["title"];
      lessonId = options["id"];
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(lessonName),
        centerTitle: true,
      ),
      body: Center(
        child: Text('课程详情'),
      ),
    );
  }
}

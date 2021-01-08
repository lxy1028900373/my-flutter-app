import 'package:flutter/material.dart';
import 'dart:math';

import '../../widgets/swiper.dart';
import '../../widgets/grid.dart';

//首页
class HomeContent extends StatefulWidget {
  @override
  _HomeContentState createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        buildBanner(),
        buildGridView(),
        buildLessList()
      ],
    );
  }
}

// banner
Widget buildBanner(){
  List _banners= [
    "assets/images/banner/banner1.jpg",
    "assets/images/banner/banner2.jpg",
    "assets/images/banner/banner3.jpg"
  ];

  return Container(
    child: SizedBox(
      height: 162,
      child: HomeSwiper(banners: _banners),
    ),
  );
}

//宫格
Widget buildGridView(){
  List _grid= [
    {"image": "assets/images/grid_icon.png", "title":"标题"},
    {"image": "assets/images/grid_icon.png", "title":"标题"},
    {"image": "assets/images/grid_icon.png", "title":"标题"},
    {"image": "assets/images/grid_icon.png", "title":"标题"},
    {"image": "assets/images/grid_icon.png", "title":"标题"},
    {"image": "assets/images/grid_icon.png", "title":"标题"},
  ];

  return Container(
    padding: const EdgeInsets.all(16),
    child: SizedBox(
      height: 162,
      child: HomeGrid(grid: _grid),
    )
  );
}

//课程列表
Widget buildLessList(){
  List _lesson=[
    {"title": "课程1", "tag_txt": "标签", "label_txt": "属性", "image": "assets/images/lesson/image_1.jpg"},
    {"title": "课程2", "tag_txt": "标签", "label_txt": "属性", "image": "assets/images/lesson/image_2.jpg"},
    {"title": "课程3", "tag_txt": "标签", "label_txt": "", "image": "assets/images/lesson/image_3.jpg"},
    {"title": "课程4", "tag_txt": "", "label_txt": "", "image": "assets/images/lesson/image_4.jpg"},
    {"title": "课程5", "tag_txt": "", "label_txt": "属性", "image": "assets/images/lesson/image_5.jpg"},
    {"title": "课程6", "tag_txt": "标签", "label_txt": "属性", "image": "assets/images/lesson/image_6.jpg"}
  ];

  return  Container(
    padding: const EdgeInsets.fromLTRB(16, 40, 16, 40),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        buildLessonItem()
      ],
    ),
  );
}

Widget buildLessonItem(){
  return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        buildContentInfoTitle()
      ]
  );
}

Widget buildContentInfoTitle(){
  return Container(
    height: 300,
    color: Colors.purple,
    child: Text('嘿嘿'),
  );
}
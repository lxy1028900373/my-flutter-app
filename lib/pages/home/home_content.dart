import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';

import '../../widgets/swiper.dart';
import '../../widgets/grid.dart';
import 'home_lesson_item.dart';

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
    padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
    child: SizedBox(
      height: 162,
      child: HomeGrid(grid: _grid),
    )
  );
}

//课程列表
Widget buildLessList(){
  List _lesson=[
    {"id": "1", "title": "这是一个长标题这是一个长标题这是一个长标题", "tag_txt": "标签", "label_txt": "属性", "image": "assets/images/lesson/image_1.jpg", "price": "799", "diff_price": 199, "stu_num": 10, "is_limit": 1},
    {"id": "2", "title": "课程2", "tag_txt": "标签", "label_txt": "属性", "image": "assets/images/lesson/image_2.jpg", "price": "799", "diff_price": 0, "stu_num": 0, "is_limit": 0},
    {"id": "3", "title": "课程3", "tag_txt": "标签", "label_txt": "", "image": "assets/images/lesson/image_3.jpg", "price": "499", "diff_price": 299, "stu_num": 2, "is_limit": 0},
    {"id": "4", "title": "课程4", "tag_txt": "", "label_txt": "", "image": "assets/images/lesson/image_4.jpg", "price": "199", "diff_price": 99, "stu_num": 20, "is_limit": 0},
    {"id": "5", "title": "课程5", "tag_txt": "", "label_txt": "属性", "image": "assets/images/lesson/image_5.jpg", "price": "99", "diff_price": 0, "stu_num": 0, "is_limit": 1},
    {"id": "6", "title": "课程6", "tag_txt": "标签", "label_txt": "属性", "image": "assets/images/lesson/image_6.jpg", "price": "299", "diff_price": 9.9, "stu_num": 30, "is_limit": 0}
  ];

  return ListView.builder(
    padding: const EdgeInsets.fromLTRB(16, 24, 16, 40),
    itemCount: _lesson.length,
    shrinkWrap: true,
      physics:NeverScrollableScrollPhysics(),//多重ListView嵌套添加 禁用滑动事件
    itemBuilder: (ctx, index) {
      return HomeLessonItem(_lesson[index], _lesson[index]['id'], _lesson[index]['title']);
    },

  );
}
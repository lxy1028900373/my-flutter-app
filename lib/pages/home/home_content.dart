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
    return Container(

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          buildBanner(),
          buildGridView()
        ],
      )
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
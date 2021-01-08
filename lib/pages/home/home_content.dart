import 'package:flutter/material.dart';
import '../../widgets/swiper.dart';

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
          buildBanner()
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
      height: 180,
      child: HomeSwiper(banners: _banners),
    ),
  );
}

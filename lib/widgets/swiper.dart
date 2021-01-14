import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class HomeSwiper extends StatefulWidget {
  HomeSwiper({Key key, this.banners}) : super(key: key);

  final List banners;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<HomeSwiper> {

  @override
  Widget build(BuildContext context) {

    return Container(
      padding: EdgeInsets.all(16),
      child: new Swiper(
        //布局构建
        // itemBuilder: (BuildContext context,int index){
        //   return Image.asset("assets/images/banner/banner${index+1}.jpg",fit: BoxFit.fill,);
        // },
        //布局构建-自定义
        itemBuilder: _buildItem,
        itemCount: 3,//数量
        // pagination: new SwiperPagination(),//指示器
        pagination: buildSwiperPagination(),
        loop: true,//循环轮播
        autoplay: true, //自动轮播
        onTap: (index){//点击事件
          print(index);
        },
      ),
    );
  }

  //自定义指示器ui
  buildSwiperPagination(){
    // 分页指示器
    return SwiperPagination(
      //指示器显示的位置
      alignment: Alignment.bottomCenter,//位于底部居中
      margin: const EdgeInsets.fromLTRB(0, 0, 0, 5),
      builder: DotSwiperPaginationBuilder(
        // 点之间的间隔
        space: 2,
        // 没选中时的大小
        size: 6,
        // 没选中时的大小
        activeSize: 10,
        // 没选中时的颜色
        color: Colors.black54,
        //选中时的颜色
        activeColor: Colors.white,
      ),
    );
  }

  //  自定义轮播图
  Widget _buildItem(BuildContext context, int index) {

    return ClipRRect(
      // 圆角
      borderRadius: new BorderRadius.all(new Radius.circular(8)),
      child: new Image.asset(
        widget.banners[index],
        fit: BoxFit.fill,
      ),
    );
  }
}
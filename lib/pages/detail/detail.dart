import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'detail_footer_btn.dart';
import 'detail_header.dart';

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
    //模拟详情页数据
    dynamic detailInfo={
      "head_url": "assets/images/banner/detail_banner.jpg",
      "title": "这是一个超级超级超级超级超级超级超级超级超级超级超级超级超级超级超级超级超级长的课程名称",
      "buy_num": "3",
      "price": "799",
      "diff_price": "199",
      "content": [
        "assets/images/detail_content.jpg",
        "assets/images/detail_content.jpg"
      ]
    };

    print(detailInfo['content']);
    return Scaffold(
      appBar: AppBar(
        title: Text(lessonName),
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    DetailHeader(detailInfo),
                    Container(height: 10, color: Color(0xfffaf8f6)),
                    buildContent(detailInfo['content']),
                  ],
                ),
              ),
            ),
            // 底部固定按钮
            DetailFooterBtn()
          ],
        )
      ),

      // 回首页-浮动按钮
      floatingActionButton: FloatingActionButton(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(100)
          ),
          child: Image.asset('assets/images/tabbar/home.png')
        ),
        onPressed: (){
          print('返回上一页(首页)');
          Navigator.of(context).pop();
        },
      ),
      // 设置浮动按钮偏移距离
      floatingActionButtonLocation: CustomFloatingActionButtonLocation(FloatingActionButtonLocation.endFloat, 0, -80),
    );
  }
}

//内容
Widget buildContent(content){
  print(content);
  return Column(
    // 防止类型推断以意想不到的方式失败。解决方案是为map方法提供类型参数
    children: content.map<Widget>((item){
      return Image.asset(item, fit: BoxFit.cover,);
    }).toList()
  );
}

//自定义FloatingActionButton偏移距离
class CustomFloatingActionButtonLocation extends FloatingActionButtonLocation {
  FloatingActionButtonLocation location;
  double offsetX;    // X方向的偏移量
  double offsetY;    // Y方向的偏移量
  CustomFloatingActionButtonLocation(this.location, this.offsetX, this.offsetY);

  @override
  Offset getOffset(ScaffoldPrelayoutGeometry scaffoldGeometry) {
    Offset offset = location.getOffset(scaffoldGeometry);
    return Offset(offset.dx + offsetX, offset.dy + offsetY);
  }
}
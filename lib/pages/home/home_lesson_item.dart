import 'package:flutter/material.dart';

//首页-课程列表
class HomeLessonItem extends StatelessWidget {
  final Object lesson;

  HomeLessonItem(this.lesson);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 16),
      child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          // 子元素使用Expanded可省略这段代码
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            buildContentImg(lesson),
            SizedBox(width: 16,),
            buildContentInfoTitle(lesson)
          ]
      ),
    );
  }
}

//渲染课程项图片
Widget buildContentImg(item){
  // 判断是否有标签内容
  // 无标签
  if(item['tag_txt'] == ''){
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Image.asset(item['image'], width: 128),
    );
  }
  // 有标签
  // Stack：实现多个元素堆叠
  return Stack(
    children: <Widget>[
      ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.asset(item['image'], width: 128),
      ),
      // 定位
      Positioned(
        left: 0,
        top: 0,
        child: Container(
          //圆角
          decoration: BoxDecoration(
              color: Colors.black87,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(8), bottomRight: Radius.circular(8))
          ),
          width: 68,
          height: 21,
          alignment: Alignment.center,
          child: Text(item['tag_txt'], style: TextStyle(color: Colors.amberAccent, fontSize: 12)),
        ),
      )
    ],
  );
}

//渲染课程项介绍
Widget buildContentInfoTitle(item){
  return Expanded(
    flex: 1,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        // Wrap：自动换行widget
        Wrap(
          alignment: WrapAlignment.center,
          children: <Widget>[
            Text(item['title'], style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black87,)),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Text('¥'+item['price'], style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold, color: Colors.deepOrange, height: 1.5))
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Text(item['stu_num'].toString()+'人学过', style: TextStyle(fontSize: 12, color: Colors.black45, height: 1.2,))
          ],
        )
      ],
    ),
  );
}


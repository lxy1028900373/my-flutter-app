import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyLessonPage extends StatefulWidget {
  @override
  _MyLessonPageState createState() => _MyLessonPageState();
}

class _MyLessonPageState extends State<MyLessonPage> {
  final List lessonList=[
    {"id": 1, "title": "课程名称1这是一个很长很长很长很长的名称", "task_txt": "0/1", "valid_time": "0"},
    {"id": 2, "title": "课程名称2", "task_txt": "1/1", "valid_time": "1"},
    {"id": 3, "title": "课程名称3", "task_txt": "1/10", "valid_time": "20"},
    {"id": 4, "title": "课程名称4", "task_txt": "0/11", "valid_time": "365"},
    {"id": 5, "title": "课程名称5", "task_txt": "0/11", "valid_time": "0"},
  ];
  int _currentPage = 1;//当前页数
  int _pageSize = 5;  //数量/页

  @override
  Widget build(BuildContext context) {
    print(_currentPage);
    return RefreshIndicator(
      displacement: 10, //距离顶部距离
      onRefresh: _pullToRefresh,

      child: Container(
        child: ListView.builder(
          itemCount: _pageSize,
          itemBuilder: (ctx, i){
            return buildLessonItem(lessonList[i], i == _pageSize - 1);
          },
        ),
      ),
    );
  }

  // 下拉刷新,必须异步async不然会报错
  Future _pullToRefresh() async {
    setState(() {
      _currentPage= 1;
    });
    return null;
  }
}

//课程列表项
Widget buildLessonItem(item, is_last_child){
  return Container(
    margin: is_last_child ? EdgeInsets.all(20) : EdgeInsets.fromLTRB(20, 20, 20, 0),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10),
      // 阴影
      boxShadow: [
        BoxShadow(
          color: Colors.black12,  //底色,阴影颜色
          offset: Offset(0, 0), //阴影位置,从什么位置开始
          blurRadius: 1,  // 阴影模糊层度
          spreadRadius: 0,  //阴影模糊大小
        ),
      ],
    ),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Column(
          children: <Widget>[
            buildHeader(item),
            buildBody(item),
            buildFooter(item)
          ]
      ),
    ),
  );
}

//列表项-头部
Widget buildHeader(item){
  return Container(
    child: Row(
      children: <Widget>[
        Expanded(
          child: Container(
            height: 40,
            padding: EdgeInsets.symmetric(horizontal: 20),
            color: Color(0xff9085e7),
            alignment: Alignment.topCenter,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Expanded(
                      child: Text(
                          item['title'],
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)
                      ),
                    ),
                    Image.asset("assets/images/right.png", width: 20,)
                  ],
                )
              ],
            )
          ),
        )
      ],
    )
  );
}

//列表项-主体
Widget buildBody(item){
  return Container(
    color:  Colors.white,
    height: 48,
    padding: EdgeInsets.symmetric(horizontal: 10),
    child: Row(
      children: <Widget>[
        Text(item['valid_time'] == "0" ? "课程已过期" : "剩余 ${item['valid_time']} 天", style: TextStyle(fontSize: 14, color: Color(0xff7e7e7e)))
      ],
    ),
  );
}

//列表项-底部
Widget buildFooter(item){
  return Container(
    height: 40,
    color: Color(0xfff9f9f9),
    padding: EdgeInsets.symmetric(horizontal: 10),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Text("进度：${item['task_txt']}", style: TextStyle(color: Color(0xff7e7e7e), fontSize: 15),)
      ],
    ),
  );
}
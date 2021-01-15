import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyLessonPage extends StatefulWidget {
  @override
  _MyLessonPageState createState() => _MyLessonPageState();
}

class _MyLessonPageState extends State<MyLessonPage> {
  List lessonList= new List();
  ScrollController _scrollController = ScrollController(); //listview的控制器
  bool isLoading = false; //是否正在加载数据
  bool loadMore = false;  //是否加载更多
  bool isNoMore = false;  //是否已加载全部
  int currentPage = 1;   //当前页数
  // final List lessonList=[
  //   {"id": 1, "title": "课程名称1这是一个很长很长很长很长的名称", "task_txt": "0/1", "valid_time": "0"},
  //   {"id": 2, "title": "课程名称2", "task_txt": "1/1", "valid_time": "1"},
  //   {"id": 3, "title": "课程名称3", "task_txt": "1/10", "valid_time": "20"},
  //   {"id": 4, "title": "课程名称4", "task_txt": "0/11", "valid_time": "365"},
  //   {"id": 5, "title": "课程名称5", "task_txt": "0/11", "valid_time": "0"},
  // ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        print('滑动到了最底部');
        setState(() {
          loadMore= true;
        });
        _getMore();
      }
    });
  }

  // 初始化list数据 加延时模仿网络请求
  Future getData() async {
    await Future.delayed(Duration(seconds: 2), () {
      setState(() {
        lessonList = List.generate(5, (i) => {"id": 1, "title": "课程名称1这是一个很长很长很长很长的名称", "task_txt": "0/1", "valid_time": "0"});
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      displacement: 10, //距离顶部距离
      onRefresh: _pullToRefresh,

      child: Container(
        child: ListView.builder(
          itemCount: lessonList.length+1,
          itemBuilder: _renderBuild,
          controller: _scrollController,
        ),
      ),
    );
  }

  Widget _renderBuild(BuildContext context, int index){
    if(index < lessonList.length){
      return Container(
        child: buildLessonItem(lessonList[index], index == lessonList.length - 1),
      );
    }

    return _getMoreWidget();
  }

  // 下拉刷新,必须异步async不然会报错
  Future _pullToRefresh() async {
    setState(() {
      currentPage= 1;
    });
    return null;
  }

  // 上拉加载更多
  Future _getMore() async {
    if (!isLoading && !isNoMore) {
      setState(() {
        isLoading = true;
      });
      await Future.delayed(Duration(seconds: 1), () {
        print('加载更多');
        var _data={"id": 2, "title": "课程名称2", "task_txt": "1/1", "valid_time": "1"};
        setState(() {
          lessonList.addAll(List.generate(5, (i) => {"id": 2, "title": "课程名称2", "task_txt": "1/1", "valid_time": "1"}));
          currentPage++;
          isLoading = false;
          isNoMore = true;
        });
      });
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _scrollController.dispose();
  }

  // 加载更多时显示的组件,给用户提示
  Widget _getMoreWidget() {
    // 判断是否加载完成
    if(isNoMore) return null;
    return Center(
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              '加载中...     ',
              style: TextStyle(fontSize: 16.0),
            ),
            CircularProgressIndicator(strokeWidth: 1.0,)
          ],
        ),
      ),
    );
  }
}

//课程列表项
Widget buildLessonItem(item, is_last_child){
  return Container(
    margin: is_last_child ? EdgeInsets.fromLTRB(20, 20, 20, 40) : EdgeInsets.fromLTRB(20, 20, 20, 0),
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
import 'package:flutter/material.dart';

//首页宫格组件
class HomeGrid extends StatefulWidget {
  HomeGrid({Key key, this.grid}) : super(key: key);

  final List grid;

  @override
  _HomeGridState createState() => _HomeGridState();
}

class _HomeGridState extends State<HomeGrid> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView(
        //禁止滚动(可以间接实现取消水波纹)
        // physics: const NeverScrollableScrollPhysics(),
        //推荐 取消水波纹效果
        controller: new ScrollController(keepScrollOffset: false),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          //水平子widget之间间距
          crossAxisSpacing: 30,
          //垂直子widget之间间距
          mainAxisSpacing: 12,
          //一行widget数量
          crossAxisCount: 4,
          //子widget宽高比例
          childAspectRatio: 1.0,
        ),
        children: getGridList(this.widget.grid),
      ),
    );
  }
}

List<Widget> getGridList(grid){
  // 防止类型推断以意想不到的方式失败。解决方案是为map方法提供类型参数
  return grid.map<Widget>((item) => getGridItem(item)).toList();
}

//宫格item
Widget getGridItem(item){
  return Container(
    //内容居中
    alignment: Alignment.center,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Image.asset(item['image']),
        Text(item['title'], style: TextStyle(color: Colors.black, fontSize: 14))
      ],
    ),
  );
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UcenterContent extends StatelessWidget {
  final List ucenterList; //声明List类型
  UcenterContent(this.ucenterList);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 30, horizontal: 16),
      child: Column(
        children: ucenterList.map((item){
          return buildUcenterItem(context,item);
        }).toList(),
      ),
    );
  }
}

Widget buildUcenterItem(context, item){
  // InkWell包裹的内容区域可点击
  return InkWell(
    child: Container(
      height: 56,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Icon(item['icon'], size: 24,),
          SizedBox(width: 10),
          Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(item['title'], style: TextStyle(fontSize: 16)),
                  Icon(Icons.chevron_right, size: 24,)
                ],
              )
          )
        ],
      ),
    ),
    onTap: (){
      print("点击了 ${item['title']}");
    },
  );
}

import 'package:flutter/material.dart';

//课程详情页-头部
class DetailHeader extends StatelessWidget {
  final dynamic detailInfo;
  DetailHeader(this.detailInfo);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Image.asset(detailInfo['head_url'], width: MediaQuery.of(context).size.width, height: 168, fit: BoxFit.cover),
          Container(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  detailInfo['title'],
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    buildPriceInfo(detailInfo['price'] ,detailInfo['diff_price']),
                    Text("已有 ${detailInfo['buy_num']} 人报名", style: TextStyle(fontSize: 13, height: 1.2, color: Color(0xff656565))),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

//价格展示
Widget buildPriceInfo(price, diff_price){
  // 无划线价
  if(diff_price == 0){
    return Text("¥$price", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, height: 1.4, color: Color(0xffFF7211)));
  };
  // 有划线价
  return Row(
    children: <Widget>[
      Text("¥$price", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, height: 1.4, color: Color(0xffFF7211))),
      SizedBox(width: 9),
      Text(
        "¥$diff_price",
        style: TextStyle(
            height: 1.4,
            decoration: TextDecoration.lineThrough,
            decorationColor: Color(0xff656565),
            decorationStyle: TextDecorationStyle.solid
        ),
      )
    ],
  );
}

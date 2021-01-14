import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'ucenter_header.dart';
import 'ucenter_content.dart';

class UcenterPage extends StatefulWidget {

  @override
  _UcenterPageState createState() => _UcenterPageState();
}

class _UcenterPageState extends State<UcenterPage> {
  var userInfo={
    "avatar": "assets/images/user_avatar.jpg",
    "nickname": "Flutter",
    "level": "普通用户"
  };
  List ucenterList=[
    {"icon": Icons.assignment, "title": "我的订单"},
    {"icon": Icons.confirmation_number, "title": "优惠券"},
    {"icon": Icons.person, "title": "个人信息"},
    {"icon": Icons.insert_comment, "title": "意见反馈"},
    {"icon": Icons.settings, "title": "账号设置"},
  ];

  List commentData=[
    {
      'photo':'assets/images/square_1.png',
      'nickname':'鸿运当头',
      'content':'TA通过 决策金股 策略，关注了万华化学(600309)',
      'date':'14:20',
      'replay':[
        {'nickname':'哈哈哈','content':'这是一条评论'},
        {'nickname':'哈哈哈','content':'这是一条评论'},
        {'nickname':'哈哈哈','content':'这是一条评论'},
      ]
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('我的'),
        centerTitle: true,
      ),
      body: ListView(
        children: <Widget>[
          UcenterHeader(userInfo['avatar'], userInfo['nickname'], userInfo['level']),
          UcenterContent(ucenterList)
        ],
      ),
    );
  }
}
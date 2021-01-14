import 'package:flutter/material.dart';
import 'bottom_bar_item.dart';
import '../home/home.dart';
import '../subject/subject.dart';
import '../ucenter/ucenter.dart';

//底部tabbar
List<BottomBarItem> items =[
  BottomBarItem("home", "课程"),
  BottomBarItem("subject", "学习"),
  BottomBarItem("ucenter", "我的")
];

//tab页面
List<Widget> pages=[
  HomePage(),
  SubjectPage(),
  UcenterPage()
];
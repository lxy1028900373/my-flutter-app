import 'package:flutter/material.dart';
import 'bottom_bar_item.dart';
import '../home/home.dart';
import '../subject/subject.dart';
import '../profile/profile.dart';

//底部tabbar
List<BottomBarItem> items =[
  BottomBarItem("home", "首页"),
  BottomBarItem("subject", "课程"),
  BottomBarItem("profile", "我的")
];

//tab页面
List<Widget> pages=[
  HomePage(),
  SubjectPage(),
  ProfilePage()
];
import 'package:flutter/material.dart';
import '../../widgets/expty.dart';

class TodayTaskPage extends StatefulWidget {
  @override
  _TodayTaskPageState createState() => _TodayTaskPageState();
}

class _TodayTaskPageState extends State<TodayTaskPage> {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Expty("暂无任务"),
    );
  }
}

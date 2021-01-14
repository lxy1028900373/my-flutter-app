import 'package:flutter/material.dart';
import 'home_content.dart';

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('课程'),
        centerTitle: true,
      ),
      body: HomeContent(),
    );
  }
}

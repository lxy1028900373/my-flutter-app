import 'package:flutter/material.dart';
import 'subject_content.dart';

class SubjectPage extends StatefulWidget {
  @override
  _SubjectPageState createState() => _SubjectPageState();
}

class _SubjectPageState extends State<SubjectPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('我的课程'),
      ),
      body: SubjectContent(),
    );
  }
}

import 'package:flutter/material.dart';

class Expty extends StatelessWidget {
  Expty(this.title);
  
  final String title;
  
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset('assets/images/expty.jpg', width: 150),
          Text(title)
        ],
      ),
    );
  }
}

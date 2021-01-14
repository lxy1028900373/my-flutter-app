import 'package:flutter/material.dart';

//我的-头部widget
class UcenterHeader extends StatefulWidget {
  String avatar;
  String nickname;
  String level;

  UcenterHeader(this.avatar, this.nickname, this.level);

  @override
  _UcenterHeaderState createState() => _UcenterHeaderState();
}

class _UcenterHeaderState extends State<UcenterHeader> {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.blue,
        padding: EdgeInsets.all(16),
        child: Stack(
          overflow: Overflow.visible, //溢出部分显示
          children: <Widget>[
            Container(
              height: 180,
              alignment: Alignment.topLeft,
            ),
            Container(
              height: 64,
              child: Row(
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.circular(32),
                    child: Image.asset(widget.avatar, width: 64),
                  ),
                  SizedBox(width: 16),
                  buildUserInfo(widget.nickname, widget.level),
                ],
              ),
            ),
            Positioned(
              bottom: -40,
              right: 0,
              left: 0,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(
                  "assets/images/banner/banner2.jpg",
                  // width: MediaQuery.of(context).size.width,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        )
    );
  }
}

//头部-用户信息
Widget buildUserInfo(nickname, level){
  return Expanded(
    flex: 1,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
                nickname,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold)
            ),
            SizedBox(height: 4),
            Text(
                level,
                style: TextStyle(fontSize: 14, color: Colors.white)
            ),
          ],
        ),
        OutlineButton(
            borderSide: BorderSide(color: Colors.white),
            child: Row(
              children: <Widget>[
                Text('签到', style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold)),
                SizedBox(width: 4),
                Icon(Icons.event_available, size: 18, color: Colors.white)
              ],
            ),
            onPressed: (){
              print('clicked button');
            }
        )
      ],
    ),
  );
}

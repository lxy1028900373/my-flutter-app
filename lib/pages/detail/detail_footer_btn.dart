import 'package:flutter/material.dart';
import 'package:flutter_app/global/app_theme.dart';

//课程详情页-底部按钮
class DetailFooterBtn extends StatefulWidget {
  @override
  _DetailFooterBtnState createState() => _DetailFooterBtnState();
}

class _DetailFooterBtnState extends State<DetailFooterBtn> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: 66,
        padding: EdgeInsets.symmetric(vertical: 0, horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Container(
              width: 135,
              height: 50,
              margin: EdgeInsets.only(right: 16),
              child:  FlatButton(
                child: Text(
                  '免费试听',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: AppColor.colorYellow
                  ),
                ),
                textColor: Colors.white,
                color: Color(0xfffff1e7),
                // 圆角
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40)
                ),
                onPressed: (){
                  print('click 免费试听');
                },
              ),
            ),
            Expanded(
              child: Container(
                height: 50,
                child: FlatButton(
                  child: Text(
                      '立即报名',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold
                      )
                  ),
                  textColor: Colors.white,
                  color: AppColor.colorYellow,
                  // 圆角
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40)
                  ),
                  onPressed: (){
                    print('click 立即报名');
                  },
                ),
              ),
            ),
          ],
        )
    );
  }
}

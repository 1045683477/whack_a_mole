import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:whack_a_mole/Pages/Home/HomeItem/HomePass.dart';
import 'package:whack_a_mole/const/PassLevel.dart';

class HomeCard extends StatelessWidget {
  //卡片颜色的控制
  final Color color;

  //按钮颜色
  final Color btnColor;

  //关卡刷新时间
  final Duration duration;

  //目标分数
  final int targetScore;

  //关卡名称
  final String passName;

  //困难级别
  final PassLevel passLevel;

  HomeCard(
      {Key key, this.passName, this.duration, this.targetScore, this.passLevel,this.color,this.btnColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
      margin: EdgeInsets.all(ScreenUtil().setSp(15)),
      color: color,
      child: Column(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.view_compact),
            title: Text(passName),
            subtitle: Column(
              //mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('目标分数：' + targetScore.toString()),
                Text('刷新频率：' + duration.inMilliseconds.toString() + "毫秒"),
                Text('难度级别：' + passLevel.toString().split('.')[1].toString()),
              ],
            ),
          ),
          ButtonBar(
            children: <Widget>[
              FlatButton(
                color: btnColor,
                  textColor: Colors.white,
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => HomePass(
                          duration: duration,
                          targetScore: targetScore,
                        )));
                  },
                  child: Text('挑战',style: TextStyle(fontSize: ScreenUtil().setSp(40)),)
              )
            ],
          )
        ],
      ),
    );
  }
}
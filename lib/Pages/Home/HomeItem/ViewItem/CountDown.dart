import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../../../Provider/PassProvider.dart';

//倒计时控件
class CountDown extends StatefulWidget {
  CountDown({Key key}) : super(key: key);

  @override
  _CountDownState createState() {
    return _CountDownState();
  }
}

class _CountDownState extends State<CountDown> {
  //倒计时
  String time = '';
  IconData icon;
  bool disAble;
  Timer timer;

  @override
  void initState() {
    super.initState();
    disAble = false;
    icon = Icons.play_arrow;
    //每隔一秒刷新 time 值
    timer = Timer.periodic(new Duration(milliseconds: 100), (timer) {
      //刷新时间
      setState(() {
        time = Provider.of<PassProvider>(context).totalTime.toString();
      });
      if (Provider.of<PassProvider>(context).isEnd) {
        //这里设置为 false ,那么 GridViewItem 的 timer 将不再刷新
        Provider.of<PassProvider>(context).ifStarted = false;
        //时间没了，将 timer 循环停止
        timer.cancel();
      }
    });
  }

  @override
  void dispose() {
    //这里时间循环需要销毁，不然会报错
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Text(
              "得分：" + Provider.of<PassProvider>(context).score.toString(),
              style: TextStyle(fontSize: ScreenUtil().setSp(70)),
            ),
            Text(
              "计时：" + time,
              style: TextStyle(fontSize: ScreenUtil().setSp(70)),
            ),
          ],
        ),
        IconButton(
          iconSize: ScreenUtil().setSp(150),
          //padding: EdgeInsets.only(right: ScreenUtil().setWidth(60)),
          icon: Icon(
            icon,
          ),
          onPressed: () {
            if (!disAble) {
              Provider.of<PassProvider>(context).startRecordTime();
              disAble = true;
            }
            setState(() {
              icon = Icons.pause;
            });
          },
        )
      ],
    );
  }
}

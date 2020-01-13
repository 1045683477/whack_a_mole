import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:async';
import 'package:provider/provider.dart';
import '../../../../Provider/PassProvider.dart';
import '../../../../Provider/KindItemClick.dart';
import 'package:whack_a_mole/Pages/Home/HomeItem/ViewItem/KindItem.dart';

class GridViewItem extends StatefulWidget {
  final Duration duration;

  GridViewItem({Key key, this.duration}) : super(key: key);

  @override
  _GridViewItemState createState() {
    return _GridViewItemState(duration: duration);
  }
}

class _GridViewItemState extends State<GridViewItem> {
  final Duration duration;

  _GridViewItemState({Key key, this.duration});

//循环定时
  Timer timer;

//是否开始
  bool ifStarted;

//是否结束
  bool isEnd;

  @override
  void initState() {
    super.initState();
    //定时刷新地鼠显示
    timer = new Timer.periodic(duration, (timer) {
      ifStarted = Provider.of<PassProvider>(context).ifStarted;

      bool isEnd = Provider.of<PassProvider>(context).isEnd;
      if (ifStarted) {
        //刷新
        Provider.of<PassProvider>(context).refreshPass();
        //这里加上 setState 不然不会刷新 GridView 组件，也就不会出现老鼠并且刷新它的子组件 KindItem
        setState(() {});
        //给按钮添加上可按与不可按的判断
        Provider.of<KindItemClick>(context)
            .kindItemInitialize(Provider.of<PassProvider>(context).cell);
      }

      //判断游戏是否结束，是的话开始停止timer 的循环并打印弹窗
      if (isEnd) {
        //判断游戏是否成功并显示弹窗
        bool isSuccess = Provider.of<PassProvider>(context).targetScore <=
            Provider.of<PassProvider>(context).score;
        print('ifStarted外部');
        //弹出框
        showDialog<Null>(
            context: context,
            builder: (BuildContext context) {
              return new AlertDialog(
                title: Container(
                  width: ScreenUtil().setWidth(750 * 0.9),
                  height: ScreenUtil().setHeight(400),
                  child: Center(
                    child: Text(
                      isSuccess ? '成功!' : '失败!',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: ScreenUtil().setSp(80)),
                      textAlign: TextAlign.center,
                    ),
                  ),

                ),
              );
            });
        //结束后取消循环
        timer.cancel();
      }
    });
  }

  @override
  void dispose() {
    //Provider.of<PassProvider>(context).dispose();
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    PassProvider provider = Provider.of<PassProvider>(context);
    return Container(
        child: GridView.count(
            crossAxisCount: 3,
            children: List.generate(
              9,
              (index) => Container(
                  decoration: BoxDecoration(border: Border.all(width: 1)),
                  child: KindItem(
                      //这里传递过去的是 cell map 中的键过去，非正常顺序
                      index: provider.cell.keys.elementAt(index))),
            )));
  }
}

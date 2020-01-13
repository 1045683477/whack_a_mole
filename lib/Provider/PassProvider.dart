import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:whack_a_mole/const/Kind.dart';

//地鼠与炸弹状态管理
class PassProvider extends ChangeNotifier {
  //是否开始
  bool ifStarted;

  //是否结束
  bool isEnd;

  //刷新次数
  int refreshCount=0;

  //得分
  int score;

  //目标分数
  int targetScore;

  //总共时间
  int totalTime;

//选择老鼠出现个数范围
  List<int> mouseRanges = List<int>();

//老鼠出现数组
  Map<int, Kind> mouseShow = Map<int, Kind>();

//炸弹出现个数范围
  List<int> bombRanges = List<int>();

//炸弹出现数组
  Map<int, Kind> bomShow= Map<int, Kind>();

  //所有数组，将老鼠与炸弹放入此处，这里是个容器
  Map<int, Kind> cell;
  //随机类初始化
  Random random=new Random();

  //在这里声明下计实，到时候利于销毁
  Timer timer;

  //初始化
  PassProvider(int targetScore){
    this.targetScore=targetScore;
    mouseRanges.add(2);
    mouseRanges.add(3);
    bombRanges.add(1);
    bombRanges.add(2);
    totalTime=60;
    ifStarted=false;
    isEnd=false;
    cell = Map<int, Kind>();
    //初始化要加上，不然后面无法刷新地鼠将会报错
    for(int i=0;i<9;i++){
      cell.putIfAbsent(i, ()=>Kind.black);
    }
    score=0;
  }

  //点击老鼠加分
  void addScore(){
    score++;
    print(score);
    notifyListeners();
  }

  //点击炸弹减分
  void subScore(){
    score-=2;
    print(score);
    notifyListeners();
  }

//刷新老鼠
  void _refreshMouse() {
    //清除炸弹数组
    mouseShow.clear();
    //获取老鼠出随机出现个数
    int mouseRange = mouseRanges[random.nextInt(mouseRanges.length)];
    print(mouseRange);
    while (mouseShow.length < mouseRange) {
      mouseShow.putIfAbsent(random.nextInt(9), () => Kind.mouse);
    }
  }

//刷新炸弹
  void _refreshBomb() {
    //清除炸弹数组
    bomShow.clear();
    //获取炸弹出随机出现个数
    int bombRange = bombRanges[random.nextInt(bombRanges.length)];
    while (bomShow.length < bombRange) {
      int bombShowNum = random.nextInt(8);
      //判断是否是地鼠，不是就添加
      if (!mouseShow.containsKey(bombShowNum)) {
        bomShow.putIfAbsent(bombShowNum, () => Kind.bomb);
      }
    }
  }

  //刷新关卡
  void refreshPass() {
    cell.clear();
    _refreshMouse();
    _refreshBomb();
    cell.addAll(bomShow);
    cell.addAll(mouseShow);
    //其他的添加 方块
    for (int i = 0; i < 9; i++) {
      if (!cell.containsKey(i)) {
        cell.putIfAbsent(i, () => Kind.black);
      }
    }
    print('老鼠炸弹刷新完成:'+(++refreshCount).toString());
  }

  //计时开始
  void startRecordTime() {
    ifStarted=true;
    //refreshPass();
    timer=Timer.periodic(Duration(milliseconds: 1000), (_) {
      //如果开始
      if (ifStarted) {
        //如果倒计时没结束
        if (totalTime>0) {
          totalTime -= 1;
        }
        //如果达到目标分数
        if (targetScore<=score) {
          isEnd=true;
          timer.cancel();
        }
        //如果没发到目标分数
        else if (totalTime==0) {
          isEnd=true;
          timer.cancel();
        }
      }
      notifyListeners();
    });
    //notifyListeners();
  }
}

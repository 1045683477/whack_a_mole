import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whack_a_mole/Pages/Home/HomeItem/ViewItem/CountDown.dart';
import 'package:whack_a_mole/Provider/KindItemClick.dart';
import 'ViewItem/GridViewItem.dart';
import '../../../Provider/PassProvider.dart';

class HomePass extends StatefulWidget {
  //时间
  final Duration duration;
  //目标分数
  final int targetScore;
  HomePass({Key key,this.duration,this.targetScore}) : super(key: key);

  @override
  _HomePassState createState() {
    return _HomePassState(duration: duration,targetScore: targetScore);
  }
}

class _HomePassState extends State<HomePass> {
  final Duration duration;
  final int targetScore;
  _HomePassState({Key key,this.duration,this.targetScore});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text('打地鼠'),
        ),
        body: MultiProvider(providers: [
          Provider<PassProvider>(create: (context)=>PassProvider(targetScore),),
          Provider<KindItemClick>(create: (context)=>KindItemClick()),
        ],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(flex: 5,child: GridViewItem(duration: this.duration,)),
            Expanded(flex: 4,child: CountDown())
          ],
        )
        )
    );
  }
}



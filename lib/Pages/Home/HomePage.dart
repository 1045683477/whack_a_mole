import 'package:flutter/material.dart';
import 'package:whack_a_mole/Pages/Home/HomeItem/HomeCard.dart';
import 'package:whack_a_mole/const/PassLevel.dart';

class HomePage extends StatelessWidget {
  HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('首页'),
      ),
      body: Container(
          child: ListView(
            shrinkWrap: true,
            children: <Widget>[
              HomeCard(
                passName: '第一关-超级简单',
                duration: Duration(seconds: 4),
                targetScore: 10,
                passLevel: PassLevel.simple,
                color: Colors.white70,
                btnColor: Colors.grey,
              ),
              HomeCard(
                passName: '第二关-超级简单',
                duration: Duration(seconds: 4),
                targetScore: 30,
                passLevel: PassLevel.simple,
                color: Colors.white70,
                btnColor: Colors.grey,
              ),
              HomeCard(
                passName: '第三关-普通挑战',
                duration: Duration(seconds: 2),
                targetScore: 30,
                passLevel: PassLevel.common,
                color: Colors.greenAccent,
                btnColor: Colors.green,
              ),
              HomeCard(
                passName: '第四关-普通挑战',
                duration: Duration(seconds: 2),
                targetScore: 60,
                passLevel: PassLevel.common,
                color: Colors.greenAccent,
                btnColor: Colors.green,
              ),
              HomeCard(
                passName: '第五关-困难模式',
                duration: Duration(seconds: 1),
                targetScore: 60,
                passLevel: PassLevel.difficult,
                color: Colors.redAccent,
                btnColor: Colors.red,
              ),
              HomeCard(
                passName: '第六关-困难模式',
                duration: Duration(seconds: 1),
                targetScore: 120,
                passLevel: PassLevel.difficult,
                color: Colors.redAccent,
                btnColor: Colors.red,
              ),
              HomeCard(
                passName: '第七关-极限地狱',
                duration: Duration(milliseconds: 500),
                targetScore: 60,
                passLevel: PassLevel.death,
                color: Colors.black54,
                btnColor: Colors.black,
              ),
              HomeCard(
                passName: '第八关-极限地狱',
                duration: Duration(milliseconds: 500),
                targetScore: 120,
                passLevel: PassLevel.death,
                color: Colors.black54,
                btnColor: Colors.black,
              ),
            ],
          )),
    );
  }
}

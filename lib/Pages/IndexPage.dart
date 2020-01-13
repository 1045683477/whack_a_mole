import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:whack_a_mole/Pages/Home/HomePage.dart';
import 'Test/TestPage.dart';
import 'package:whack_a_mole/Pages/CustomLevel/CustomLevel.dart';


class IndexPage extends StatefulWidget {
  IndexPage({Key key}) : super(key: key);

  @override
  _IndexPageState createState() {
    return _IndexPageState();
  }
}

class _IndexPageState extends State<IndexPage> {
  //导航栏的组件集合
  final List<BottomNavigationBarItem> bottomTabs=[
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      title: Text("主页")
    ),
    BottomNavigationBarItem(
        icon: Icon(Icons.tag_faces),
        title: Text("自定关"),
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.ac_unit),
      title: Text('测试')
    )
  ];

  //导航页面
  final List<Widget> tabBodies=[
    //HomePass(duration: new Duration(seconds: 1),),
    HomePage(),
    CustomLevel(),
    TestPage()
  ];

  //索引：当前页
  int currentIndex=0;
  //选择的页面
  var currentPage;

  @override
  void initState() {
    currentPage=tabBodies[currentIndex];
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance=ScreenUtil(width: 750,height: 1334)..init(context);
    // TODO: implement build
    return Container(
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.blue,
          selectedItemColor: Colors.black45,
          selectedFontSize: ScreenUtil().setSp(25),
          unselectedItemColor: Colors.white70,
          unselectedFontSize: ScreenUtil().setSp(15),
          type: BottomNavigationBarType.fixed,
          currentIndex: currentIndex,
          items: bottomTabs,
          onTap: (index){
            setState(() {
              currentIndex=index;
              currentPage=tabBodies[currentIndex];
            });
          },
        ),
        body: IndexedStack(
          index: currentIndex,
          children: tabBodies,
        ),
      )
    );
  }
}

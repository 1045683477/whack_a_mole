import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:whack_a_mole/Provider/PassProvider.dart';
import 'package:whack_a_mole/Provider/KindItemClick.dart';

class KindItem extends StatefulWidget {
  //final Kind kind;
  final int index;

  KindItem({Key key, this.index}) : super(key: key);

  @override
  _KindItemState createState() {
    return _KindItemState(index: index);
  }
}

class _KindItemState extends State<KindItem> {
  final int index;

  //按钮内容，设置默认为白块
  String text = 'assets/images/blank.png';

  //控制它是否刷新字体,默认为false，不可刷新
  bool disAble;

  _KindItemState({Key key, this.index}) : super();

  @override
  void initState() {
    super.initState();
    disAble = false;
  }

  @override
  void dispose() {
    super.dispose();
  }

  //判断文字该输出什么
  void acquireText(PassProvider provider, KindItemClick itemClick) {
    if (provider.ifStarted) {
      disAble = true;
    }
    //判断是否或取字体
    if (disAble) {
      //map里面的key不知道怎么排序，只能遍历判断修改
      provider.cell.forEach((key, value) {
        if (key == this.index) {
          text = value.toString();
        }
      });
      //点击后会刷新，在这里直接显示文字为空
      if (itemClick.isClicked(index)) {
        //显示字
        switch (text) {
          case 'Kind.mouse':
            {
              text = 'assets/images/mouse.png';
              itemClick.isClicked(index);
              break;
            }
          case 'Kind.bomb':
            {
              text = 'assets/images/bomb.png';
              itemClick.isClicked(index);
              break;
            }
          case 'Kind.black':
            {
              text = 'assets/images/blank.png';
              itemClick.isClicked(index);
              break;
            }
        }
      } else {
        text = 'assets/images/blank.png';
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    //print('disAble:'+disAble.toString());
    PassProvider provider = Provider.of<PassProvider>(context);
    KindItemClick itemClick = Provider.of<KindItemClick>(context);
    acquireText(provider, itemClick);
    return Container(
      //height: ScreenUtil().setHeight(200),
      //width: ScreenUtil().setWidth(200),
      child: FlatButton(
          onPressed: () {
            if (itemClick.isClicked(index)) {
              //判断是调用方法
              if (text == 'assets/images/mouse.png') {
                provider.addScore();
              } else {
                provider.subScore();
              }

              //这里要加上 setState 来修改 text 值，不然无法刷新图片
              setState(() {
                text = 'assets/images/blank.png';
              });
              itemClick.btnClick(index);
            }
          },
          child: Image(
            image: AssetImage(text),
            height: ScreenUtil().setWidth(200),
            width: ScreenUtil().setWidth(200),
            fit: BoxFit.fill,
          )),
    );
  }
}

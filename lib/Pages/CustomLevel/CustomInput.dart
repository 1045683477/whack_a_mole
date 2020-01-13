import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/services.dart';
import 'package:whack_a_mole/Pages/Home/HomeItem/HomePass.dart';

///输入界面
class CustomInput extends StatelessWidget {
  CustomInput({Key key}) : super(key: key);
  ///时间
  TextEditingController _timeController = TextEditingController();
  ///目标成绩
  TextEditingController _scoreController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    _timeController.text='1000';
    _scoreController.text='60';
    return Container(
      padding: EdgeInsets.all(ScreenUtil().setWidth(50)),
      child: Column(
        children: <Widget>[
          TextField(
            controller: _timeController,
            autofocus: false,
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.timer),
              labelText: '总时间 / 毫秒',
              hintText: '1000',
            ),
            //限制输入类型
            inputFormatters: <TextInputFormatter>[
              WhitelistingTextInputFormatter.digitsOnly,
            ],
          ),
          TextField(
            controller: _scoreController,
            autofocus: false,
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.score),
              labelText: '目标分数',
              hintText: '60'
            ),
            inputFormatters: <TextInputFormatter>[
              WhitelistingTextInputFormatter.digitsOnly,
            ],
          ),
          RaisedButton(onPressed: (){
            print(_timeController.text);
            print(_scoreController.text);
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context)=>HomePass(
                duration: Duration(milliseconds: int.parse(_timeController.text)),
                targetScore: int.parse(_scoreController.text),
              ))
            );
          },
            child: Text('挑战'),
            
          )
        ],
      ),
    );
  }
}















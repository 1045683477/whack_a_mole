import 'package:flutter/material.dart';
import 'CustomInput.dart';

//自定义关卡
class CustomLevel extends StatelessWidget {
  CustomLevel({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('自定义关卡挑战'),
        leading: Icon(Icons.tag_faces),
      ),
      body: CustomInput(),
    );
  }
}

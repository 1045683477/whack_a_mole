import 'package:flutter/cupertino.dart';
import '../const/Kind.dart';

class KindItemClick extends ChangeNotifier{
  //地鼠组件 map
  Map<int,bool> mapItem=new Map<int,bool>();

  //刷新,不可按，给按钮赋予可以按与不可以按
  void kindItemInitialize(Map<int,Kind> map){
    mapItem.clear();
    map.forEach((index,value){
      switch(value.toString()){
        case "Kind.mouse": {
          mapItem.putIfAbsent(index, ()=>true);
          break;
        }
        case "Kind.bomb": {
          mapItem.putIfAbsent(index, ()=>true);
          break;
        }
        case "Kind.black": {
          mapItem.putIfAbsent(index, ()=>false);
          break;
        }
      }
    });
  }

  //点击后修改为 false 不可点击
  void btnClick(int index){
    mapItem.update(index, (bool value){
      return false;
    });
  }

  //进去第一步的初始化
  void initialize(){
    for(int i=0;i<9;i++){
      mapItem.putIfAbsent(i, ()=>false);
    }
  }
  //返回是否被点击
  bool isClicked(int index){
    bool result=false;
    mapItem.forEach((key,value){
      if (key==index) {
        result=value;
      }
    });
    return result;
  }
}
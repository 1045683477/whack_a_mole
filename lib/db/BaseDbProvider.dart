import 'package:flutter/cupertino.dart';
import 'package:sqflite/sqflite.dart';
import 'package:whack_a_mole/db/SqlManager.dart';

//创建一个父类 主要应用于 获取表名 判断表是否存在等
abstract class BaseDbProvider {
  bool isTableExits = false;

  createTableString();

  tableName();

  //创建表sql语句
  tableBaseString(String sql) {
    return sql;
  }

  Future<Database> getDataBase() async {
    return await open();
  }

  ///super 函数对父类进行初始化
  @mustCallSuper
  prepare(name, String createSql) async {
    isTableExits = await SqlManager.isTableExits(name);
    if (!isTableExits) {
      Database db = await SqlManager.getCurrentDatabase();
      return await db.execute(createSql);
    }
  }

  @mustCallSuper
  open() async {
    if (!isTableExits) {
      await prepare(tableName(), createTableString());
    }
    return await SqlManager.getCurrentDatabase();
  }
}

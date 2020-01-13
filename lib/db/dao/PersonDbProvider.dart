import 'package:sqflite/sqflite.dart';
import 'package:whack_a_mole/db/BaseDbProvider.dart';
import 'package:whack_a_mole/model/UserModel.dart';

class PersonDbProvider extends BaseDbProvider{
  ///表名
  final String name = 'rankingList';
  //主键
  final String columnId="id";
  //关卡 id
  final String passId='passId';
  //用户名
  final String username='username';
  //分数
  final String score='score';

  PersonDbProvider();

  ///创建数据库
  @override
  createTableString() {
    // TODO: implement createTableString
    return ;'''
    create table $name (
        $columnId integer primary key autoincrement,
        $passId integer not null,
        $username text not null,
        $score integer not null)
    ''';
  }

  ///查询数据库
  Future _getPersonProvider(Database db,int id)async{
    List<Map<String,dynamic>> maps=await db.rawQuery("select *from $name where $columnId =$id");
    return maps;
  }

  @override
  tableName() {
    // TODO: implement tableName
    return name;
  }

  ///插入到数据库
  Future insert(UserModel model) async {
    Database db = await getDataBase();
    var userProvider = await _getPersonProvider(db, model.id);
    if (userProvider != null) {
      ///删除数据
      await db.delete(name, where: "$columnId = ?", whereArgs: [model.id]);
    }
    return await db.rawInsert("insert into $name ($columnId,$passId,$username,$score) values (?,?,?,?)",[model.id,model.passId,model.username,model.score]);
  }

  ///更新数据库
  /*Future<void> update(UserModel model) async {
    Database database = await getDataBase();
    await database.rawUpdate(
        "update $name set $username = ?,$columnHeadImage = ? where $columnId= ?",[model.mobile,model.headImage,model.id]);

  }*/


  ///获取事件数据
  Future<UserModel> getPersonInfo(int id) async {
    Database db = await getDataBase();
    List<Map<String, dynamic>> maps  = await _getPersonProvider(db, id);
    if (maps.length > 0) {
      return UserModel.fromJson(maps[0]);
    }
    return null;
  }

}
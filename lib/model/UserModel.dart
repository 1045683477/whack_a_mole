class UserModel {
//主键
  int id;

//关卡 id
  int passId;

//用户名
  String username;

//分数
  int score;

//时间
  int seconds;

  UserModel({this.passId, this.username, this.score});

  UserModel.fromJson(Map<String, dynamic> json) {
    passId = json['passId'];
    username = json['username'];
    score = json['score'];
    seconds=json['seconds'];
  }

  //转换
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['passId'] = this.passId;
    data['username'] = this.username;
    data['score'] = this.score;
    data['seconds'] = this.seconds;
    return data;
  }
}

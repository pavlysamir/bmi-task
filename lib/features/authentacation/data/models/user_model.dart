class UserModel {
  String? name;

  String? uId;

  UserModel({
    required this.name,
    required this.uId,
    //required this.fcmToken,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];

    uId = json['uId'];

    //fcmToken = json['fcmToken'];
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'uId': uId,
      //'fcmToken': fcmToken,
    };
  }
}

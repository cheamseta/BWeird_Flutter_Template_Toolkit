import 'dart:convert';

import 'package:get_storage/get_storage.dart';
import 'package:personal_shopper/constant/key.dart';

class UserModel {
  String id;
  String userId;
  String created;

  UserModel();

  UserModel.fromJson(Map<dynamic, dynamic> json)
      : id = json['id'].toString(),
        userId = json['userId'].toString(),
        created = json['created'].toString();

  static getCurrentUser() {
    GetStorage storage = GetStorage();
    String userString = storage.read(KeyConst.TOKEN_STORE_KEY) ?? "";
    if (userString != "") {
      Map data = json.decode(userString.toString());
      return UserModel.fromJson(data);
    } else {
      print("no user");
      return new UserModel();
    }
  }
}

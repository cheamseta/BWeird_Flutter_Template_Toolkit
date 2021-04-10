import 'dart:convert';

import 'package:get_storage/get_storage.dart';
import 'package:bweird_flutter_toolkit/constants/key.dart';

class UserModel {
  String id;
  String username;
  String age;

  static String mokupUserData = "{\"id\":\"001\",\"username\":\"SETA\",\"age\":\"18\"}";

  UserModel();

  UserModel.fromJson(Map<dynamic, dynamic> json)
      : id = json['id'].toString(),
        username = json['username'].toString(),
        age = json['age'].toString();

  static getCurrentUser() {
    GetStorage storage = GetStorage();
    String userString = storage.read(KeyConst.TOKEN_STORE_KEY) ?? mokupUserData;
    if (userString != "") {
      Map data = json.decode(userString.toString());
      return UserModel.fromJson(data);
    } else {
      print("empty user");
      return new UserModel();
    }
  }
}

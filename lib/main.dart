import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:bweird_flutter_toolkit/views/home/home_view.dart';
import 'package:bweird_flutter_toolkit/views/login/login_view.dart';

import 'controllers/user_controller.dart';
import 'models/user_model.dart';

void main() async {  
  await GetStorage.init(); 
  runApp(MyApp());
}

// ignore: must_be_immutable
class MyApp extends StatelessWidget {

  UserController userController = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Template Toolkit',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: starter(),
    );
  }

  Widget starter() {

    return Obx(() {
      UserModel user = userController.user;
      if (user.id != null) {
         return HomeScreen();
      }else{
        return  LoginScreen();
      }
    });
  }

}



import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:bweird_flutter_toolkit/constants/key.dart';
import 'package:bweird_flutter_toolkit/controllers/user_controller.dart';
import 'package:bweird_flutter_toolkit/models/user_model.dart';
import 'package:bweird_flutter_toolkit/themes/color.dart';
import 'package:bweird_flutter_toolkit/themes/text_style.dart';

class HomeDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            child: Image.asset("assets/images/logo.png", width: 100),
            decoration: BoxDecoration(
              color: ColorTheme.COLOR_LIGHT,
            ),
          ),
          ListTile(
            leading: Icon(Icons.logout, color: ColorTheme.COLOR_PRIMARY),
            title: menuTitleWidget("Logout"),
            onTap: () => logoutEvent(),
          )
        ],
      ),
    );
  }

  Widget menuTitleWidget(String title) {
    return Text(title,
        style: TextSt.textSyleInColorSize(ColorTheme.COLOR_PRIMARY, 20));
  }

  void logoutEvent() {
    GetStorage storage = GetStorage();
    storage.remove(KeyConst.TOKEN_STORE_KEY);
    UserController userController = Get.put(UserController());
    UserModel loginUser = new UserModel();
    userController.mUser(loginUser);
  }
}

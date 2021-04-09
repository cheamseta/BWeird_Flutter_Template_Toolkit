

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:personal_shopper/constant/key.dart';
import 'package:personal_shopper/controllers/user_controller.dart';
import 'package:personal_shopper/models/user_model.dart';
import 'package:personal_shopper/themes/color.dart';
import 'package:personal_shopper/themes/text_style.dart';

class HomeDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            child: Image.asset("assets/images/icon.png", width: 100),
            decoration: BoxDecoration(
              color: ColorTheme.COLOR_PRIMARY,
            ),
          ),
          ListTile(
            leading: Icon(Icons.logout, color: ColorTheme.COLOR_PRIMARY),
            title: menuTitleWidget("ចុះឈ្មោះចេញ"),
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

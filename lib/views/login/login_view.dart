import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:personal_shopper/controllers/user_controller.dart';
import 'package:personal_shopper/models/user_model.dart';
import 'package:personal_shopper/services/user_http_services.dart';
import 'package:personal_shopper/shared/form_text_widget.dart';
import 'package:personal_shopper/themes/color.dart';
import 'package:personal_shopper/themes/text_style.dart';

// ignore: must_be_immutable
class LoginScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  UserController userController = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Container(
                padding: EdgeInsets.all(20),
                child: Form(
                    key: _formKey,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 100),
                          logoImageWidget(),
                          SizedBox(height: 50),
                          formLabelWidget("ឈ្មោះ ៖"),
                          FormTextWidget(),
                          Divider(),
                          SizedBox(height: 20),
                          formLabelWidget("ពាក្យសំងាត់ ៖"),
                          FormTextWidget(),
                          Divider(),
                          SizedBox(height: 20),
                          loginButtonWidget()
                        ])))));
  }

  Widget logoImageWidget() {
    return Center(
        child: Column(
      children: [
        ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.asset("assets/images/icon.png", width: 100)),
        SizedBox(height: 20),
        formLabelWidget("Personal Shopper")
      ],
    ));
  }

  Widget loginButtonWidget() {
    return Center(
        child: ElevatedButton(
      style: ButtonStyle(
          backgroundColor:
              MaterialStateProperty.all<Color>(ColorTheme.COLOR_PRIMARY)),
      onPressed: () => userLoginEvent(),
      child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text("ចុះឈ្មោះចូល",
              style: TextSt.textSyleInColorSize(ColorTheme.COLOR_LIGHT, 20))),
    ));
  }

  Widget formLabelWidget(String title) {
    return Text(title,
        style: TextSt.textSyleInColorSize(ColorTheme.COLOR_PRIMARY, 20));
  }

  Future<void> userLoginEvent() async {
    
    Map userLogin = {"username": "god", "password": "god"};

    final resp = await UserHttpService.userLoginAuthentication(userLogin);

    if (resp != null) {
      UserModel loginUser = UserModel.getCurrentUser();
      userController.mUser(loginUser);
    }
  }
}

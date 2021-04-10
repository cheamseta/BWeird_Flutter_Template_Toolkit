import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bweird_flutter_toolkit/controllers/user_controller.dart';
import 'package:bweird_flutter_toolkit/models/user_model.dart';
import 'package:bweird_flutter_toolkit/services/user_http_services.dart';
import 'package:bweird_flutter_toolkit/shared/components/form_text_widget.dart';
import 'package:bweird_flutter_toolkit/themes/color.dart';
import 'package:bweird_flutter_toolkit/themes/text_style.dart';

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
                          formLabelWidget("Username :"),
                          FormTextWidget(),
                          Divider(),
                          SizedBox(height: 20),
                          formLabelWidget("Password :"),
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
            child: Image.asset("assets/images/logo.png", width: 200)),
        SizedBox(height: 20)
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
          child: Text("LOGIN",
              style: TextSt.textSyleInColorSize(ColorTheme.COLOR_LIGHT, 20))),
    ));
  }

  Widget formLabelWidget(String title) {
    return Text(title,
        style: TextSt.textSyleInColorSize(ColorTheme.COLOR_PRIMARY, 20));
  }

  Future<void> userLoginEvent() async {
    UserModel loginUser = UserModel.getCurrentUser();
    userController.mUser(loginUser);
  }
}

import 'package:bweird_flutter_toolkit/controllers/user_controller.dart';
import 'package:bweird_flutter_toolkit/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bweird_flutter_toolkit/shared/components/form_text_widget.dart';
import 'package:bweird_flutter_toolkit/shared/helper.dart';
import 'package:bweird_flutter_toolkit/themes/color.dart';
import 'package:bweird_flutter_toolkit/themes/text_style.dart';
import 'package:bweird_flutter_toolkit/views/camera/camera_widget.dart';

// ignore: must_be_immutable
class ProfileTabViewWidget extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  final textEditCon = TextEditingController();
  UserController userController = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Container(
            padding: EdgeInsets.all(20),
            child: Form(
                key: _formKey,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                          child: Column(
                        children: [
                          Image.asset("assets/images/logo.png", width: 100),
                          cameraButton()
                        ],
                      )),
                      SizedBox(height: 40),
                      formTitle("Name : "),
                       Obx(() => textInput(userController.user.username, 0)),
                      Divider(),
                      SizedBox(height: 20),
                      formTitle("Age : "),
                      Obx(() => textInput(userController.user.age, 1)),
                      Divider(),
                      SizedBox(height: 20),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            submitButton(context),
                            editButton(),
                          ]),
                      SizedBox(height: 60),
                      Divider(),
                    ]))));
  }

  Widget cameraButton() {
    return TextButton(
        onPressed: () => Get.to(CameraApp()),
        child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(mainAxisSize: MainAxisSize.min, children: [
              Icon(Icons.camera_alt, color: ColorTheme.COLOR_GREY),
              Text(" Change Image",
                  style: TextSt.textSyleInColorSize(ColorTheme.COLOR_GREY, 25))
            ])));
  }

  Widget textInput(String text, int index) {
      if (userController.isEdited == false) {
        return Text(text,
            style: TextSt.textSyleInColorSize(ColorTheme.COLOR_DARK, 30));
      } else {
        return FormTextWidget(saveCallback: (value) {
          if (index == 0) {
            userController.mUsername(value);
          } else {
            userController.mAge(value);
          }
        });
    }
  }

  Widget submitButton(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all<Color>(ColorTheme.COLOR_PRIMARY)),
        onPressed: () => onSubmitEvent(context),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text("Submit",
              style: TextSt.textSyleInColorSize(ColorTheme.COLOR_LIGHT, 20)),
        ));
  }

  Widget editButton() {
    return ElevatedButton(
        style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all<Color>(ColorTheme.COLOR_GREY)),
        onPressed: () => userController.mEditForm(),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text("Edit",
              style: TextSt.textSyleInColorSize(ColorTheme.COLOR_LIGHT, 20)),
        ));
  }

  void onSubmitEvent(BuildContext context) {
    this._formKey.currentState.save();

    userController.mEditForm();

    Helper.onDialog(
        context,
        "User Info Submited",
        Column(children: [
          Text(userController.user.username),
          Text(userController.user.age)
        ]));
  }

  Widget formTitle(String title) {
    return Text(title,
        style: TextSt.textSyleInColorSize(ColorTheme.COLOR_PRIMARY, 20));
  }
}

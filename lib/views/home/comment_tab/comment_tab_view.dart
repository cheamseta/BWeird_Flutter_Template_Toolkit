import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:personal_shopper/controllers/comment_controller.dart';
import 'package:personal_shopper/models/comment_model.dart';
import 'package:personal_shopper/shared/form_text_widget.dart';
import 'package:personal_shopper/shared/helper.dart';
import 'package:personal_shopper/themes/color.dart';
import 'package:personal_shopper/themes/text_style.dart';
import 'package:personal_shopper/views/camera/camera_widget.dart';

// ignore: must_be_immutable
class CommentTabViewWidget extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  final textEditCon = TextEditingController();
  CommentController commentController = Get.put(CommentController());
  CommentModel commentModel = new CommentModel();

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
                      formTitle("ផ្លល់មតិអំពី ៖"),
                      commentCategoryWidget(context),
                      Divider(),
                      SizedBox(height: 20),
                      formTitle("មតិ ៖"),
                      FormTextWidget(
                          maxLine: 4,
                          saveCallback: (value) =>
                              commentModel.feedback = value),
                      Divider(),
                      SizedBox(height: 20),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            submitButton(context),
                            cameraButton(),
                          ]),
                      SizedBox(height: 60),
                      Divider(),
                    ]))));
  }

  Widget commentCategoryWidget(BuildContext context) {
    return Row(children: [
      Expanded(child: commentCategoryTextField()),
      IconButton(
          icon: Icon(Icons.menu),
          onPressed: () => onSelectFeedbackCateList(context))
    ]);
  }

  Widget commentCategoryTextField() {
    return Obx(() {
      if (commentController.category != "") {
        return Text(commentController.category,
            style: TextSt.textSyleInColorSize(ColorTheme.COLOR_DARK, 18));
      } else {
        return FormTextWidget(
            saveCallback: (value) => commentModel.category = value);
      }
    });
  }

  Widget cameraButton() {
    return ElevatedButton(
        style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all<Color>(ColorTheme.COLOR_DARK)),
        onPressed: () => Get.to(CameraApp()),
        child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(mainAxisSize: MainAxisSize.min, children: [
              Icon(Icons.camera_alt),
              Text(" ថតរូប",
                  style: TextSt.textSyleInColorSize(ColorTheme.COLOR_LIGHT, 25))
            ])));
  }

  Widget submitButton(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all<Color>(ColorTheme.COLOR_PRIMARY)),
        onPressed: () => onSubmitEvent(context),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text("ផ្ញើរមតិ",
              style: TextSt.textSyleInColorSize(ColorTheme.COLOR_LIGHT, 20)),
        ));
  }

  void onSubmitEvent(BuildContext context) {
    this._formKey.currentState.save();

    if (commentController.category != "") {
      commentModel.category = commentController.category;
    }

    Helper.onDialog(
        context,
        "Alert",
        Column(children: [
          Text(commentModel.category),
          Text(commentModel.feedback)
        ]));
  }

  Widget formTitle(String title) {
    return Text(title,
        style: TextSt.textSyleInColorSize(ColorTheme.COLOR_PRIMARY, 20));
  }

  Widget dialogBody(BuildContext context) {
    return ListBody(children: [
      TextButton(
          onPressed: () {
            commentController.setCategory("ទំនិញអស់ស្តុក");
            Navigator.of(context).pop();
          },
          child: Text("ទំនិញអស់ស្តុក",
              style: TextSt.textSyleInColorSize(ColorTheme.COLOR_DARK, 15))),
      TextButton(
          onPressed: () {
            commentController.setCategory("មតិពីអតិថិជន");
            Navigator.of(context).pop();
          },
          child: Text("មតិពីអតិថិជន",
              style: TextSt.textSyleInColorSize(ColorTheme.COLOR_DARK, 15))),
      TextButton(
          onPressed: () {
            commentController.setCategory("យោបល់");
            Navigator.of(context).pop();
          },
          child: Text("យោបល់",
              style: TextSt.textSyleInColorSize(ColorTheme.COLOR_DARK, 15))),
      TextButton(
          onPressed: () {
            commentController.setCategory("ផ្សេងទៀត");
            Navigator.of(context).pop();
          },
          child: Text("ផ្សេងទៀត",
              style: TextSt.textSyleInColorSize(ColorTheme.COLOR_DARK, 15)))
    ]);
  }

  void onSelectFeedbackCateList(BuildContext context) {
    Helper.onDialog(context, "ជំរើសពីការផ្តល់មតិ", this.dialogBody(context));
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:personal_shopper/themes/color.dart';
import 'package:personal_shopper/themes/text_style.dart';

class FormTextWidget extends StatelessWidget {

  final int maxLine;
  final Function(String) saveCallback;
  final String initValue;
  FormTextWidget({this.maxLine = 1, this.saveCallback, this.initValue});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onSaved: (input) {
        this.saveCallback(input);
      },
      initialValue: this.initValue,
      maxLines: this.maxLine,
      style: TextSt.textSyleInColorSize(ColorTheme.COLOR_DARK, 20),
      decoration: InputDecoration(border: InputBorder.none, hintText: "...."),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter some text';
        }
        return null;
      },
    );
  }
}

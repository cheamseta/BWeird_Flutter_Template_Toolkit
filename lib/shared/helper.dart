import 'package:flutter/material.dart';
import 'package:personal_shopper/themes/color.dart';
import 'package:personal_shopper/themes/text_style.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Helper {
  Helper._();

  static Future<String> getShareRef(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(key) ?? "";
  }

  static setShareRef(String key, String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
  }

  static Future<void> onDialog(
      BuildContext context, String title, Widget dialogBody,
      {Function isConfirmCallback}) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title,
              style: TextSt.textSyleInColorSize(ColorTheme.COLOR_PRIMARY, 20)),
          content: SingleChildScrollView(
            child: dialogBody,
          ),
          actions: <Widget>[
            isConfirmCallback != null
                ? TextButton(
                    child: Text('ទទួលយក',
                        style: TextSt.textSyleInColorSize(
                            ColorTheme.COLOR_PRIMARY, 20)),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  )
                : null,
            TextButton(
              child: Text('ចាកចេញ',
                  style: TextSt.textSyleInColorSize(ColorTheme.COLOR_GREY, 20)),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}

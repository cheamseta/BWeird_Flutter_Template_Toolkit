import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bweird_flutter_toolkit/themes/color.dart';
import 'package:bweird_flutter_toolkit/themes/text_style.dart';

class AppbarWidget extends StatelessWidget  implements PreferredSizeWidget {

  final String title;

  AppbarWidget({this.title});

  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: IconThemeData(color: ColorTheme.COLOR_PRIMARY),
      backgroundColor: Colors.white,
        elevation: 1.0,
      title : Text(this.title, style: TextSt.textSyleInColorSize(ColorTheme.COLOR_PRIMARY, 25))
    );
  }
}
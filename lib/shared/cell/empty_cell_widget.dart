import 'package:bweird_flutter_toolkit/themes/color.dart';
import 'package:bweird_flutter_toolkit/themes/text_style.dart';
import 'package:flutter/material.dart';

class EmptyCellWidget extends StatelessWidget {
  final String title;
  EmptyCellWidget({this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(20),
        padding: EdgeInsets.all(10),
        child:  Text(this.title,
              style: TextSt.textSyleInColorSize(ColorTheme.COLOR_PRIMARY, 18))
        );
  }
}

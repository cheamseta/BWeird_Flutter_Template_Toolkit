import 'package:flutter/material.dart';

class TextSt {
  TextSt._();

  static TextStyle textSyleInColorSize(Color color, double fontSize) {
    return TextStyle(
      fontFamily: 'Khmer',
      fontWeight: FontWeight.w500,
      fontSize: fontSize,
      letterSpacing: 0.27,
      color: color,
    );
  }
}

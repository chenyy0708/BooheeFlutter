import 'dart:ui';

import 'package:boohee_flutter/common/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextStyles {
  static TextStyle get11Text_00CDA2() {
    return TextStyle(fontSize: 11, color: color00CDA2);
  }

  static TextStyle get11TextA8ACBC() {
    return TextStyle(fontSize: 11, color: colorA8ACBC);
  }

  static TextStyle get14TextBold_373D52() {
    return TextStyle(
        fontSize: 14, color: color373D52, fontWeight: FontWeight.w700);
  }

  static TextStyle get15Text_373D52() {
    return TextStyle(fontSize: 15, color: color373D52);
  }

  static TextStyle get15TextBold_373D52() {
    return TextStyle(
        fontSize: 15, color: color373D52, fontWeight: FontWeight.w700);
  }

  static TextStyle get14Text_373D52() {
    return TextStyle(fontSize: 14, color: color373D52);
  }

  static TextStyle get14TextA8ACBC() {
    return TextStyle(fontSize: 14, color: colorA8ACBC);
  }

  static TextStyle get12TextA8ACBC() {
    return TextStyle(fontSize: 12, color: colorA8ACBC);
  }

  static TextStyle get12Text_373D52() {
    return TextStyle(fontSize: 12, color: color373D52);
  }

  static TextStyle get10TextA8ACBC() {
    return TextStyle(fontSize: 10, color: colorA8ACBC);
  }

  static TextStyle get15White() {
    return TextStyle(fontSize: 15, color: Colors.white);
  }
}

class PaddingStyles {
  static Padding getPadding(double padding) {
    return Padding(
        padding: EdgeInsets.only(
            top: 0, left: padding / 2, right: padding / 2, bottom: 0));
  }
}

class SizeBoxFactory {
  /// 垂直间距
  static SizedBox getVerticalSizeBox(double height) {
    return SizedBox(height: height);
  }

  /// 水平间隔
  static SizedBox getHorizontalSizeBox(double width) {
    return SizedBox(width: width);
  }
}

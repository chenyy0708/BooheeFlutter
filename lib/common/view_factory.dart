import 'package:flutter/material.dart';

class ViewFactory {
  // 创建通用的CardView
  static Card createCard(
    Widget child,
    EdgeInsetsGeometry margin,
    double height, {
    double elevation: 1,
    double radius: 12,
  }) {
    return Card(
      shape: // 圆角
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius)),
      margin: margin,
      elevation: elevation,
      child: Container(
        width: double.infinity,
        height: height,
        child: child,
      ),
    );
  }
}

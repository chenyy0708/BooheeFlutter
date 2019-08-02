import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// 全局Card，统一Card样式便于全局修改
class CardView extends StatelessWidget {
  final EdgeInsetsGeometry margin;
  final Widget child;
  final double elevation;
  final double radius;
  final Function onPressed;

  CardView(
      {Key key,
      this.margin,
      this.child,
      this.onPressed,
      this.elevation: 1,
      this.radius: 12})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Card(
        shape: // 圆角
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius)),
        margin: margin,
        elevation: elevation,
        child: child,
      ),
    );
  }
}

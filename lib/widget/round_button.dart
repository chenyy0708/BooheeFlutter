import 'package:boohee_flutter/common/colors.dart';
import 'package:flutter/material.dart';

/// 通用的圆角button按钮
class RoundButton extends StatelessWidget {
  final Color backgroundColor;
  final Text buttonText;
  final Function onPressed;
  final String text;
  final EdgeInsetsGeometry padding;

  RoundButton(
      {this.backgroundColor,
      this.buttonText,
      this.onPressed,
      this.padding,
      this.text});

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      padding: EdgeInsets.all(0),
      height: 1,
      minWidth: 1,
      child: FlatButton(
        padding:
            padding ?? EdgeInsets.only(left: 7, right: 7, top: 4, bottom: 4),
        shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(20)),
        color: this.backgroundColor ?? color00CDA2,
        child: buttonText ??
            Text(
              text,
              style: TextStyle(fontSize: 10, color: Colors.white),
            ),
        onPressed: onPressed,
      ),
    );
  }
}

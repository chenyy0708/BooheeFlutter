import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {
  final Color backgroundColor;
  final Text buttonText;
  final Function onPressed;

  RoundButton({this.backgroundColor, this.buttonText, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      height: 1,
      minWidth: 30,
      child: FlatButton(
        shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(20)),
        color: this.backgroundColor,
        child: Padding(
          padding: EdgeInsets.only(top: 4, bottom: 4, left: 0, right: 0),
          child: buttonText,
        ),
        onPressed: onPressed,
      ),
    );
  }
}

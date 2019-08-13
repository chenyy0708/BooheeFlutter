import 'package:boohee_flutter/res/styles.dart';
import 'package:flutter/material.dart';

class TopBottom extends StatelessWidget {
  final Widget top;
  final Widget bottom;
  final double margin;

  TopBottom({
    this.top,
    this.bottom,
    this.margin,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        top,
        SizeBoxFactory.getVerticalSizeBox(margin),
        bottom
      ],
    );
  }
}

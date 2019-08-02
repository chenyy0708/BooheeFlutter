import 'package:boohee_flutter/res/styles.dart';
import 'package:boohee_flutter/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CommonCard extends StatelessWidget {
  final String iconUrl;
  final String title;
  final Widget subWidget;
  final Function onPressed;

  CommonCard({
    this.iconUrl,
    this.title,
    this.subWidget,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.only(top: 19, left: 15, right: 15, bottom: 19),
        height: 58,
        child: Row(
          children: <Widget>[
            Image.asset(
              Utils.getImgPath(iconUrl),
              height: 18,
              width: 18,
            ),
            PaddingStyles.getPadding(6),
            Text(
              title,
              style: TextStyles.get14TextBold_373D52(),
            ),
            Expanded(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                subWidget == null ? Text("") : subWidget,
                Image.asset(
                  Utils.getImgPath("ic_arrow_grey"),
                )
              ],
            ))
          ],
        ),
      ),
    );
  }
}

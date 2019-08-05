import 'package:boohee_flutter/common/colors.dart';
import 'package:boohee_flutter/res/styles.dart';
import 'package:boohee_flutter/utils/screen_util.dart';
import 'package:boohee_flutter/utils/utils.dart';
import 'package:flutter/material.dart';

/// 通用的搜索头部Widget
class SearchBar extends StatelessWidget {
  final Color searchBarBg;
  final Color appbarTitleColor;
  final int appbarAlpha;
  final Function onPressed;
  final String text;
  final bool isShowCartIcon;
  final String appbarLeftIcon;
  final String appbarRightIcon;

  SearchBar(
      {this.searchBarBg,
      this.onPressed,
      this.isShowCartIcon: false,
      this.appbarAlpha: 255,
      this.appbarTitleColor: Colors.white,
      this.appbarRightIcon: "ic_message_white",
      this.appbarLeftIcon: "ic_search_white",
      this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromARGB(appbarAlpha, 0, 205, 162),
      padding: EdgeInsets.only(
          left: 17,
          right: 17,
          top: ScreenUtil.getStatusBarH(context) + 17,
          bottom: 17),
      child: Row(
        children: <Widget>[
          Expanded(
              child: Container(
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: searchBarBg ?? color0EB794,
                borderRadius: BorderRadius.circular(100),
              ),
              child: Container(
                margin: EdgeInsets.only(top: 7, bottom: 7),
                child: Row(
                  children: <Widget>[
                    PaddingStyles.getPadding(14),
                    Image.asset(
                      Utils.getImgPath(appbarLeftIcon),
                      width: 24,
                      height: 24,
                    ),
                    PaddingStyles.getPadding(7),
                    Text(
                      text,
                      style: TextStyle(fontSize: 14, color: appbarTitleColor),
                    )
                  ],
                ),
              ),
            ),
          )),
          Offstage(
            child: PaddingStyles.getPadding(14),
            offstage: !isShowCartIcon,
          ),
          Offstage(
            offstage: !isShowCartIcon,
            child: Image.asset(
              Utils.getImgPath("ic_shop_cart_white"),
              width: 24,
              height: 24,
            ),
          ),
          PaddingStyles.getPadding(14),
          Image.asset(
            Utils.getImgPath(appbarRightIcon),
            width: 24,
            height: 24,
          )
        ],
      ),
    );
  }
}

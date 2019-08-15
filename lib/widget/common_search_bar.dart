import 'package:boohee_flutter/common/colors.dart';
import 'package:boohee_flutter/res/styles.dart';
import 'package:boohee_flutter/utils/screen_util.dart';
import 'package:boohee_flutter/utils/utils.dart';
import 'package:flutter/material.dart';

/// 通用的搜索头部Widget
class SearchBar extends StatefulWidget implements PreferredSizeWidget {
  final Key key;
  final Function onPressed;
  final String text;
  final bool isShowCartIcon;
  final SearchBarController controller;

  SearchBar(
      {this.onPressed,
      this.controller,
      this.key,
      this.isShowCartIcon: false,
      @required this.text})
      : super(key: key);

  @override
  SearchBarState createState() => SearchBarState();

  @override
  Size get preferredSize => Size.fromHeight(200);
}

class SearchBarState extends State<SearchBar> {
  SearchBarController _controller;

  @override
  Widget build(BuildContext context) {
    if (widget.controller == null) {
      _controller = new SearchBarController();
      _controller.value.alpha = 255;
      _controller.value.searchBarBg = color0EB794;
      _controller.value.appbarTitleColor = Colors.white;
      _controller.value.appbarLeftIcon = "ic_search_white";
      _controller.value.appbarRightIcon = "ic_message_white";
    } else {
      _controller = widget.controller;
    }
    return Container(
      color: Color.fromARGB(_controller.value.alpha, 0, 205, 162),
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
                color: _controller.value.searchBarBg,
                borderRadius: BorderRadius.circular(100),
              ),
              child: Container(
                margin: EdgeInsets.only(top: 7, bottom: 7),
                child: Row(
                  children: <Widget>[
                    PaddingStyles.getPadding(14),
                    Image.asset(
                      Utils.getImgPath(_controller.value.appbarLeftIcon),
                      width: 24,
                      height: 24,
                    ),
                    PaddingStyles.getPadding(7),
                    Text(
                      widget.text,
                      style: TextStyle(
                          fontSize: 14,
                          color: _controller.value.appbarTitleColor),
                    )
                  ],
                ),
              ),
            ),
          )),
          Offstage(
            child: PaddingStyles.getPadding(14),
            offstage: !widget.isShowCartIcon,
          ),
          Offstage(
            offstage: !widget.isShowCartIcon,
            child: Image.asset(
              Utils.getImgPath("ic_shop_cart_white"),
              width: 24,
              height: 24,
            ),
          ),
          PaddingStyles.getPadding(14),
          Image.asset(
            Utils.getImgPath(_controller.value.appbarRightIcon),
            width: 24,
            height: 24,
          )
        ],
      ),
    );
  }
}

class SearchBarController extends ValueNotifier<SearchBarAlphaValue> {
  int alpha;
  Color searchBarBg;
  Color appbarTitleColor;
  String appbarLeftIcon;
  String appbarRightIcon;

  SearchBarController({
    this.alpha,
    this.searchBarBg,
    this.appbarTitleColor,
    this.appbarLeftIcon,
    this.appbarRightIcon,
  }) : super(new SearchBarAlphaValue(
            alpha: alpha,
            searchBarBg: searchBarBg,
            appbarTitleColor: appbarTitleColor,
            appbarLeftIcon: appbarLeftIcon,
            appbarRightIcon: appbarRightIcon));
}

class SearchBarAlphaValue {
  int alpha;
  Color searchBarBg;

  Color appbarTitleColor;
  String appbarLeftIcon;
  String appbarRightIcon;

  SearchBarAlphaValue({
    this.alpha,
    this.searchBarBg,
    this.appbarTitleColor,
    this.appbarLeftIcon,
    this.appbarRightIcon,
  });
}

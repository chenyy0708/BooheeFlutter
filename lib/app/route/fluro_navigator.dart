import 'package:boohee_flutter/app/route/routes.dart';
import 'package:boohee_flutter/utils/base64_utils.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

import 'application.dart';

/// fluro的路由跳转工具类
class NavigatorUtils {
  static push(BuildContext context, String path,
      {bool replace = false, bool clearStack = false}) {
    Application.router.navigateTo(context, path,
        replace: replace,
        clearStack: clearStack,
        transition: TransitionType.native);
  }

  static pushResult(
      BuildContext context, String path, Function(Object) function,
      {bool replace = false, bool clearStack = false}) {
    Application.router
        .navigateTo(context, path,
            replace: replace,
            clearStack: clearStack,
            transition: TransitionType.native)
        .then((result) {
      // 页面返回result为null
      if (result == null) {
        return;
      }
      function(result);
    }).catchError((error) {
      print("$error");
    });
  }

  /// 返回
  static void goBack(BuildContext context) {
    Navigator.pop(context);
  }

  /// 通用的浏览器page
  static void goBrowserPage(BuildContext context, String url) {
    /// 这里使用替换/主要是路由不支持链接中带有/和&，否则会出错
    url = Base64.encodeBase64(url).replaceAll("/", "Chen*boohee");
    Application.router.navigateTo(context, '${Routes.webView}?web_url=$url',
        replace: false,
        clearStack: false,
        transition: TransitionType.inFromBottom);
  }

  /// 带参数返回
  static void goBackWithParams(BuildContext context, result) {
    Navigator.pop(context, result);
  }
}

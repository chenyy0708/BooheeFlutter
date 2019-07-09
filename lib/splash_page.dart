import 'package:boohee_flutter/utils/sp_util.dart';
import 'package:boohee_flutter/utils/utils.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

import 'app/route/application.dart';
import 'app/route/fluro_navigator.dart';
import 'app/route/routes.dart';
import 'common/constant.dart';
import 'http/http.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  _SplashPageState() {
    final router = new Router();
    Routes.configureRoutes(router);
    Application.router = router;
  }

  bool isLogin = false;

  @override
  void initState() {
    super.initState();
    _loadLoginStatus();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Scaffold(
      body: new Image.asset(
        Utils.getImgPath('launch_image'),
        width: double.infinity,
        fit: BoxFit.fill,
        height: double.infinity,
      ),
    ),);
  }

  void _loadLoginStatus() async {
    await SpUtil.getInstance();
    if (!mounted) return;
    _init();
    _loadLocale();
    _initAsync();
  }

  void _init() {
    dio.options = mBooheeOptions;
  }

  void _loadLocale() {
    setState(() {
      String token = SpUtil.getString(Constant.token, defValue: "");
      if (token.isNotEmpty) {
        isLogin = true;
      }
    });
  }

  void _initAsync() {
    Observable.just(3).delay(new Duration(milliseconds: 1000)).listen((_) {
      if (isLogin) {
        NavigatorUtils.push(context, Routes.root);
      } else {
        NavigatorUtils.push(context, Routes.login,
            replace: true, clearStack: true);
      }
    });
  }
}

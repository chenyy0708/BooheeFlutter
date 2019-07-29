import 'package:boohee_flutter/utils/screen_util.dart';
import 'package:boohee_flutter/utils/sp_util.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

import 'app/route/application.dart';
import 'app/route/fluro_navigator.dart';
import 'app/route/routes.dart';
import 'common/constant.dart';
import 'http/http.dart';
import 'http/request_url.dart';
import 'model/splash_ad.dart';

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

  // 因为offstage属性为true是隐藏，false为显示，所以默认属性为true
  bool inVisible = true;

  String adImageUrl = "";
  String adTitle = "";

  @override
  void initState() {
    super.initState();
    _loadLoginStatus();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          height: double.infinity,
          child: Column(
            children: <Widget>[
              Stack(
                alignment: Alignment.bottomCenter,
                children: <Widget>[
                  Image.network(
                    adImageUrl,
                    width: double.infinity,
                    height: ScreenUtil.getScreenH(context) - 100,
                    fit: BoxFit.cover,
                  ),
                  Offstage(
                    offstage: inVisible,
                    child: Container(
                      height: 50,
                      width: double.infinity,
                      color: Colors.black38,
                      child: Center(
                        child: Text(
                          adTitle,
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 100,
                child: Text("底部"),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _loadLoginStatus() async {
    await SpUtil.getInstance();
    if (!mounted) return;
    _loadSplashAd();
    _loadLocale();
    _initAsync();
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
    Observable.just(3).delay(new Duration(milliseconds: 3000)).listen((_) {
      if (isLogin) {
        NavigatorUtils.push(context, Routes.root, replace: true);
      } else {
        NavigatorUtils.push(context, Routes.login, replace: true);
      }
    });
  }

  void _loadSplashAd() {
    dio
        .get(RequestUrl.getBaseUrl(RequestUrl.status,
            url: HomeRequestUrl.splash_ad))
        .then((response) {
      var _splashAd = SplashAd.fromJson(response.data);
      adImageUrl = _splashAd.startUpUrl;
      adTitle = _splashAd.text;
      inVisible = !adTitle.isNotEmpty;
      setState(() {});
    });
  }
}

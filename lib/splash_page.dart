import 'package:boohee_flutter/res/styles.dart';
import 'package:boohee_flutter/utils/repository_utils.dart';
import 'package:boohee_flutter/utils/utils.dart';
import 'package:boohee_flutter/widget/round_button.dart';
import 'package:extended_image/extended_image.dart';
import 'package:fluro/fluro.dart';
import 'package:flustars/flustars.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'app/route/application.dart';
import 'app/route/fluro_navigator.dart';
import 'app/route/routes.dart';
import 'common/colors.dart';
import 'common/constant.dart';
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
  SplashAd splashAd;
  TimerUtil _timerUtil;
  int countdownTime = 3 * 1000;
  int currentTime = 3;

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
              Expanded(
                  child: Stack(
                alignment: Alignment.bottomCenter,
                children: <Widget>[
                  ExtendedImage.network(
                    splashAd == null ? "" : splashAd.startUpUrl,
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.cover,
                    cache: true,
                    enableLoadState: false,
                  ),
                  Offstage(
                    offstage: inVisible,
                    child: Container(
                      height: 50,
                      width: double.infinity,
                      color: Colors.black38,
                      child: Center(
                        child: Text(
                          splashAd == null ? "" : splashAd.text,
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                      ),
                    ),
                  )
                ],
              )),
              Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  Container(
                    height: 105,
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Image.asset(
                          Utils.getImgPath("ic_boohee_logo"),
                          height: 35,
                          width: 35,
                        ),
                        PaddingStyles.getPadding(10),
                        Text(
                          "薄荷健康",
                          style: TextStyle(
                              color: color373D52,
                              fontSize: 18,
                              fontWeight: FontWeight.w600),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 10),
                    child: Align(
                        alignment: Alignment.centerRight,
                        child: Offstage(
                          offstage: inVisible,
                          child: RoundButton(
                            padding: EdgeInsets.only(
                                left: 5, right: 5, top: 2, bottom: 2),
                            backgroundColor: Colors.black45,
                            radius: 2,
                            buttonText: Text(
                              "跳过广告 $currentTime",
                              style:
                                  TextStyle(fontSize: 12, color: Colors.white),
                            ),
                            onPressed: () {
                              _timerUtil.cancel();
                              goHome();
                            },
                          ),
                        )),
                  )
                ],
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
    _loadLocale();
    _loadSplashAd();
  }

  void _loadLocale() {
    setState(() {
      String token = SpUtil.getString(Constant.token, defValue: "");
      if (token.isNotEmpty) {
        isLogin = true;
      }
    });
  }

  void _loadSplashAd() {
    Repository.loadAsset("splash_ad").then((json) {
      splashAd = SplashAd.fromJson(Repository.toMapForList(json));
      inVisible = !splashAd.isAd;
      if (inVisible) {
        // 没有广告，倒计时1s
        countdownTime = 1 * 1000;
      }
      initCountDown(countdownTime);
      // 开始倒计时
      _timerUtil.startCountDown();
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
    if (_timerUtil != null) _timerUtil.cancel(); //记得中dispose里面把timer cancel。
  }

  void goHome() {
    if (isLogin) {
      NavigatorUtils.push(context, Routes.root, replace: true);
    } else {
      NavigatorUtils.push(context, Routes.login, replace: true);
    }
  }

  /// 初始化倒计时
  void initCountDown(int countdownTime) {
    _timerUtil = new TimerUtil(mTotalTime: countdownTime);
    _timerUtil.setOnTimerTickCallback((int tick) {
      double _tick = tick / 1000;
      setState(() {
        currentTime = _tick.toInt();
      });
      if (_tick == 0) {
        goHome();
      }
    });
  }
}

import 'dart:ui';

import 'package:boohee_flutter/app/global_store/state.dart';
import 'package:boohee_flutter/model/splash_ad.dart';
import 'package:boohee_flutter/utils/timer_util.dart';

class SplashState implements GlobalBaseState<SplashState> {
  bool isLogin = false;

  // 因为offstage属性为true是隐藏，false为显示，所以默认属性为true
  bool inVisible = true;
  SplashAd splashAd;
  TimerUtil timerUtil;
  int countdownTime = 3 * 1000;
  int currentTime = 3;

  @override
  SplashState clone() {
    return SplashState()
      ..isLogin = isLogin
      ..inVisible = inVisible
      ..splashAd = splashAd
      ..timerUtil = timerUtil
      ..countdownTime = countdownTime
      ..currentTime = currentTime;
  }

  @override
  Color themeColor;
}

SplashState initState(Map<String, dynamic> args) {
  return SplashState();
}

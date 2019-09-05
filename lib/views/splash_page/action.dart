import 'package:boohee_flutter/model/splash_ad.dart';
import 'package:fish_redux/fish_redux.dart';

enum SplashAction { action, isLogin, initAd, clickAd, clickJump, updateTime }

class SplashActionCreator {
  static Action onAction() {
    return const Action(SplashAction.action);
  }

  static Action onLoginStatus(bool isLogin) {
    return  Action(SplashAction.isLogin,payload: isLogin);
  }

  static Action onInitAd(SplashAd splashAd) {
    return  Action(SplashAction.initAd, payload: splashAd);
  }

  static Action onClickAd() {
    return const Action(SplashAction.clickAd);
  }

  static Action onClickJump() {
    return const Action(SplashAction.clickJump);
  }

  static Action onUpdateTime(int time) {
    return Action(SplashAction.updateTime, payload: time);
  }
}

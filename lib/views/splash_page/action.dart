import 'package:boohee_flutter/model/splash_ad.dart';
import 'package:fish_redux/fish_redux.dart';

enum SplashAction { action, isLogin, initAd, clickAd, clickJump }

class SplashActionCreator {
  static Action onAction() {
    return const Action(SplashAction.action);
  }

  static Action onLoginStatus() {
    return const Action(SplashAction.isLogin);
  }

  static Action onInitAd(SplashAd splashAd) {
    return const Action(SplashAction.initAd);
  }

  static Action onClickAd() {
    return const Action(SplashAction.clickAd);
  }

  static Action onClickJump() {
    return const Action(SplashAction.clickJump);
  }
}

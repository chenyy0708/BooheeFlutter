import 'package:fish_redux/fish_redux.dart';

enum SplashAction { action, isLogin, loadSplashAd, clickAd, clickJump }

class SplashActionCreator {
  static Action onAction() {
    return const Action(SplashAction.action);
  }

  static Action onLoginStatus() {
    return const Action(SplashAction.isLogin);
  }

  static Action onLoadSplashAd() {
    return const Action(SplashAction.loadSplashAd);
  }

  static Action onClickAd() {
    return const Action(SplashAction.clickAd);
  }

  static Action onClickJump() {
    return const Action(SplashAction.clickJump);
  }
}

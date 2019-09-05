import 'package:boohee_flutter/model/splash_ad.dart';
import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<SplashState> buildReducer() {
  return asReducer(
    <Object, Reducer<SplashState>>{
      SplashAction.action: _onAction,
      SplashAction.isLogin: _onLoginStatus,
      SplashAction.initAd: _onInitAd,
      SplashAction.updateTime: _onUpdateTime,
    },
  );
}

SplashState _onAction(SplashState state, Action action) {
  final SplashState newState = state.clone();
  return newState;
}

SplashState _onLoginStatus(SplashState state, Action action) {
  bool isLogin = action.payload ?? '';
  final SplashState newState = state.clone();
  newState.isLogin = isLogin;
  return newState;
}

SplashState _onUpdateTime(SplashState state, Action action) {
  int updateTime = action.payload ?? '';
  final SplashState newState = state.clone();
  newState.currentTime = updateTime;
  return newState;
}

SplashState _onInitAd(SplashState state, Action action) {
  SplashAd splashAd = action.payload ?? '';
  final SplashState newState = state.clone();
  newState.splashAd = splashAd;
  return newState;
}

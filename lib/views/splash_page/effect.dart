import 'package:boohee_flutter/app/route/fluro_navigator.dart';
import 'package:boohee_flutter/app/route/routes.dart';
import 'package:boohee_flutter/common/constant.dart';
import 'package:boohee_flutter/model/splash_ad.dart';
import 'package:boohee_flutter/utils/repository_utils.dart';
import 'package:boohee_flutter/utils/sp_util.dart';
import 'package:boohee_flutter/utils/timer_util.dart';
import 'package:boohee_flutter/views/splash_page/action.dart';
import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Effect<SplashState> buildEffect() {
  return combineEffects(<Object, Effect<SplashState>>{
    SplashAction.action: _onAction,
    SplashAction.clickAd: _onClickAd,
    SplashAction.clickJump: _onClickJump,
    Lifecycle.initState: _onInit,
    Lifecycle.dispose: _onDispose
  });
}

void _onAction(Action action, Context<SplashState> ctx) {}

void _onInit(Action action, Context<SplashState> ctx) {
  /// 是否登录
  SpUtil.getInstance().then((sp) {
    String token = SpUtil.getString(Constant.token, defValue: "");
    if (token.isNotEmpty) {
      ctx.state.isLogin = true;
    }
  });
  Repository.loadAsset("splash_ad").then((json) {
    var splashAd = SplashAd.fromJson(Repository.toMapForList(json));
    ctx.state.inVisible = !splashAd.isAd;
    ctx.state.splashAd = splashAd;
    if (ctx.state.inVisible) {
      // 没有广告，倒计时1s
      ctx.state.countdownTime = 1 * 1000;
    }
    ctx.state.timerUtil = new TimerUtil(mTotalTime: ctx.state.countdownTime);
    ctx.state.timerUtil.setOnTimerTickCallback((int tick) {
      double _tick = tick / 1000;
      ctx.state.currentTime = _tick.toInt();
      if (_tick == 0) {
        ctx.dispatch(SplashActionCreator.onClickJump());
      }
    });
    ctx.state.timerUtil.startCountDown();
    if (splashAd != null) ctx.dispatch(SplashActionCreator.onInitAd(splashAd));
  });
}

void _onDispose(Action action, Context<SplashState> ctx) {
  ctx.state.timerUtil.cancel();
}

Future _onClickAd(Action action, Context<SplashState> ctx) async {}

Future _onClickJump(Action action, Context<SplashState> ctx) async {
  if (ctx.state.isLogin) {
    NavigatorUtils.push(ctx.context, Routes.root, replace: true);
  } else {
    NavigatorUtils.push(ctx.context, Routes.login, replace: true);
  }
}

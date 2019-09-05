import 'package:boohee_flutter/common/colors.dart';
import 'package:boohee_flutter/res/styles.dart';
import 'package:boohee_flutter/utils/utils.dart';
import 'package:boohee_flutter/widget/round_button.dart';
import 'package:extended_image/extended_image.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    SplashState state, Dispatch dispatch, ViewService viewService) {
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
                  state.splashAd == null ? "" : state.splashAd.startUpUrl,
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.cover,
                  cache: true,
                  enableLoadState: false,
                ),
                Offstage(
                  offstage: state.inVisible,
                  child: Container(
                    height: 50,
                    width: double.infinity,
                    color: Colors.black38,
                    child: Center(
                      child: Text(
                        state.splashAd == null ? "" : state.splashAd.text,
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
                        offstage: state.inVisible,
                        child: RoundButton(
                          padding: EdgeInsets.only(
                              left: 5, right: 5, top: 2, bottom: 2),
                          backgroundColor: Colors.black45,
                          radius: 2,
                          buttonText: Text(
                            "跳过广告 ${state.currentTime}",
                            style: TextStyle(fontSize: 12, color: Colors.white),
                          ),
                          onPressed: () {
                            state.timerUtil.cancel();
                            dispatch(SplashActionCreator.onClickJump());
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

import 'package:boohee_flutter/app/route/fluro_navigator.dart';
import 'package:boohee_flutter/app/route/routes.dart';
import 'package:boohee_flutter/common/Colors.dart';
import 'package:boohee_flutter/common/constant.dart';
import 'package:boohee_flutter/model/login_user.dart';
import 'package:boohee_flutter/res/styles.dart';
import 'package:boohee_flutter/utils/account_utils.dart';
import 'package:boohee_flutter/utils/repository_utils.dart';
import 'package:boohee_flutter/utils/toast_utils.dart';
import 'package:boohee_flutter/utils/utils.dart';
import 'package:flustars/flustars.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var leftRightPadding = 30.0;
  var topBottomPadding = 4.0;

  var _userPassController = new TextEditingController();
  var _userNameController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        backgroundColor: Colors.white,
        appBar: new AppBar(
          backgroundColor: mainColor,
          title: Text("账号登陆"),
        ),
        body: SingleChildScrollView(
          child: new Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 80),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      Utils.getImgPath("ic_boohee_logo"),
                      height: 35,
                      width: 35,
                    ),
                    SizeBoxFactory.getHorizontalSizeBox(20),
                    Text(
                      "薄荷健康",
                      style: TextStyle(
                          color: color373D52,
                          fontSize: 23,
                          fontWeight: FontWeight.w600),
                    )
                  ],
                ),
              ),
              new Padding(
                padding: new EdgeInsets.fromLTRB(
                    leftRightPadding, 50.0, leftRightPadding, topBottomPadding),
                child: new TextField(
                  style: new TextStyle(fontSize: 16.0, color: color373D52),
                  controller: _userNameController,
                  decoration: new InputDecoration(
                      hintText: "用户名/手机号/邮箱",
                      hintStyle: TextStyle(fontSize: 16, color: colorA8ACBC)),
                ),
              ),
              new Padding(
                padding: new EdgeInsets.fromLTRB(
                    leftRightPadding, 30.0, leftRightPadding, topBottomPadding),
                child: new TextField(
                  style: TextStyle(fontSize: 16.0, color: color373D52),
                  controller: _userPassController,
                  decoration: new InputDecoration(
                      hintText: "密码",
                      hintStyle: TextStyle(fontSize: 16, color: colorA8ACBC)),
                  obscureText: true,
                ),
              ),
              new Container(
                width: 360.0,
                margin: new EdgeInsets.fromLTRB(10.0, 80, 10.0, 0.0),
                padding: new EdgeInsets.fromLTRB(leftRightPadding,
                    topBottomPadding, leftRightPadding, topBottomPadding),
                child: new Card(
                  color: mainColor,
                  elevation: 6.0,
                  child: new FlatButton(
                      onPressed: () {
                        login();
                      },
                      child: new Padding(
                        padding: new EdgeInsets.all(10.0),
                        child: new Text(
                          '登录',
                          style: new TextStyle(
                              color: Colors.white, fontSize: 16.0),
                        ),
                      )),
                ),
              )
            ],
          ),
        ));
  }

  void login() async {
    if (_userNameController.text.isEmpty || _userPassController.text.isEmpty) {
      ToastUtils.showToast(context, "用户名或密码不能为空");
      return;
    }
    Repository.loadAsset("login_user", fileDir: "user").then((json) async {
      LoginUser loginUser = LoginUser.fromJson(Repository.toMap(json));
      await SpUtil.getInstance();
      AccountUtils.saveUser(loginUser);
      SpUtil.putString(Constant.token, loginUser.token);
      SpUtil.putString(Constant.user_key, loginUser.user.userKey);
      if (loginUser != null && loginUser.token.isNotEmpty) {
        // 登录成功，跳转首页
        NavigatorUtils.push(context, Routes.root, replace: true);
      }
    });
  }
}

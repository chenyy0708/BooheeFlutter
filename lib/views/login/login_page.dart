import 'package:boohee_flutter/app/route/fluro_navigator.dart';
import 'package:boohee_flutter/app/route/routes.dart';
import 'package:boohee_flutter/common/Colors.dart';
import 'package:boohee_flutter/common/constant.dart';
import 'package:boohee_flutter/http/http.dart';
import 'package:boohee_flutter/http/request_url.dart';
import 'package:boohee_flutter/model/login_user.dart';
import 'package:boohee_flutter/utils/account_utils.dart';
import 'package:boohee_flutter/utils/sp_util.dart';
import 'package:boohee_flutter/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var leftRightPadding = 30.0;
  var topBottomPadding = 4.0;
  var textTips = new TextStyle(fontSize: 16.0, color: Colors.black);
  var hintTips = new TextStyle(fontSize: 15.0, color: Colors.black26);

  var _userPassController = new TextEditingController();
  var _userNameController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        backgroundColor: Colors.white,
        appBar: new AppBar(
          centerTitle: false,
          backgroundColor: mainColor,
          title: Text("登陆"),
        ),
        body: SingleChildScrollView(
          child: new Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              new Padding(
                padding: new EdgeInsets.fromLTRB(
                    leftRightPadding, 50.0, leftRightPadding, 10.0),
                child: new Image.asset(Utils.getImgPath("ic_boohee_logo")),
              ),
              new Padding(
                padding: new EdgeInsets.fromLTRB(
                    leftRightPadding, 50.0, leftRightPadding, topBottomPadding),
                child: new TextField(
                  style: textTips,
                  controller: _userNameController,
                  decoration: new InputDecoration(hintText: "请输入用户名"),
                ),
              ),
              new Padding(
                padding: new EdgeInsets.fromLTRB(
                    leftRightPadding, 30.0, leftRightPadding, topBottomPadding),
                child: new TextField(
                  style: hintTips,
                  controller: _userPassController,
                  decoration: new InputDecoration(hintText: "请输入用户密码"),
                  obscureText: true,
                ),
              ),
              new Container(
                width: 360.0,
                margin: new EdgeInsets.fromLTRB(10.0, 40.0, 10.0, 0.0),
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
    var map = {
      "login": _userNameController.text,
      "password": _userPassController.text
    };
    dio
        .post(RequestUrl.getBaseUrl(RequestUrl.passport, url: RequestUrl.login),
            data: RequestUrl.signParams(map))
        .then((response) async {
      LoginUser loginUser = LoginUser.fromJson(response.data);
      await SpUtil.getInstance();
      AccountUtils.saveUser(loginUser);
      SpUtil.putString(Constant.token, loginUser.token);
      SpUtil.putString(Constant.user_key, loginUser.user.userKey);
      // 更新dio中的header对象
      RequestUrl.initDioHeader(dio);
      if (loginUser != null && loginUser.token.isNotEmpty) {
        // 登录成功，跳转首页
        NavigatorUtils.push(context, Routes.root, replace: true);
      }
    });
  }
}

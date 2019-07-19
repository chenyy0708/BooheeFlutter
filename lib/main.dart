import 'package:auto_size/auto_size.dart';
import 'package:boohee_flutter/utils/sp_util.dart';
import 'package:boohee_flutter/views/route_component.dart';

import 'common/constant.dart';
import 'http/http.dart';

void main() {
  _init();
  runAutoSizeApp(RouteComponent(), width: 375, height: 667);
}

void _init() async {
  await SpUtil.getInstance();
  dio.options = mBooheeOptions;
  // 配置请求头
  Map<String, String> headers = {
    "App-Device": "Android",
    "App-Key": "one",
    "Phone-Model": "Redmi 5A",
    "Accept": "application\/json",
    "Os-Version": "8.1.0",
    "User-Agent": "Android\/Volley",
    "channel": "",
    "App-Version": "7.1.6",
    "Version-Code": "163",
    "Device-Token": "868028037744143",
    "User-Key": SpUtil.getString(Constant.user_key, defValue: ""),
    "token": SpUtil.getString(Constant.token, defValue: ""),
  };
  dio.options.headers = headers;
}

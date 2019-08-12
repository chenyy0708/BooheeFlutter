import 'dart:convert';

import 'package:boohee_flutter/common/constant.dart';
import 'package:boohee_flutter/http/app_config.dart';
import 'package:boohee_flutter/utils/account_utils.dart';
import 'package:boohee_flutter/utils/base64_utils.dart';
import 'package:boohee_flutter/utils/sp_util.dart';
import 'package:dio/dio.dart';

class HomeRequestUrl {
  // 首页卡片
  static const String home_tools = "/api/v2/tools";

  // 壁纸
  static const String home_wallpaper = "/api/v1/home/items2";

  // 广告
  static const String splash_ad = "/api/v1/app_square/start_up_with_ad";
}

class RequestUrl {
//  static const String domain = ".iboohee.cn";
  static const String domain = ".boohee.com";
  static const String passport = "passport";
  static const String one = "one";
  static const String bingo = "bingo";
  static const String record = "record";
  static const String columbus = "columbus";
  static const String status = "status";

  static const String KEY = "ifood";
  static const String SECRET = "0d1efea355c74c17deaf5fb10c6ca68f57af7ecc";
  static const String QA_KEY = "ifood";
  static const String QA_SECRET = "boohee-test-test-test";

  // 商店banner
  static const String shop_banner = "/api/v1/shop_home_v63";

// 推荐商品列表，根据分类显示不同列表
  static const String shop_recommend_list = "/api/v1/categories/";

  // 登陆
  static const String login = "/api/v1/users/login";

  // 服务器地址
  static String getBaseUrl(String baseUrl, {domain: domain, url: ""}) {
    return 'https://$baseUrl$domain$url';
  }

  static Map<String, dynamic> signParams(Map<String, dynamic> data) {
    Map<String, dynamic> params = Map();
    String key = "ifood";
    data ?? Map();
    // 检测是否登录
    if (AccountUtils.isLogin()) {
      data.putIfAbsent(
          "token", () => SpUtil.getString(Constant.token, defValue: ""));
      data.putIfAbsent(
          "user_key", () => SpUtil.getString(Constant.user_key, defValue: ""));
    }
    data.putIfAbsent("device_token", () => "868028037744143");
    String json = jsonEncode(data);
    params.putIfAbsent("app_key", () => key);
    params.putIfAbsent("context_params", () => contextParams(json));
    params.putIfAbsent("sign", () => signature(json));
    return params;
  }

  // 上下文
  static String contextParams(String json) {
    return Base64.encodeBase64(json);
  }

  // 参数签名
  static String signature(String json) {
    String key = AppConfig.isProduction() ? KEY : QA_KEY;
    String secret = AppConfig.isProduction() ? SECRET : QA_SECRET;
    String context = contextParams(json);
    return Base64.encryptHMAC(key + context, secret);
  }

  static void initDioHeader(Dio dio) {
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
}

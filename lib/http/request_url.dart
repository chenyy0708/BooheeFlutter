import 'package:boohee_flutter/common/constant.dart';
import 'package:boohee_flutter/utils/account_utils.dart';
import 'package:boohee_flutter/utils/base64_utils.dart';
import 'package:boohee_flutter/utils/sp_util.dart';

class HomeRequestUrl {
  // 首页卡片
  static const String home_tools = "/api/v2/tools";

  // 壁纸
  static const String home_wallpaper = "/api/v1/home/items2";
}

class RequestUrl {
//  static const String domain = ".iboohee.cn";
  static const String domain = ".boohee.com";
  static const String passport = "passport";
  static const String one = "one";
  static const String bingo = "bingo";
  static const String record = "record";
  static const String columbus = "columbus";

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
    params.putIfAbsent("app_key", () => key);
    params.putIfAbsent(
        "context_params",
        () =>
            "eyJsb2dpbiI6IjE4MzcwNjIyMDMwIiwicGFzc3dvcmQiOiJxcTEyMzQ1NiIsImRldmljZV90b2tlbiI6Ijg2ODAyODAzNzc0NDE0MyJ9");
    params.putIfAbsent("sign", () => "VOe6bXKlPuqBMxZgMt+L7hP6yco=");
    return params;
  }

  // 上下文
  static String contextParams(String json) {
    return Base64.encodeBase64(json);
  }

  // 参数签名
  static String signature(String json) {
//    String key = KEY;
//    String secret = SECRET;
//    String context = contextParams(json);
    return Base64.encodeBase64(json);
  }
}

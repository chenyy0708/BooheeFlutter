import 'package:boohee_flutter/common/constant.dart';
import 'package:flustars/flustars.dart';

class BrowserUrlManager {
  static const String URL_BASE = "https://pixiu.boohee.com/";

//  static const String URL_BASE = "https://pixiu.iboohee.cn/";

  /// 智慧营养师首页
  static const String URL_PAY_SMART_ANALYSIS = URL_BASE + "recipe-detail?date=";

  /// 饮食运动记录h5
  static const String URL_CALORY = "https://calory.boohee.com/";

  static String getSmartAnalysisUrl() {
    return URL_PAY_SMART_ANALYSIS +
        DateUtil.formatDate(DateTime.now(), format: Constant.y_mo_d_v2);
  }

  static Future<String> handleUrl(String url) async {
    await SpUtil.getInstance();
    if (url.isEmpty) {
      return null;
    }
    url = appendBaseParams(url);
    url = appendToken(url);
    return url;
  }

  /// 为所有url添加基本参数
  static String appendBaseParams(String url) {
    if (url.contains("?")) {
      url += "&app_device=Android";
    } else {
      url += "?app_device=Android";
    }
    url += "&channel=" + "boohee";
    url += "&app_key=" + "one";
    return url;
  }

  /// 来自薄荷的url会加上token
  static String appendToken(String url) {
    if (url.contains("boohee.com") ||
        url.contains("boohee.cn") ||
        url.contains("iboohee.cn")) {
      if (url.contains("?")) {
        url += "&token=";
      } else {
        url += "?token=";
      }
      url += SpUtil.getString(Constant.token, defValue: "");
    }
    return url;
  }
}

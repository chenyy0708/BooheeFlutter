import 'package:boohee_flutter/common/constant.dart';
import 'package:boohee_flutter/utils/date_util.dart';
import 'package:boohee_flutter/utils/sp_util.dart';

class BrowserUrlManager {
  static const String URL_BASE = "https://pixiu.boohee.com/";

//  static const String URL_BASE = "https://pixiu.iboohee.cn/";

  static const String URL_PAY_SMART_ANALYSIS = URL_BASE + "recipe-detail?date=";

  static String getSmartAnalysisUrl() {
    return URL_PAY_SMART_ANALYSIS +
        DateUtil.formatDate(DateTime.now(), format: DataFormats.y_mo_d_v2);
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

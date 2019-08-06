import 'package:boohee_flutter/http/request_url.dart';

class AppConfig {
  /// 标记是否为正式环境
  static bool isProduction() {
    return RequestUrl.domain == ".boohee.com";
  }
}

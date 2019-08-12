import 'package:auto_size/auto_size.dart';
import 'package:boohee_flutter/utils/sp_util.dart';
import 'package:boohee_flutter/views/route_component.dart';

import 'http/http.dart';
import 'http/request_url.dart';

void main() {
  _init();
  runAutoSizeApp(RouteComponent(), width: 375, height: 667);
}

void _init() async {
  await SpUtil.getInstance();
  dio.options = mBooheeOptions;
  // 配置请求头
  RequestUrl.initDioHeader(dio);
}

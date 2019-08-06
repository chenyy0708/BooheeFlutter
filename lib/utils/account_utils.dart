import 'package:boohee_flutter/common/constant.dart';
import 'package:boohee_flutter/utils/sp_util.dart';

class AccountUtils {
  static bool isLogin() {
    String token = SpUtil.getString(Constant.token, defValue: "");
    if (token.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }
}

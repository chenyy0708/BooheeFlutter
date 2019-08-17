import 'dart:convert';
import 'dart:math';

import 'package:flutter/services.dart';

class Repository {
  static Future<String> loadAsset(String fileName,
      {String fileDir: 'common'}) async {
    return await rootBundle.loadString('assets/json/$fileDir/$fileName.json');
  }

  static Map<String, dynamic> toMap(String json) {
    return jsonDecode(json);
  }

  ///  获取json集合中随机一个数据
  static Map<String, dynamic> toMapForList(String json) {
    List<dynamic> mLists = jsonDecode(json);
    return mLists[Random().nextInt(mLists.length)];
  }
}

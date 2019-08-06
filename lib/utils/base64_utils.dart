import 'dart:convert';

import 'package:crypto/crypto.dart';

class Base64 {
  static const String HMAC_SHA1 = "HmacSHA1";

  /*
  * Base64加密
  */
  static String encodeBase64(String data) {
    var content = utf8.encode(data);
    var digest = base64Encode(content);
    return digest;
  }

  /*
  * Base64加密
  */
  static String encodeBase64ForBytes(List<int> data) {
    var digest = base64Encode(data);
    return digest;
  }

  /*
  * Base64解密
  */
  static String decodeBase64(String data) {
    return String.fromCharCodes(base64Decode(data));
  }

  /*
  * HMAC加密
  */
  static String encryptHMAC(String data, String key) {
    var _key = utf8.encode(key);
    var bytes = utf8.encode(data);

    var hmacSha256 = new Hmac(sha1, _key); // HMAC-SHA256
    var digest = hmacSha256.convert(bytes);
    String content = encodeBase64ForBytes(digest.bytes);
    return content;
  }
}

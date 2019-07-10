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
  * Base64解密
  */
  static String decodeBase64(String data) {
    return String.fromCharCodes(base64Decode(data));
  }

  /*
  * HMAC加密
  */
  static String encryptHMAC(String data) {
    var key = utf8.encode(HMAC_SHA1);
    var bytes = utf8.encode(data);
    var hmacSha1 = new Hmac(sha1, key); // HMAC-SHA256
    String digest = hmacSha1.convert(bytes).toString();
    return digest;
  }
}

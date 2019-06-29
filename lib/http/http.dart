import 'package:dio/dio.dart';

var dio = new Dio();

BaseOptions mBooheeOptions = new BaseOptions(
//  baseUrl: "https://one.iboohee.cn",
  baseUrl: "https://one.boohee.com",
  connectTimeout: 30 * 1000,
  receiveTimeout: 30 * 1000,
);

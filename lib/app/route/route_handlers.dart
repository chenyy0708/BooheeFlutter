/*
 * fluro
 * Created by Yakka
 * https://theyakka.com
 * 
 * Copyright (c) 2019 Yakka, LLC. All rights reserved.
 * See LICENSE for distribution and usage details.
 */
import 'package:boohee_flutter/views/common/browser_page.dart';
import 'package:boohee_flutter/views/common/wallpaper_page.dart';
import 'package:boohee_flutter/views/login/login_page.dart';
import 'package:boohee_flutter/views/main_page.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

var rootHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return new MainPage();
});

var loginHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return new LoginPage();
});

var webViewHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  String param = params["web_url"]?.first;
  return new BrowserPage(
    webViewUrl: param,
  );
});

var wallPaperHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  String param = params["image_url"]?.first;
  return new WallPaperPage(
    wallPaperImageUrl: param,
  );
});

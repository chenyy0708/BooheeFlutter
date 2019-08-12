/*
 * fluro
 * Created by Yakka
 * https://theyakka.com
 * 
 * Copyright (c) 2019 Yakka, LLC. All rights reserved.
 * See LICENSE for distribution and usage details.
 */
import 'package:fluro/fluro.dart';

import './route_handlers.dart';

class Routes {
  static String root = "/home";
  static String login = "/login";
  static String webView = "/browserweb";

  static void configureRoutes(Router router) {
    router.define(root, handler: rootHandler);
    router.define(login, handler: loginHandler);
    router.define(webView, handler: webViewHandler);
  }
}

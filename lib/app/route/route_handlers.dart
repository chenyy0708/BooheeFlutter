/*
 * fluro
 * Created by Yakka
 * https://theyakka.com
 * 
 * Copyright (c) 2019 Yakka, LLC. All rights reserved.
 * See LICENSE for distribution and usage details.
 */
import 'package:boohee_flutter/views/NewRoute.dart';
import 'package:boohee_flutter/views/route_component.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

var rootHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return new RouteComponent();
});

var loginHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return new NewRoute();
});

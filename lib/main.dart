import 'package:boohee_flutter/views/route_component.dart';
import 'package:flutter/material.dart';

import 'http/http.dart';

void main() {
  _init();
  runApp(RouteComponent());
}

void _init() {
  dio.options = mBooheeOptions;
}


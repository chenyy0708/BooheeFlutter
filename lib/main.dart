import 'package:boohee_flutter/views/route_component.dart';
import 'package:flutter/material.dart';

import 'http/http.dart';

void main() {
  dio.options = mBooheeOptions;
  runApp(RouteComponent());
}


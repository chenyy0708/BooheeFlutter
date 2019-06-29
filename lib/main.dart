import 'package:boohee_flutter/views/MainPage.dart';
import 'package:flutter/material.dart';

import 'http/http.dart';

void main() {
  dio.options = mBooheeOptions;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainPage(),
    );
  }
}

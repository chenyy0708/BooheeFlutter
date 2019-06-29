import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class NetPage_1 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _NetPage_1State();
}

class _NetPage_1State extends State<NetPage_1> {
  String content = "";
  Response response;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[Text("宝贝我爱你~")],
        ),
      ),
      floatingActionButton:
          FloatingActionButton(child: Text("获取"), onPressed: () {}),
    );
  }
}

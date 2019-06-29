import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class NetPage_4 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _NetPage_4State();
}

class _NetPage_4State extends State<NetPage_4> {
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
          children: <Widget>[Text("Page4：$content")],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: Text("获取"),
          onPressed: () {
          }),
    );
  }


}
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class NetPage_2 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _NetPage_2State();
}

class _NetPage_2State extends State<NetPage_2> {
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
          children: <Widget>[Text("Page2：$content")],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: Text("获取"),
          onPressed: () {
          }),
    );
  }

}

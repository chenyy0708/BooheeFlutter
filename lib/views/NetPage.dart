import 'package:boohee_flutter/http/http.dart';
import 'package:boohee_flutter/model/gank_entriy.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class NetPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _NetPageState();
}

class _NetPageState extends State<NetPage> {
  String content = "";
  Response response;

  @override
  void initState() {
    super.initState();
    getHttp();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[Text("网络返回数据：$content")],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: Text("获取"),
          onPressed: () {
            getHttp();
          }),
    );
  }

  void getHttp() async {
    try {
      response = await dio.get("http://gank.io/api/data/Android/10/1");
      print(response);
      GankEntriy gank = GankEntriy.fromJson(response.data);
      content = gank.results[0].desc;
      print(gank.toString());
    } catch (e) {
      print(e);
    }
    setState(() {});
  }
}
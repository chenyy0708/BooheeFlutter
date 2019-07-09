import 'package:boohee_flutter/app/route/fluro_navigator.dart';
import 'package:boohee_flutter/app/route/routes.dart';
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          FloatingActionButton(
            heroTag: "home",
            child: Text("open new route"),
            onPressed: () {
              NavigatorUtils.push(context, Routes.login);
            },
          ),
        ],
      ),
    );
  }
}

import 'package:boohee_flutter/app/route/fluro_navigator.dart';
import 'package:boohee_flutter/utils/base64_utils.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';

/// 壁纸
class WallPaperPage extends StatefulWidget {
  final String wallPaperImageUrl;

  WallPaperPage({this.wallPaperImageUrl});

  @override
  _WallPaperPageState createState() => _WallPaperPageState(wallPaperImageUrl);
}

class _WallPaperPageState extends State<WallPaperPage> {
  String wallPaperImageUrl;

  _WallPaperPageState(String wallPaperImageUrl) {
    this.wallPaperImageUrl =
        Base64.decodeBase64(wallPaperImageUrl.replaceAll("Chen*boohee", "/"));
  }

  double _top;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black,
        height: double.infinity,
        width: double.infinity,
        child: GestureDetector(
          child: ExtendedImage.network(
            wallPaperImageUrl,
            fit: BoxFit.cover,
          ),
          //垂直方向拖动事件
          onVerticalDragUpdate: (DragUpdateDetails details) {
            _top += details.delta.dy;
          },
          onVerticalDragDown: (DragDownDetails details) {
            _top = 0;
          },
          onVerticalDragEnd: (DragEndDetails details) {
            if (details.velocity.pixelsPerSecond.dy < 0 && _top <= -200) {
              // 向上滑
              NavigatorUtils.goBack(context);
            }
            // 重置滑动值
            _top = 0;
          },
        ),
      ),
    );
  }
}

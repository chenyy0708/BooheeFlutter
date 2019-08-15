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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black,
        height: double.infinity,
        width: double.infinity,
        child: ExtendedImage.network(
          wallPaperImageUrl,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}

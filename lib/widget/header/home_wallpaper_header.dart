import 'package:extended_image/extended_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/painting/basic_types.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

class WallPaperHeader extends Header {
  final Key key;
  final double displacement;
  final String wallPaperUrl;

  WallPaperHeader({
    this.key,
    this.displacement = 100.0,
    this.wallPaperUrl,
    bool enableHapticFeedback = false,
  }) : super(
          float: true,
          extent: 100,
          triggerDistance: 40.0,
          enableInfiniteRefresh: false,
          enableHapticFeedback: enableHapticFeedback,
        );

  @override
  Widget contentBuilder(
      BuildContext context,
      RefreshMode refreshState,
      double pulledExtent,
      double refreshTriggerPullDistance,
      double refreshIndicatorExtent,
      AxisDirection axisDirection,
      bool float,
      Duration completeDuration,
      bool enableInfiniteRefresh,
      bool success,
      bool noMore) {
    return ExtendedImage.network(
      wallPaperUrl,
      fit: BoxFit.contain,
    );
  }
}

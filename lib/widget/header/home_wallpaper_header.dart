import 'package:extended_image/extended_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/painting/basic_types.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

class WallPaperHeader extends Header {
  final Key key;
  final String wallPaperUrl;

  final LinkHeaderNotifier linkNotifier = LinkHeaderNotifier();

  WallPaperHeader({
    this.key,
    this.wallPaperUrl,
    bool enableHapticFeedback = false,
  }) : super(
          extent: 120,
          triggerDistance: 120,
          float: false,
          enableHapticFeedback: enableHapticFeedback,
          enableInfiniteRefresh: false,
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
    linkNotifier.contentBuilder(
        context,
        refreshState,
        pulledExtent,
        refreshTriggerPullDistance,
        refreshIndicatorExtent,
        axisDirection,
        float,
        completeDuration,
        enableInfiniteRefresh,
        success,
        noMore);

    return WallPaperHeaderPage(
      wallPaperUrl: wallPaperUrl,
      linkNotifier: linkNotifier,
      key: key,
    );
  }
}

class WallPaperHeaderPage extends StatefulWidget {
  final String wallPaperUrl;
  final LinkHeaderNotifier linkNotifier;

  WallPaperHeaderPage({this.wallPaperUrl, Key key, this.linkNotifier})
      : super(key: key);

  @override
  _WallPaperHeaderPageState createState() => _WallPaperHeaderPageState();
}

class _WallPaperHeaderPageState extends State<WallPaperHeaderPage> {
  RefreshMode get _refreshState => widget.linkNotifier.refreshState;

  double get _pulledExtent => widget.linkNotifier.pulledExtent;

  double get _indicatorExtent => widget.linkNotifier.refreshIndicatorExtent;

  @override
  Widget build(BuildContext context) {
    return ExtendedImage.network(
      widget.wallPaperUrl,
      fit: BoxFit.fitWidth,
    );
  }
}

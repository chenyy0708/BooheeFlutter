import 'package:banner/banner.dart';
import 'package:boohee_flutter/common/colors.dart';
import 'package:boohee_flutter/model/discover/sub_discover.dart';
import 'package:boohee_flutter/utils/repository_utils.dart';
import 'package:boohee_flutter/utils/screen_util.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_easyrefresh/material_header.dart';

class DiscoverChildPage extends StatefulWidget {
  @override
  _DiscoverChildPageState createState() => _DiscoverChildPageState();
}

class _DiscoverChildPageState extends State<DiscoverChildPage> {
  EasyRefreshController _controller = EasyRefreshController();
  SubDiscover _subDiscover;

  @override
  void initState() {
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return EasyRefresh.custom(
      slivers: <Widget>[createBannerView()],
      header: MaterialHeader(
        valueColor: AlwaysStoppedAnimation(mainColor),
      ),
      enableControlFinishRefresh: true,
      controller: _controller,
      onRefresh: () async {
        _controller.finishRefresh();
      },
    );
  }

  // 轮播图
  Widget createBannerView() {
    return SliverToBoxAdapter(
      child: BannerView(
        height: ScreenUtil.getScreenW(context) * (250 / 750 * 1.0).toDouble(),
        // 轮播图
        data: _subDiscover != null ? _subDiscover.banners : [],
        buildShowView: (index, data) {
          return createBannerChildView(data as Banners);
        },
        onBannerClickListener: (index, data) {},
      ),
    );
  }

  void loadData() {
    Repository.loadAsset("discover_sub", fileDir: "discover").then((response) {
      _subDiscover = SubDiscover.fromJson(Repository.toMap(response));
      print("");
    });
  }

  Widget createBannerChildView(Banners data) {
    return Container(
      margin: EdgeInsets.only(top: 13.0, left: 17, right: 17),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: ExtendedNetworkImageProvider(data.picUrl, cache: true),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(12.0),
        ),
      ),
    );
  }
}

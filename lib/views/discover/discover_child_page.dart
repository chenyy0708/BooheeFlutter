import 'package:banner/banner.dart';
import 'package:boohee_flutter/common/colors.dart';
import 'package:boohee_flutter/model/discover/sub_discover.dart';
import 'package:boohee_flutter/res/styles.dart';
import 'package:boohee_flutter/utils/repository_utils.dart';
import 'package:boohee_flutter/utils/screen_util.dart';
import 'package:boohee_flutter/widget/top_bottom_widget.dart';
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

  /// tab、列表集合合集
  var mList = [];

  @override
  void initState() {
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return EasyRefresh.custom(
      slivers: <Widget>[
        createBannerView(),
        SliverList(
            delegate:
                SliverChildBuilderDelegate((BuildContext context, int index) {
          Widget widget;
          if (mList[index] is List<Labels>) {
            var list = (mList[index] as List<Labels>);

            /// tab
            widget = createTabView(list);
          } else if (mList[index] is Sections) {
            /// 列表
            widget = createListChild(mList[index] as Sections);
          }
          return widget;
        }, childCount: mList.length))
      ],
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

  Widget createBannerView() {
    return SliverToBoxAdapter(
      child: BannerView(
        height: ScreenUtil.getScreenW(context) * (250 / 750 * 1.0).toDouble(),
        data: _subDiscover != null ? _subDiscover.banners : [],
        buildShowView: (index, data) {
          return createBannerChildView(data as Banners);
        },
        onBannerClickListener: (index, data) {},
      ),
    );
  }

  /// 发现页数据 banner、tab、列表数据
  void loadData() {
    Repository.loadAsset("discover_sub", fileDir: "discover").then((response) {
      _subDiscover = SubDiscover.fromJson(Repository.toMap(response));
      mList.add(_subDiscover.labels);
      mList.addAll(_subDiscover.sections);
      setState(() {});
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

  /// Tab
  Widget createTabView(List<Labels> list) {
    return Container(
      padding: EdgeInsets.only(top: 20),
      height: 80,
      child: GridView.builder(
          physics: NeverScrollableScrollPhysics(), // 禁用GradView滚动事件
          itemCount: list.length,
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
          itemBuilder: (BuildContext context, int index) {
            return TopBottom(
              margin: 5,
              top: ExtendedImage.network(
                list[index].picUrl,
                enableLoadState: false,
                height: 34,
                width: 34,
              ),
              bottom: Text(
                list[index].title,
                style: TextStyles.get12Text_373D52(),
              ),
            );
          }),
    );
  }

  /// 列表
  Widget createListChild(Sections sections) {
    return Container(
      height: 180,
      margin: EdgeInsets.only(top: 33),
      padding: EdgeInsets.only(left: 17),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            sections.name,
            style: TextStyles.get15TextBold_373D52(),
          ),
          ExtendedImage.network(
            (sections.subContents[0].imgUrl),
            height: 92,
            width: 144,
          )
        ],
      ),
    );
  }
}

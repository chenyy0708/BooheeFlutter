import 'package:banner_view/banner_view.dart';
import 'package:boohee_flutter/common/colors.dart';
import 'package:boohee_flutter/model/discover/sub_discover.dart';
import 'package:boohee_flutter/res/styles.dart';
import 'package:boohee_flutter/utils/repository_utils.dart';
import 'package:boohee_flutter/widget/top_bottom_widget.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flustars/flustars.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
      controller: _controller,
      onRefresh: () async {
        loadData();
        _controller.finishRefresh();
        setState(() {});
      },
    );
  }

  Widget createBannerView() {
    return SliverToBoxAdapter(
      child: Container(
        height: ScreenUtil.getScreenW(context) * (250 / 750 * 1.0).toDouble(),
        child: BannerView(
          _subDiscover.banners
              .map((bean) => (createBannerChildView(bean)))
              .toList(),
          intervalDuration: Duration(seconds: 3),
          indicatorMargin: 5,
          indicatorNormal: new Container(
            width: 8.0,
            height: 5.0,
            decoration: new BoxDecoration(
              color: Colors.white,
              shape: BoxShape.rectangle,
              borderRadius: new BorderRadius.all(
                new Radius.circular(20.0),
              ),
            ),
          ),
          indicatorSelected: new Container(
            width: 15.0,
            height: 5.0,
            decoration: new BoxDecoration(
              color: Color(0xFFEEEFF3),
              shape: BoxShape.rectangle,
              borderRadius: new BorderRadius.all(
                new Radius.circular(20.0),
              ),
            ),
          ),
          indicatorBuilder: (context, indicator) {
            Widget cc = new Container(
              margin: EdgeInsets.only(bottom: 8),
              alignment: Alignment.bottomCenter,
              height: double.infinity,
              child: indicator,
            );
            return cc;
          },
        ),
      ),
    );
  }

  /// 发现页数据 banner、tab、列表数据
  void loadData() {
    Repository.loadAsset("discover_sub", fileDir: "discover").then((response) {
      _subDiscover = SubDiscover.fromJson(Repository.toMap(response));
      mList.clear();
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
      child: GridView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          // 禁用GradView滚动事件
          itemCount: list.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, childAspectRatio: 2.2),
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
      height: 172,
      margin: EdgeInsets.only(top: 33),
      padding: EdgeInsets.only(left: 17),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            sections.name,
            style: TextStyles.get15TextBold_373D52(),
          ),
          _getHorizontalListView(sections.subContents)
        ],
      ),
    );
  }

  /// 横向列表
  Widget _getHorizontalListView(List<Sub_contents> subContents) {
    var horizontalList = ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(right: 11, top: 14, bottom: 10),
                height: 92,
                width: 144,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: ExtendedNetworkImageProvider(
                        subContents[index].imgUrl,
                        cache: true),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(12.0),
                  ),
                ),
              ),
              Text(
                subContents[index].title,
                style: TextStyle(fontSize: 13, color: color373D52),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              SizeBoxFactory.getVerticalSizeBox(1),
              Text(
                subContents[index].subTitle,
                style: TextStyle(fontSize: 11, color: colorA8ACBC),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              )
            ],
          );
        },
        itemCount: subContents.length);

    return Expanded(
        child: Container(width: double.infinity, child: horizontalList));
  }
}

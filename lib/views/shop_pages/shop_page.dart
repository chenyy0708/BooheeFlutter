import 'package:banner_view/banner_view.dart';
import 'package:boohee_flutter/common/colors.dart';
import 'package:boohee_flutter/model/ShopBanner.dart';
import 'package:boohee_flutter/model/ShopRecommendList.dart';
import 'package:boohee_flutter/utils/repository_utils.dart';
import 'package:boohee_flutter/utils/screen_util.dart';
import 'package:boohee_flutter/widget/card_view.dart';
import 'package:boohee_flutter/widget/common_search_bar.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_easyrefresh/material_header.dart';

class ShopPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  List<Banner_showcases> _bannerList = [];
  List<Categories> _categoriseList = [];
  List<Goods> _goodsList = [];
  double bannerHeight = 200;
  EasyRefreshController _controller = EasyRefreshController();

  /// 加载数据
  void loadData() {
    /// 商店Banner
    Repository.loadAsset("shop_banner", fileDir: "shop").then((json) {
      _categoriseList.clear();
      ShopBanner data = ShopBanner.fromJson(Repository.toMap(json));
      _bannerList = data.bannerShowcases;
      // 保证数据最多为10条
      data.categories.forEach((it) {
        // 默认第一个分类
        if (data.categories.indexOf(it) < 10) {
          _categoriseList.add(it);
        }
      });
      // 计算Banner的高度
      double screenWidth = MediaQuery.of(context).size.width;
      if (_bannerList.length > 0) {
        bannerHeight = (screenWidth - 2 * 17) *
            (_bannerList[0].defaultPhotoHeight /
                _bannerList[0].defaultPhotoWidth);
      }
      _controller.finishRefresh();
      setState(() {});
    });

    /// 商店推荐商品
    Repository.loadAsset("shop_recommend_list", fileDir: "shop").then((json) {
      ShopRecommendList data =
          ShopRecommendList.fromJson(Repository.toMap(json));
      _goodsList.clear();
      _goodsList.addAll(data.goods);
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: SearchBar(
          isShowCartIcon: true,
          text: "商店搜索",
        ),
        body: EasyRefresh.custom(
          slivers: <Widget>[
            createBannerView(),
            createCategoryGridView(),
            createGoodsGridView(),
          ],
          header: MaterialHeader(
            valueColor: AlwaysStoppedAnimation(mainColor),
          ),
          taskIndependence: true,
          enableControlFinishRefresh: true,
          firstRefresh: true,
          controller: _controller,
          onRefresh: () async {
            loadData();
          },
        ));
  }

  Widget createBannerView() {
    return SliverToBoxAdapter(
      child: Container(
        height: ScreenUtil.getScreenW(context) * (250 / 750 * 1.0).toDouble(),
        child: BannerView(
          _bannerList
              .map((bean) => (createBannerChildView(bean as Banner_showcases)))
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

  Widget createBannerChildView(Banner_showcases data) {
    return Container(
      margin: EdgeInsets.only(top: 13.0, left: 17, right: 17),
      decoration: BoxDecoration(
        image: DecorationImage(
          image:
              ExtendedNetworkImageProvider(data.defaultPhotoUrl, cache: true),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(12.0),
        ),
      ),
    );
  }

  // 分类
  Widget createCategoryGridView() {
    return SliverToBoxAdapter(
      child: Container(
        height: 162, // 指定卡片大小
        child: CardView(
          margin: EdgeInsets.only(left: 17, right: 17, top: 13),
          child: Padding(
            padding: EdgeInsets.only(top: 13, left: 10, right: 10),
            child: GridView.builder(
                physics: NeverScrollableScrollPhysics(), // 禁用GradView滚动事件
                itemCount: _categoriseList.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 5, childAspectRatio: 1.0),
                itemBuilder: (BuildContext context, int index) {
                  return getCategoryItemContainer(_categoriseList[index]);
                }),
          ),
        ),
      ),
    );
  }

  Widget getCategoryItemContainer(Categories item) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        ExtendedImage.network(
          item.iconUrl,
          width: 35,
          cache: true,
          height: 35,
        ),
        Text(
          item.name,
          style: TextStyle(fontSize: 12, color: color373D52),
        ),
      ],
    );
  }

  Widget createGoodsGridView() {
    return SliverPadding(
      padding: EdgeInsets.only(top: 13.0, bottom: 13, left: 17.0, right: 17),
      sliver: SliverGrid(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 8,
              childAspectRatio: 0.65),
          delegate: new SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return getGoodsItemContainer(_goodsList[index]);
            },
            childCount: _goodsList.length,
          )),
    );
  }

  Widget getGoodsItemContainer(Goods item) {
    return CardView(
      margin: EdgeInsets.all(0.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
              child: Container(
            height: 165,
            decoration: BoxDecoration(
              image: DecorationImage(
                image:
                    ExtendedNetworkImageProvider(item.bigPhotoUrl, cache: true),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10.0),
                  topRight: Radius.circular(10.0)),
            ),
          )),
          Padding(
            padding: EdgeInsets.only(left: 10, right: 10, top: 8),
            child: Text(
              item.title.split("｜")[0] ?? "",
              style: TextStyle(fontSize: 13, color: color373D52),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 10, right: 10, top: 1),
            child: Text(
              item.title.split("｜").length > 1 ? item.title.split("｜")[1] : "",
              style: TextStyle(fontSize: 11, color: colorA8ACBC),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 10, right: 10, top: 12, bottom: 12),
            child: Row(
              children: <Widget>[
                Text(
                  "¥" + item.basePrice.toString(),
                  style: TextStyle(fontSize: 11, color: colorFF6C65),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 8),
                  child: Text(
                    "¥" + item.marketPrice.toString(),
                    style: TextStyle(
                        fontSize: 11,
                        color: colorA8ACBC,
                        decoration: TextDecoration.lineThrough),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

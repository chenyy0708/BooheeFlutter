import 'package:banner/banner.dart';
import 'package:boohee_flutter/http/http.dart';
import 'package:boohee_flutter/http/request_url.dart';
import 'package:boohee_flutter/model/ShopBanner.dart';
import 'package:boohee_flutter/model/ShopRecommendList.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_easyrefresh/material_footer.dart';
import 'package:flutter_easyrefresh/material_header.dart';

class ShopPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  String content = "";
  Response response;

  @override
  void initState() {
    super.initState();
    loadData();
  }

  List<Banner_showcases> _bannerList = [];
  List<Categories> _categoriseList = [];
  List<Goods> _goodsList = [];

  GlobalKey<RefreshHeaderState> _headerKey =
      new GlobalKey<RefreshHeaderState>();
  GlobalKey<RefreshFooterState> _footerKey =
      new GlobalKey<RefreshFooterState>();

  @override
  Widget build(BuildContext context) {
    return EasyRefresh(
      refreshHeader: MaterialHeader(
        key: _headerKey,
      ),
      refreshFooter: MaterialFooter(
        key: _footerKey,
      ),
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            initBannerView(),
            initCategoryView(),
            initGoodsView(),
          ],
        ),
      ),
      onRefresh: () async {},
      loadMore: () async {},
    );
  }

  Widget initBannerView() {
    return BannerView(
      // 轮播图
      data: _bannerList,
      buildShowView: (index, data) {
        return initBannerChildView(data as Banner_showcases);
      },
      onBannerClickListener: (index, data) {},
    );
  }

  // 轮播View
  Widget initBannerChildView(Banner_showcases data) {
    return Container(
      margin: EdgeInsets.only(top: 13.0, left: 17, right: 17),
      height: 200,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(data.defaultPhotoUrl),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(12.0),
        ),
      ),
    );
  }

  // 分类卡片
  Widget initCategoryView() {
    return Container(
      margin: EdgeInsets.only(top: 13.0, bottom: 13, left: 17.0, right: 17),
      constraints: BoxConstraints.tightFor(height: 162.0),
      decoration: BoxDecoration(
          //背景装饰
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              // 阴影
              color: Color(0xFF8C95B7),
            )
          ],
          borderRadius: BorderRadius.circular(12.0)),
      child: initCategoryGridView(),
    );
  }

  // 分类
  Widget initCategoryGridView() {
    return GridView.builder(
        itemCount: _categoriseList.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 5, childAspectRatio: 1.0),
        itemBuilder: (BuildContext context, int index) {
          return getCategoryItemContainer(_categoriseList[index]);
        });
  }

  Widget getCategoryItemContainer(Categories item) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Image.network(
          item.iconUrl,
          width: 35,
          height: 35,
        ),
        Text(
          item.name,
        )
      ],
    );
  }

  Widget initGoodsView() {
    return Container(
      margin: EdgeInsets.only(top: 13.0, bottom: 13, left: 17.0, right: 17),
      constraints: BoxConstraints.tightFor(height: 162.0),
      child: createGoodsGridView(),
    );
  }

  Widget createGoodsGridView() {
    return GridView.builder(
        itemCount: _goodsList.length,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) {
          return getGoodsItemContainer(_goodsList[index]);
        });
  }

  Widget getGoodsItemContainer(Goods item) {
    return Container(
      decoration: BoxDecoration(
          //背景装饰
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              // 阴影
              color: Color(0xFF8C95B7),
            )
          ],
          borderRadius: BorderRadius.circular(10.0)),
      child: Column(
        children: <Widget>[
          Container(
            height: 165,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(item.bigPhotoUrl),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(10.0),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void loadData() {
    getBanner();
    getRecommendList();
  }

  // 获取banner数据
  void getBanner() {
    dio.get(shop_banner).then((response) {
      ShopBanner data = ShopBanner.fromJson(response.data);
      _bannerList = ShopBanner.fromJson(response.data).bannerShowcases;
      // 保证数据最多为10条
      data.categories.forEach((it) {
        if (data.categories.indexOf(it) < 10) {
          _categoriseList.add(it);
        }
      });
      setState(() {});
    });
  }

  // 商店推荐列表
  void getRecommendList() {
    dio.get(shop_recommend_list + "9", queryParameters: {"page": 1}).then(
        (response) {
      ShopRecommendList data = ShopRecommendList.fromJson(response.data);
      _goodsList = data.goods;
    });
    setState(() {});
  }
}

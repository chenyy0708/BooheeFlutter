import 'package:banner/banner.dart';
import 'package:boohee_flutter/common/Colors.dart';
import 'package:boohee_flutter/http/http.dart';
import 'package:boohee_flutter/http/request_url.dart';
import 'package:boohee_flutter/model/ShopBanner.dart';
import 'package:boohee_flutter/model/ShopRecommendList.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_easyrefresh/material_footer.dart';
import 'package:flutter_easyrefresh/material_header.dart';

class ShopPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  List<Banner_showcases> _bannerList = [];
  List<Categories> _categoriseList = [];
  List<Goods> _goodsList = [];

  int page = 1;

  GlobalKey<RefreshHeaderState> _headerKey =
      new GlobalKey<RefreshHeaderState>();
  GlobalKey<RefreshFooterState> _footerKey =
      new GlobalKey<RefreshFooterState>();

  @override
  void initState() {
    super.initState();
    loadData();
  }

  void loadData() {
    getBanner();
    getRecommendList(page);
  }

  // 获取banner数据
  void getBanner() {
    dio.get(shop_banner).then((response) {
      if (page == 1) _categoriseList.clear();
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
  void getRecommendList(int page) {
    dio.get(shop_recommend_list + "9", queryParameters: {"page": page}).then(
        (response) {
      ShopRecommendList data = ShopRecommendList.fromJson(response.data);
      if (page == 1) _goodsList.clear();
      _goodsList.addAll(data.goods);
    });
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return EasyRefresh(
      refreshHeader: MaterialHeader(
        key: _headerKey,
      ),
      refreshFooter: MaterialFooter(
        key: _footerKey,
      ),
      child: CustomScrollView(
        slivers: <Widget>[
          createBannerView(),
          createCategoryGridView(),
          createGoodsGridView(),
        ],
      ),
      onRefresh: () {
        print("下拉刷新");
        page = 1;
        loadData();
      },
      loadMore: () {
        print("上拉加载");
        page++;
        getRecommendList(page);
      },
    );
  }

  // 轮播图
  Widget createBannerView() {
    return SliverToBoxAdapter(
      child: BannerView(
        // 轮播图
        data: _bannerList,
        buildShowView: (index, data) {
          return createBannerChildView(data as Banner_showcases);
        },
        onBannerClickListener: (index, data) {},
      ),
    );
  }

  Widget createBannerChildView(Banner_showcases data) {
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

  // 分类
  Widget createCategoryGridView() {
    return SliverPadding(
      padding: EdgeInsets.only(top: 13.0, left: 17.0, right: 17),
      sliver: SliverGrid(
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 5),
          delegate: new SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return getCategoryItemContainer(_categoriseList[index]);
            },
            childCount: _categoriseList.length,
          )),
    );
  }

  Widget getCategoryItemContainer(Categories item) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Image.network(
          item.iconUrl,
          width: 35,
          height: 35,
        ),
        Text(
          item.name,
          style: TextStyle(fontSize: 12, color: color_373D52),
        ),
      ],
    );
  }

  Widget createGoodsGridView() {
    return SliverPadding(
      padding: EdgeInsets.only(top: 13.0, bottom: 13, left: 17.0, right: 17),
      sliver: SliverGrid(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, mainAxisSpacing: 7.5, crossAxisSpacing: 5.5),
          delegate: new SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return getGoodsItemContainer(_goodsList[index]);
            },
            childCount: _goodsList.length,
          )),
    );
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
}

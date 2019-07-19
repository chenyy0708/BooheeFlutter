import 'package:boohee_flutter/common/colors.dart';
import 'package:boohee_flutter/common/constant.dart';
import 'package:boohee_flutter/http/http.dart';
import 'package:boohee_flutter/http/request_url.dart';
import 'package:boohee_flutter/model/home_tools.dart';
import 'package:boohee_flutter/utils/screen_util.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // 顶部卡片
  List<Data> topCards = List();
  List<String> topCardItems = [
    HomeCard.DIET_SPORT_RECORD,
    HomeCard.WISDOM,
    HomeCard.HEALTH_HABITS,
    HomeCard.WEIGHT_RECORD,
  ];

  @override
  void initState() {
    super.initState();
    loadData();
  }

  void loadData() {
    dio
        .get(RequestUrl.getBaseUrl(RequestUrl.bingo,
            url: HomeRequestUrl.home_tools))
        .then((response) {
      HomeTools homeTools = HomeTools.fromJson(response.data);
      topCards = homeTools.data
          .where((item) => item.visible && topCardItems.contains(item.code))
          .toList();
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        CustomScrollView(
          slivers: <Widget>[
            SliverToBoxAdapter(
              child: Image.network(
                "http://up.boohee.cn//house//u//one//wallpaper//1661_big.jpg",
                height: 181,
                fit: BoxFit.fitWidth,
              ),
            ),
            SliverList(
                delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
              Widget widget;
              if (topCards[index].code == HomeCard.DIET_SPORT_RECORD) {
                widget = createDietSportRecord();
              } else if (topCards[index].code == HomeCard.WISDOM) {
                widget = createWisdom();
              } else if (topCards[index].code == HomeCard.WEIGHT_RECORD) {
                widget = createWeightRecord();
              } else if (topCards[index].code == HomeCard.HEALTH_HABITS) {
                widget = createHealthHabits();
              }
              return widget;
            }, childCount: topCards.length)),
          ],
        ),
        Container(
          margin: EdgeInsets.only(top: 50, left: 17, right: 17),
          height: ScreenUtil.getInstance().getAdapterSize(34),
          child: AppBar(
            backgroundColor: mainColor,
            title: Text("首页"),
          ),
        )
      ],
    );
  }

  // 饮食运动记录
  Widget createDietSportRecord() {
    return Card(
      shape: // 圆角
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      margin: EdgeInsets.only(left: 17, right: 17, top: 13),
      elevation: 2,
      child: Padding(
        padding: EdgeInsets.only(top: 13, left: 10, right: 10),
        child: Container(
          height: 111,
          alignment: Alignment.center,
          child: Text(
            "饮食&运动记录",
          ),
        ),
      ),
    );
  }

  // 智慧营养师
  Widget createWisdom() {
    return Card(
      shape: // 圆角
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      margin: EdgeInsets.only(left: 17, right: 17, top: 13),
      elevation: 2,
      child: Padding(
        padding: EdgeInsets.only(top: 13, left: 10, right: 10),
        child: Container(
          height: 93,
          alignment: Alignment.center,
          child: Text(
            "智慧营养师",
          ),
        ),
      ),
    );
  }

  // 体重记录
  Widget createWeightRecord() {
    return Card(
      shape: // 圆角
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      margin: EdgeInsets.only(left: 17, right: 17, top: 13),
      elevation: 2,
      child: Padding(
        padding: EdgeInsets.only(top: 13, left: 10, right: 10),
        child: Container(
          height: 111,
          alignment: Alignment.center,
          child: Text(
            "体重记录",
          ),
        ),
      ),
    );
  }

  // 健康习惯
  Widget createHealthHabits() {
    return Card(
      shape: // 圆角
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      margin: EdgeInsets.only(left: 17, right: 17, top: 13),
      elevation: 2,
      child: Padding(
        padding: EdgeInsets.only(top: 13, left: 10, right: 10),
        child: Container(
          height: 61,
          alignment: Alignment.center,
          child: Text(
            "健康习惯",
          ),
        ),
      ),
    );
  }
}

import 'package:boohee_flutter/common/colors.dart';
import 'package:boohee_flutter/common/constant.dart';
import 'package:boohee_flutter/http/http.dart';
import 'package:boohee_flutter/http/request_url.dart';
import 'package:boohee_flutter/model/home_tools.dart';
import 'package:boohee_flutter/res/styles.dart';
import 'package:boohee_flutter/utils/utils.dart';
import 'package:flutter/material.dart';

typedef onTabClickListener = void Function();

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
                widget = createDietSportRecord(topCards[index]);
              } else if (topCards[index].code == HomeCard.WISDOM) {
                widget = createWisdom(topCards[index]);
              } else if (topCards[index].code == HomeCard.WEIGHT_RECORD) {
                widget = createWeightRecord(topCards[index]);
              } else if (topCards[index].code == HomeCard.HEALTH_HABITS) {
                widget = createCommonCard("ic_home_habit", "健康习惯");
              }
              return widget;
            }, childCount: topCards.length)),
          ],
        ),
        Container(
          margin: EdgeInsets.only(top: 50, left: 17, right: 17),
          height: 34,
          child: AppBar(
            backgroundColor: mainColor,
            title: Text("首页"),
          ),
        )
      ],
    );
  }

  // 饮食运动记录
  Widget createDietSportRecord([Data topCard]) {
    return Card(
      shape: // 圆角
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      margin: EdgeInsets.only(left: 17, right: 17, top: 13),
      elevation: 1,
      child: Container(
        padding: EdgeInsets.only(top: 19, left: 15, right: 15, bottom: 19),
        height: 111,
        child: GestureDetector(
          onTap: () {
            print("fwefwegwerwef");
          },
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Image.asset(
                    Utils.getImgPath("ic_home_calorie"),
                    height: 18,
                    width: 18,
                  ),
                  PaddingStyles.getPadding(6),
                  Text(
                    topCard.name,
                    style: TextStyles.get14TextBold_373D52(),
                  )
                ],
              ),
              Expanded(
                  child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  PaddingStyles.getPadding(24),
                  RichText(
                    text: TextSpan(children: <TextSpan>[
                      TextSpan(
                          text: "还可以吃 ", style: TextStyles.get12TextA8ACBC()),
                      TextSpan(
                          text: "230",
                          style: TextStyles.get15TextBold_373D52()),
                      TextSpan(
                          text: " 还可以吃", style: TextStyles.get12TextA8ACBC()),
                    ]),
                  ),
                  Expanded(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Image.asset(
                          Utils.getImgPath("ic_home_chart_diet", format: "jpg"))
                    ],
                  ))
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }

  // 智慧营养师
  Widget createWisdom([Data topCard]) {
    return Card(
      shape: // 圆角
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      margin: EdgeInsets.only(left: 17, right: 17, top: 13),
      elevation: 1,
      child: Container(
        padding: EdgeInsets.only(top: 19, left: 15, right: 15, bottom: 19),
        height: 111,
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Image.asset(
                  Utils.getImgPath("ic_home_dietician"),
                  height: 18,
                  width: 18,
                ),
                PaddingStyles.getPadding(6),
                Text(
                  topCard.name,
                  style: TextStyles.get14TextBold_373D52(),
                )
              ],
            ),
            Expanded(
                child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                PaddingStyles.getPadding(24),
                Text(
                  "晚餐：米饭、番茄炒蛋、水煮鱼片",
                  style: TextStyles.get12TextA8ACBC(),
                )
              ],
            ))
          ],
        ),
      ),
    );
  }

  // 体重记录
  Widget createWeightRecord([Data topCard]) {
    return Card(
      shape: // 圆角
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      margin: EdgeInsets.only(left: 17, right: 17, top: 13),
      elevation: 1,
      child: Container(
        padding: EdgeInsets.only(top: 19, left: 15, right: 15, bottom: 19),
        height: 111,
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Image.asset(
                  Utils.getImgPath("ic_home_weight"),
                  height: 18,
                  width: 18,
                ),
                PaddingStyles.getPadding(6),
                Text(
                  topCard.name,
                  style: TextStyles.get14TextBold_373D52(),
                )
              ],
            ),
            Expanded(
                child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                PaddingStyles.getPadding(24),
                RichText(
                  text: TextSpan(children: <TextSpan>[
                    TextSpan(
                        text: "58.9 ",
                        style: TextStyles.get15TextBold_373D52()),
                    TextSpan(text: "公斤", style: TextStyles.get12TextA8ACBC()),
                  ]),
                ),
                Expanded(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Image.asset(
                      Utils.getImgPath("ic_home_chart_simple"),
                      width: 93,
                      height: 41,
                    )
                  ],
                ))
              ],
            ))
          ],
        ),
      ),
    );
  }

  // 通用的卡片布局
  Widget createCommonCard(String iconUrl, String title, {String subTitle: ""}) {
    return Card(
      shape: // 圆角
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      margin: EdgeInsets.only(left: 17, right: 17, top: 13),
      elevation: 1,
      child: Container(
        padding: EdgeInsets.only(top: 19, left: 15, right: 15, bottom: 19),
        height: 61,
        child: Row(
          children: <Widget>[
            Image.asset(
              Utils.getImgPath(iconUrl),
              height: 18,
              width: 18,
            ),
            PaddingStyles.getPadding(6),
            Text(
              title,
              style: TextStyles.get14TextBold_373D52(),
            ),
            Expanded(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                  Text(
                  subTitle,
                  style: TextStyles.get14TextBold_373D52(),
                ),
                Image.asset(
                  Utils.getImgPath("ic_arrow_grey"),
                )
              ],
            ))
          ],
        ),
      ),
    );
  }
}

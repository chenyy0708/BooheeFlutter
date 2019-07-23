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
  List<Data> bottomCards = List();
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
      bottomCards = homeTools.data
          .where((item) => item.visible && !topCardItems.contains(item.code))
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
                widget = createHealthHabits("ic_home_habit", "健康习惯");
              }
              return widget;
            }, childCount: topCards.length)),
            createToolsCards()
          ],
        ),
//        Container(
//          margin: EdgeInsets.only(top: 50, left: 17, right: 17),
//          height: 34,
//          child: AppBar(
//            backgroundColor: mainColor,
//            title: Text("首页"),
//          ),
//        )
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

  // 健康习惯
  Widget createHealthHabits(String iconUrl, String title) {
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
                RichText(
                  text: TextSpan(children: <TextSpan>[
                    TextSpan(
                        text: "今日完成: ", style: TextStyles.get11TextA8ACBC()),
                    TextSpan(text: "57%", style: TextStyles.get11Text_00CDA2()),
                  ]),
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

  // 通用的卡片布局
  Widget createCommonCard(String iconUrl, String title,
      // ignore: avoid_init_to_null
      {Widget subWidget: null}) {
    return Container(
      padding: EdgeInsets.only(top: 19, left: 15, right: 15, bottom: 19),
      height: 58,
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
              subWidget == null ? Text("") : subWidget,
              Image.asset(
                Utils.getImgPath("ic_arrow_grey"),
              )
            ],
          ))
        ],
      ),
    );
  }

  // 底部健康工具列表
  Widget createToolsCards() {
    return SliverToBoxAdapter(
      child: Container(
        margin: EdgeInsets.only(top: 13, bottom: 30),
        height: (58 * bottomCards.length).toDouble(), // 指定卡片大小
        child: Card(
          shape: // 圆角
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
          margin: EdgeInsets.only(
            left: 17,
            right: 17,
          ),
          elevation: 1,
          child: ListView.separated(
            separatorBuilder: (BuildContext context, int index) {
              return Container(
                height: 0.0,
                margin: EdgeInsetsDirectional.only(start: 16, end: 16),
                decoration: BoxDecoration(
                  border: Border(
                    bottom:
                        Divider.createBorderSide(context, color: colorEEEFF3),
                  ),
                ),
              );
            },
            padding: EdgeInsets.only(top: 0),
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              Widget widget;
              if (bottomCards[index].code == HomeCard.EXERCISE) {
                // 运动训练
                widget =
                    createCommonCard("ic_home_sport", bottomCards[index].name,
                        subWidget: RichText(
                          text: TextSpan(children: <TextSpan>[
                            TextSpan(
                                text: "35 ",
                                style: TextStyles.get11Text_00CDA2()),
                            TextSpan(
                                text: "分钟",
                                style: TextStyles.get11TextA8ACBC()),
                          ]),
                        ));
              } else if (bottomCards[index].code == HomeCard.MEASURE_RECORD) {
                // 围度记录
                widget = createCommonCard(
                    "ic_home_circumference", bottomCards[index].name);
              } else if (bottomCards[index].code == HomeCard.STEPS_RECORD) {
                // 步数记录
                widget =
                    createCommonCard("ic_home_step", bottomCards[index].name);
              } else if (bottomCards[index].code == HomeCard.BABY) {
                // 宝宝记录
                widget =
                    createCommonCard("ic_home_crd", bottomCards[index].name);
              } else if (bottomCards[index].code == HomeCard.DIET_PLAN) {
                // 饮食计划
                widget = createCommonCard(
                    "ic_home_food_plan", bottomCards[index].name);
              } else if (bottomCards[index].code == HomeCard.SLEEP_RECORD) {
                // 睡眠记录
                widget =
                    createCommonCard("ic_home_sleep", bottomCards[index].name);
              } else if (bottomCards[index].code == HomeCard.PERIODS_RECORD) {
                // 经期记录
                widget = createCommonCard(
                    "ic_home_menstruation", bottomCards[index].name);
              }
              return widget;
            },
            itemCount: bottomCards.length,
          ),
        ),
      ),
    );
  }
}

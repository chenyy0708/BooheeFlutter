import 'dart:ui';

import 'package:boohee_flutter/common/colors.dart';
import 'package:boohee_flutter/common/constant.dart';
import 'package:boohee_flutter/http/http.dart';
import 'package:boohee_flutter/http/request_url.dart';
import 'package:boohee_flutter/model/home_tools.dart';
import 'package:boohee_flutter/model/home_wall_paper.dart';
import 'package:boohee_flutter/res/styles.dart';
import 'package:boohee_flutter/utils/utils.dart';
import 'package:boohee_flutter/widget/card_view.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:rxdart/rxdart.dart';
import 'package:toast/toast.dart';

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

  // 滑动监听
  ScrollController _controller = new ScrollController();

  // 头部透明度
  int appbarAlpha = 0;
  Color appbarTitleColor = colorA8ACBC;
  Color appbarBg = Color(0x1FFFFFFF);
  String appbarLeftIcon = "ic_search_grey";
  String appbarRightIcon = "ic_message_grey";
  String homeWallPaper =
      "http://up.boohee.cn//house//u//one//wallpaper//1661_big.jpg";
  double percent = 0.0;

  @override
  void initState() {
    super.initState();
    loadData();
    //监听滚动事件，打印滚动位置
    _controller.addListener(() {
      if (_controller.offset < 100) {
        double alpha = _controller.offset / 100;
        appbarAlpha = (255 * alpha).toInt();
        appbarTitleColor = colorA8ACBC;
        appbarBg = Color(0x1FFFFFFF);
        appbarLeftIcon = "ic_search_grey";
        appbarRightIcon = "ic_message_grey";
      } else {
        appbarAlpha = 255;
        appbarLeftIcon = "ic_search_white";
        appbarRightIcon = "ic_message_white";
        appbarTitleColor = Colors.white;
        appbarBg = color0EB794;
      }
      setState(() {});
    });
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
    // 壁纸
    loadWallpaper();
    // 体重记录
    Observable.just(3).delay(new Duration(milliseconds: 3 * 1000)).listen((_) {
      percent = 0.8;
      setState(() {});
    });
  }

  // 首页壁纸
  void loadWallpaper() {
    dio
        .get(RequestUrl.getBaseUrl(RequestUrl.bingo,
            url: HomeRequestUrl.home_wallpaper))
        .then((response) {
      HomeWallPaper wallPaper = HomeWallPaper.fromJson(response.data);
      homeWallPaper = wallPaper.welcomeImg.backImgSmall;
      setState(() {});
    });
  }

  Widget createHeaderImg() {
    return Stack(children: <Widget>[
      Image.network(
        homeWallPaper,
        height: 181,
        width: double.infinity,
        fit: BoxFit.fitWidth,
      ),
      Container(
        color: Colors.black38,
        height: 181,
      ),
      CardView(
        margin: EdgeInsets.only(left: 17, right: 17, top: 104),
        child: Container(
          width: double.infinity,
          height: 156,
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(
                            top: 2, bottom: 2, right: 4, left: 4),
                        child: Text(
                          "初始(公斤)",
                          style: TextStyles.get10TextA8ACBC(),
                        ),
                      ),
                      Text(
                        "58.5",
                        style: TextStyle(
                            fontFamily: "Montserrat",
                            fontSize: 23,
                            color: color373D52),
                      ),
                    ],
                  ),
                  PaddingStyles.getPadding(30),
                  CircularPercentIndicator(
                    animation: true,
                    radius: 95.0,
                    lineWidth: 8.0,
                    percent: percent,
                    animationDuration: 800,
                    circularStrokeCap: CircularStrokeCap.round,
                    backgroundColor: Color(0xFFF5F6FA),
                    center: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "已减去(公斤)",
                          style: TextStyles.get10TextA8ACBC(),
                        ),
                        Text(
                          "3.2",
                          style: TextStyle(
                              fontSize: 28,
                              fontFamily: "Montserrat",
                              color: color373D52),
                        ),
                      ],
                    ),
                    progressColor: color00CDA2,
                  ),
                  PaddingStyles.getPadding(30),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            color: Color(0x2100cda2),
                            borderRadius: BorderRadius.circular(9),
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(
                                top: 2, bottom: 2, right: 4, left: 4),
                            child: Text(
                              "目标(公斤)",
                              style:
                                  TextStyle(fontSize: 10, color: color00CDA2),
                            ),
                          ),
                        ),
                      ),
                      Text(
                        "52.5",
                        style: TextStyle(
                            fontSize: 23,
                            fontFamily: "Montserrat",
                            color: color00CDA2),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      )
    ]);
  }

  Widget createSearchBar() {
    return Container(
      height: 104,
      color: Color.fromARGB(appbarAlpha, 0, 205, 162),
      padding: EdgeInsets.only(left: 17, right: 17, top: 42, bottom: 17),
      child: Row(
        children: <Widget>[
          Container(
            height: 40,
            width: 300,
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: appbarBg,
                borderRadius: BorderRadius.circular(17),
              ),
              child: Row(
                children: <Widget>[
                  PaddingStyles.getPadding(12),
                  Image.asset(
                    Utils.getImgPath(appbarLeftIcon),
                    width: 24,
                    height: 24,
                  ),
                  PaddingStyles.getPadding(7),
                  Text(
                    "搜索食物和热量",
                    style: TextStyle(fontSize: 14, color: appbarTitleColor),
                  )
                ],
              ),
            ),
          ),
          PaddingStyles.getPadding(14),
          Image.asset(
            Utils.getImgPath(appbarRightIcon),
            width: 24,
            height: 24,
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        CustomScrollView(
          controller: _controller,
          slivers: <Widget>[
            SliverToBoxAdapter(child: createHeaderImg()),
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
        createSearchBar()
      ],
    );
  }

  // 饮食运动记录
  Widget createDietSportRecord([Data topCard]) {
    return CardView(
      margin: EdgeInsets.only(left: 17, right: 17, top: 13),
      child: Container(
        padding: EdgeInsets.only(top: 19, left: 15, right: 15, bottom: 19),
        height: 111,
        child: GestureDetector(
          onTap: () {
            Toast.show(topCard.name, context,
                duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
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
    return CardView(
      margin: EdgeInsets.only(left: 17, right: 17, top: 13),
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
    return CardView(
      margin: EdgeInsets.only(left: 17, right: 17, top: 13),
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
    return CardView(
      margin: EdgeInsets.only(left: 17, right: 17, top: 13),
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
        child: CardView(
          margin: EdgeInsets.only(
            left: 17,
            right: 17,
          ),
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
                    createCommonCard("ic_home_baby", bottomCards[index].name);
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

  @override
  void dispose() {
    //为了避免内存泄露，需要调用_controller.dispose
    _controller.dispose();
    super.dispose();
  }
}

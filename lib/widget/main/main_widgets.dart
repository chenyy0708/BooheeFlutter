import 'dart:ui';

import 'package:boohee_flutter/app/route/fluro_navigator.dart';
import 'package:boohee_flutter/common/colors.dart';
import 'package:boohee_flutter/model/home_tools.dart';
import 'package:boohee_flutter/res/styles.dart';
import 'package:boohee_flutter/utils/browser_url.dart';
import 'package:boohee_flutter/utils/toast_utils.dart';
import 'package:boohee_flutter/utils/utils.dart';
import 'package:boohee_flutter/widget/card_view.dart';
import 'package:boohee_flutter/widget/round_button.dart';
import 'package:extended_image/extended_image.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

/// 壁纸+减肥进度条Widget
class HomeHeaderWidget extends StatelessWidget {
  final String wallImg;
  final double progressPercent;

  HomeHeaderWidget({
    this.wallImg,
    this.progressPercent: 0,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      ExtendedImage.network(
        wallImg,
        height: 181,
        width: double.infinity,
        fit: BoxFit.fitWidth,
        cache: true,
        enableLoadState: false,
      ),
      ClipRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 1.0,
            sigmaY: 1.0,
          ),
          child: Container(
            color: Colors.transparent,
            alignment: Alignment.center,
            width: double.infinity,
            height: 181,
          ),
        ),
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
                    percent: progressPercent,
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
              Positioned(
                child: RoundButton(
                  padding:
                      EdgeInsets.only(left: 12, right: 12, top: 4, bottom: 4),
                  text: "打卡",
                  onPressed: () {},
                ),
                right: 16,
                bottom: 17,
              )
            ],
          ),
        ),
      )
    ]);
  }
}

/// 饮食运动记录
class DietSportRecordWidget extends StatelessWidget {
  final Data topCard;

  DietSportRecordWidget({this.topCard});

  @override
  Widget build(BuildContext context) {
    return CardView(
      onPressed: () {
        // 饮食运动记录
        BrowserUrlManager.handleUrl(BrowserUrlManager.URL_CALORY).then((url) {
          NavigatorUtils.goBrowserPage(context, url);
        });
      },
      margin: EdgeInsets.only(left: 17, right: 17, top: 13),
      child: Container(
        padding: EdgeInsets.only(top: 19, left: 15, right: 15, bottom: 19),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
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
                            text: " 千卡", style: TextStyles.get12TextA8ACBC()),
                      ]),
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(top: 8, right: 30),
                  child: Container(
                    width: 93,
                    height: 60,
                    child: FlChart(
                      chart: BarChart(BarChartData(
                        barTouchData: BarTouchData(enabled: false),
                        titlesData: FlTitlesData(
                          show: true,
                          bottomTitles: SideTitles(
                              showTitles: true,
                              textStyle:
                                  TextStyle(color: colorA8ACBC, fontSize: 10),
                              getTitles: (double value) {
                                switch (value.toInt()) {
                                  case 0:
                                    return '早';
                                  case 1:
                                    return '中';
                                  case 2:
                                    return '晚';
                                  case 3:
                                    return '加';
                                  case 4:
                                    return '运动';
                                }
                              }),
                          leftTitles: SideTitles(
                            showTitles: false,
                          ),
                        ),
                        borderData: FlBorderData(
                          show: false,
                        ),
                        barGroups: [
                          BarChartGroupData(x: 0, barRods: [
                            BarChartRodData(
                              y: 10,
                              color: color00CDA2,
                              width: 3,
                              isRound: true,
                              backDrawRodData: BackgroundBarChartRodData(
                                show: true,
                                y: 20,
                                color: Color(0xFFF5F6FA),
                              ),
                            ),
                          ]),
                          BarChartGroupData(x: 1, barRods: [
                            BarChartRodData(
                              y: 12,
                              color: color00CDA2,
                              width: 3,
                              isRound: true,
                              backDrawRodData: BackgroundBarChartRodData(
                                show: true,
                                y: 20,
                                color: Color(0xFFF5F6FA),
                              ),
                            ),
                          ]),
                          BarChartGroupData(x: 2, barRods: [
                            BarChartRodData(
                              y: 15,
                              color: color00CDA2,
                              width: 3,
                              isRound: true,
                              backDrawRodData: BackgroundBarChartRodData(
                                show: true,
                                y: 20,
                                color: Color(0xFFF5F6FA),
                              ),
                            ),
                          ]),
                          BarChartGroupData(x: 3, barRods: [
                            BarChartRodData(
                              y: 20,
                              color: Color(0xfffe8d60),
                              width: 3,
                              isRound: true,
                              backDrawRodData: BackgroundBarChartRodData(
                                show: true,
                                y: 20,
                                color: Color(0xFFF5F6FA),
                              ),
                            ),
                          ]),
                          BarChartGroupData(x: 4, barRods: [
                            BarChartRodData(
                              y: 10,
                              color: color00CDA2,
                              width: 3,
                              isRound: true,
                              backDrawRodData: BackgroundBarChartRodData(
                                show: true,
                                y: 20,
                                color: Color(0xFFF5F6FA),
                              ),
                            ),
                          ])
                        ],
                      )),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

/// 饮食运动记录
class WisdomWidget extends StatelessWidget {
  final Data topCard;

  WisdomWidget({this.topCard});

  @override
  Widget build(BuildContext context) {
    return CardView(
      onPressed: () {
        BrowserUrlManager.handleUrl(BrowserUrlManager.getSmartAnalysisUrl())
            .then((url) {
          NavigatorUtils.goBrowserPage(context, url);
        });
      },
      margin: EdgeInsets.only(left: 17, right: 17, top: 13),
      child: Container(
        padding: EdgeInsets.only(
          top: 19,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 15, right: 15),
              child: Row(
                children: <Widget>[
                  Image.asset(
                    Utils.getImgPath("ic_home_dietician"),
                    height: 18,
                    width: 18,
                  ),
                  PaddingStyles.getPadding(6),
                  Text(
                    "饮食计划",
                    style: TextStyles.get14TextBold_373D52(),
                  )
                ],
              ),
            ),
            SizeBoxFactory.getVerticalSizeBox(22),
            Padding(
              padding: EdgeInsets.only(left: 39),
              child: RichText(
                text: TextSpan(children: <TextSpan>[
                  TextSpan(text: "晚餐: ", style: TextStyles.get12Text_373D52()),
                  TextSpan(
                      text: "米饭、番茄炒蛋、水煮鱼片",
                      style: TextStyles.get12TextA8ACBC()),
                ]),
              ),
            ),
            SizeBoxFactory.getVerticalSizeBox(22),
            Container(
              width: double.infinity,
              height: 39,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: Color(0x33FEC407),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(12.0),
                      bottomRight: Radius.circular(12.0)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      Utils.getImgPath("ic_dietician_logo"),
                      width: 20,
                      height: 20,
                    ),
                    SizeBoxFactory.getHorizontalSizeBox(4),
                    Text(
                      "智慧营养师",
                      style: TextStyle(
                        fontSize: 14,
                        color: colorFEBB07,
                      ),
                    ),
                    Image.asset(
                      Utils.getImgPath("ic_arrow_light_yellow"),
                      width: 20,
                      height: 20,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

/// 体重记录
class WeightRecordWidget extends StatelessWidget {
  final Data topCard;

  WeightRecordWidget({this.topCard});

  @override
  Widget build(BuildContext context) {
    return CardView(
      onPressed: () {
        ToastUtils.showToast(context, topCard.name);
      },
      margin: EdgeInsets.only(left: 17, right: 17, top: 13),
      child: Container(
        padding: EdgeInsets.only(top: 19, left: 15, right: 15, bottom: 19),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Image.asset(
                      Utils.getImgPath("ic_home_weight"),
                      height: 18,
                      width: 18,
                    ),
                    SizeBoxFactory.getHorizontalSizeBox(6),
                    Text(
                      topCard.name,
                      style: TextStyles.get14TextBold_373D52(),
                    )
                  ],
                ),
                RoundButton(
                  text: "体脂秤",
                  onPressed: () {
                    ToastUtils.showToast(context, "体脂秤");
                  },
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 7, right: 30),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      PaddingStyles.getPadding(24),
                      RichText(
                        text: TextSpan(children: <TextSpan>[
                          TextSpan(
                              text: "58.9 ",
                              style: TextStyles.get15TextBold_373D52()),
                          TextSpan(
                              text: "公斤", style: TextStyles.get12TextA8ACBC()),
                        ]),
                      )
                    ],
                  ),
                  Container(
                    width: 93,
                    height: 41,
                    child: FlChart(
                        chart: LineChart(LineChartData(
                            lineTouchData: LineTouchData(enabled: false),
                            minY: 58.5,
                            maxY: 70,
                            titlesData: FlTitlesData(
                                show: false,
                                leftTitles: SideTitles(showTitles: false),
                                bottomTitles: SideTitles(showTitles: false),
                                rightTitles: SideTitles(showTitles: false),
                                topTitles: SideTitles(showTitles: false)),
                            borderData: FlBorderData(show: false),
                            gridData: FlGridData(
                              show: false,
                            ),
                            lineBarsData: [
                              LineChartBarData(
                                  preventCurveOverShooting: true,
                                  colors: [Color(0x5700CDA2)],
                                  isCurved: true,
                                  barWidth: 2,
                                  isStrokeCapRound: true,
                                  dotData: FlDotData(
                                      show: true,
                                      dotColor: color00CDA2,
                                      dotSize: 2),
                                  belowBarData: BelowBarData(
                                    show: false,
                                  ),
                                  spots: [
                                    FlSpot(1, 65),
                                    FlSpot(2, 66),
                                    FlSpot(3, 65),
                                    FlSpot(4, 64),
                                    FlSpot(5, 62),
                                    FlSpot(6, 68),
                                    FlSpot(7, 60),
                                  ])
                            ],
                            backgroundColor: Colors.transparent))),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

/// 健康习惯
class HealthHabitsWidget extends StatelessWidget {
  final String iconUrl;
  final String title;

  HealthHabitsWidget({this.iconUrl, this.title});

  @override
  Widget build(BuildContext context) {
    return CardView(
      onPressed: () {
        ToastUtils.showToast(context, title);
      },
      margin: EdgeInsets.only(left: 17, right: 17, top: 13),
      child: Container(
        margin: EdgeInsets.only(top: 20, bottom: 20),
        padding: EdgeInsets.only(left: 15, right: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: <Widget>[
                Image.asset(
                  Utils.getImgPath(iconUrl),
                  height: 18,
                  width: 18,
                ),
                SizeBoxFactory.getHorizontalSizeBox(6),
                Text(
                  title,
                  style: TextStyles.get14TextBold_373D52(),
                )
              ],
            ),
            Row(
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
                  height: 18,
                  width: 18,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

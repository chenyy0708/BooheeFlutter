import 'package:boohee_flutter/common/colors.dart';
import 'package:boohee_flutter/model/login_user.dart';
import 'package:boohee_flutter/res/styles.dart';
import 'package:boohee_flutter/utils/account_utils.dart';
import 'package:boohee_flutter/utils/utils.dart';
import 'package:boohee_flutter/widget/card_view.dart';
import 'package:boohee_flutter/widget/tool_bar.dart';
import 'package:boohee_flutter/widget/top_bottom_widget.dart';
import 'package:flutter/material.dart';

class MinePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MinePageState();
}

class _MinePageState extends State<MinePage> {
  User mUser;

  @override
  void initState() {
    super.initState();
    mUser = AccountUtils.getUser();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Toolbar(),
      body: CustomScrollView(
        slivers: <Widget>[SliverToBoxAdapter(child: createMineHeader())],
      ),
    );
  }

  Widget createMineHeader() {
    return Stack(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(top: 10, bottom: 47),
          color: color00CDA2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  PaddingStyles.getPadding(17),
                  new ClipOval(
                    child: Image.network(
                      mUser.avatarUrl,
                      height: 60,
                      width: 60,
                    ),
                  ),
                  PaddingStyles.getPadding(13),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        mUser.userName,
                        style: TextStyle(
                            fontSize: 17,
                            color: Colors.white,
                            fontWeight: FontWeight.w700),
                      ),
                      Text(
                        "修改个人资料",
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                        ),
                      )
                    ],
                  )
                ],
              ),
              SizeBoxFactory.getVerticalSizeBox(25),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  TopBottom(
                    top: Text(
                      "57",
                      style: TextStyles.get15White(),
                    ),
                    bottom: Text(
                      "动态",
                      style: TextStyle(fontSize: 12, color: Color(0x9EFFFFFF)),
                    ),
                    margin: 2,
                  ),
                  TopBottom(
                    top: Text(
                      "74",
                      style: TextStyles.get15White(),
                    ),
                    bottom: Text(
                      "关注",
                      style: TextStyle(fontSize: 12, color: Color(0x9EFFFFFF)),
                    ),
                    margin: 2,
                  ),
                  TopBottom(
                    top: Text(
                      "423",
                      style: TextStyles.get15White(),
                    ),
                    bottom: Text(
                      "粉丝",
                      style: TextStyle(fontSize: 12, color: Color(0x9EFFFFFF)),
                    ),
                    margin: 2,
                  )
                ],
              ),
            ],
          ),
        ),
        CardView(
          margin: EdgeInsets.only(left: 17, right: 17, top: 160),
          child: Padding(
            padding: EdgeInsets.only(top: 22, bottom: 22, left: 30, right: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                TopBottom(
                  top: Image.asset(
                    Utils.getImgPath("ic_me_order"),
                    width: 34,
                    height: 34,
                  ),
                  bottom: Text(
                    "订单",
                    style: TextStyles.get12TextBold_373D52(),
                  ),
                  margin: 5,
                ),
                TopBottom(
                  top: Image.asset(
                    Utils.getImgPath("ic_me_shopping_cart"),
                    width: 34,
                    height: 34,
                  ),
                  bottom: Text(
                    "购物车",
                    style: TextStyles.get12TextBold_373D52(),
                  ),
                  margin: 5,
                ),
                TopBottom(
                  top: Image.asset(
                    Utils.getImgPath("ic_me_ticket"),
                    width: 34,
                    height: 34,
                  ),
                  bottom: Text(
                    "优惠券",
                    style: TextStyles.get12TextBold_373D52(),
                  ),
                  margin: 5,
                ),
                TopBottom(
                  top: Image.asset(
                    Utils.getImgPath("ic_me_address"),
                    width: 34,
                    height: 34,
                  ),
                  bottom: Text(
                    "收货地址",
                    style: TextStyles.get12TextBold_373D52(),
                  ),
                  margin: 5,
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}

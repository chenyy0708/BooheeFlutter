import 'package:boohee_flutter/common/colors.dart';
import 'package:boohee_flutter/http/http.dart';
import 'package:boohee_flutter/http/request_url.dart';
import 'package:boohee_flutter/model/login_user.dart';
import 'package:boohee_flutter/model/mine_cards.dart';
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
  List<Data> mCards = [];

  @override
  void initState() {
    super.initState();
    mUser = AccountUtils.getUser();
    getMineCards();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Toolbar(),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverToBoxAdapter(child: createMineHeader()),
          createMenuTab()
        ],
      ),
    );
  }

  /// 我的页面头部
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
                    style: TextStyles.get12Text_373D52(),
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
                    style: TextStyles.get12Text_373D52(),
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
                    style: TextStyles.get12Text_373D52(),
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
                    style: TextStyles.get12Text_373D52(),
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

  /// 分类
  Widget createMenuTab() {
    return SliverToBoxAdapter(
      child: Container(
        height: 176,
        child: CardView(
          margin: EdgeInsets.only(left: 17, right: 17, top: 14),
          child: Padding(
            padding: EdgeInsets.only(top: 20, left: 10, right: 10),
            child: GridView.builder(
                physics: NeverScrollableScrollPhysics(), // 禁用GradView滚动事件
                itemCount: mCards.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return createCard(mCards[index]);
                }),
          ),
        ),
      ),
    );
  }

  /// 卡片，后台配置
  void getMineCards() {
    dio
        .get(RequestUrl.getBaseUrl(RequestUrl.bingo,
            url: MineRequestUrl.mine_cards))
        .then((response) {
      MineCards mineCards = MineCards.fromJson(response.data);
      mCards = mineCards.data;
      setState(() {});
    });
  }

  /// 菜单卡片
  Widget createCard(Data mCard) {
    return TopBottom(
      top: Image.network(
        mCard.iconUrl,
        width: 22,
        height: 22,
      ),
      bottom: Text(
        mCard.name,
        style: TextStyles.get12Text_373D52(),
      ),
      margin: 6,
    );
  }
}

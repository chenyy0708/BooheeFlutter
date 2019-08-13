import 'package:boohee_flutter/common/colors.dart';
import 'package:boohee_flutter/utils/toast_utils.dart';
import 'package:boohee_flutter/views/shop_pages/shop_page.dart';
import 'package:flutter/material.dart';

import 'discover_page.dart';
import 'home_page.dart';
import 'mine_page.dart';

class MainPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MainPageState();
}

class _MainPageState extends State<StatefulWidget>
    with SingleTickerProviderStateMixin {
  int _selectedIndex = 0;
  List<Widget> _list = List();
  List<Widget> _selectIcon = [
    Image.asset(
      "images/ic_tab_bar_home_green.png",
      width: 22,
      height: 22,
    ),
    Image.asset(
      "images/ic_tab_bar_partner_green.png",
      width: 22,
      height: 22,
    ),
    Image.asset(
      "images/ic_home_tabbar_plus.png",
      width: 36,
      height: 36,
    ),
    Image.asset(
      "images/ic_tab_bar_shop_green.png",
      width: 22,
      height: 22,
    ),
    Image.asset(
      "images/ic_tab_bar_me_green.png",
      width: 22,
      height: 22,
    ),
  ];
  List<Widget> _unselectIcon = [
    Image.asset(
      "images/ic_tab_bar_home_grey.png",
      width: 22,
      height: 22,
    ),
    Image.asset(
      "images/ic_tab_bar_partner_grey.png",
      width: 22,
      height: 22,
    ),
    Image.asset(
      "images/ic_home_tabbar_plus.png",
      width: 36,
      height: 36,
    ),
    Image.asset(
      "images/ic_tab_bar_shop_grey.png",
      width: 22,
      height: 22,
    ),
    Image.asset(
      "images/ic_tab_bar_me_grey.png",
      width: 22,
      height: 22,
    ),
  ];
  static List<String> tabData = [
    "首页",
    "伙伴",
    "",
    "商店",
    "我",
  ];
  List<BottomNavigationBarItem> _myTabs = [];

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < tabData.length; i++) {
      // 初始化底部Tab
      _myTabs.add(BottomNavigationBarItem(
        icon: _unselectIcon[i],
        activeIcon: _selectIcon[i],
        title: Text(
          tabData[i],
        ),
      ));
    }
    _list
      ..add(HomePage())
      ..add(DiscoverPage())
      ..add(ShopPage())
      ..add(MinePage());
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _list,
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedFontSize: 10,
        unselectedFontSize: 10,
        backgroundColor: Colors.white,
        items: _myTabs,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        fixedColor: mainColor,
      ),
    );
  }

  // 导航tab 点击回调
  void _onItemTapped(int index) {
    if (index == 2) {
      ToastUtils.showToast(context, "暂无");
      return;
    }
    // 刷新widget
    setState(() {
      _selectedIndex = index;
    });
  }
}

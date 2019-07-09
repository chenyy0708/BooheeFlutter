import 'package:boohee_flutter/common/colors.dart';
import 'package:boohee_flutter/views/shop_pages/shop_page.dart';
import 'package:flutter/material.dart';

import 'NetPage_1.dart';
import 'NetPage_2.dart';
import 'NetPage_4.dart';

class MainPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MainPageState();
}

class _MainPageState extends State<StatefulWidget>
    with SingleTickerProviderStateMixin {
  int _selectedIndex = 2;
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
    "商店",
    "我",
  ];
  String title = "首页";
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
    title = tabData[_selectedIndex];
    _list
      ..add(NetPage_1())
      ..add(NetPage_2())
      ..add(ShopPage())
      ..add(NetPage_4());
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        // 导航栏
        title: Text(title),
        backgroundColor: mainColor,
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: _list,
      ),
      bottomNavigationBar: BottomNavigationBar(
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
    // 刷新widget
    setState(() {
      _selectedIndex = index;
      title = tabData[index];
    });
  }
}

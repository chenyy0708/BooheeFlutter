import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MainPageState();
}

class _MainPageState extends State<StatefulWidget>
    with SingleTickerProviderStateMixin {
  // 标记导航栏目前点击index
  int _selectedIndex = 1;

  // TabBar
  TabController _tabController;
  List tabs = [
    "新闻",
    "历史",
    "图片",
  ];

  @override
  void initState() {
    super.initState();
    // 创建Controller
    _tabController = TabController(length: tabs.length, vsync: this);
    _tabController.addListener(() {
      print(_tabController.index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // 导航栏
        title: Text("Material Widget Demo"),
        actions: <Widget>[
          //  导航栏右侧菜单按钮图标等
          IconButton(
            icon: Icon(Icons.share),
            onPressed: () {},
          )
        ],
        // 自定义appbar左侧按钮图标功能
        leading: Builder(builder: (context) {
          return IconButton(
              icon: Icon(
                Icons.ac_unit,
                color: Colors.white,
              ),
              onPressed: () {
                // 打开抽屉菜单
                Scaffold.of(context).openDrawer();
              });
        }),
        bottom: TabBar(
          controller: _tabController,
          tabs: tabs
              .map((e) => Tab(
                    text: e,
                  ))
              .toList(),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: tabs.map((e) {
          return Container(
            alignment: Alignment.center,
            child: Text(
              e,
              textScaleFactor: 5,
            ),
          );
        }).toList(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("首页")),
          BottomNavigationBarItem(
              icon: Icon(Icons.business), title: Text("社区")),
          BottomNavigationBarItem(icon: Icon(Icons.school), title: Text("学习")),
        ],
        currentIndex: _selectedIndex,
        fixedColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }

  // 导航tab 点击回调
  void _onItemTapped(int index) {
    // 刷新widget
    setState(() {
      _selectedIndex = index;
    });
  }
}

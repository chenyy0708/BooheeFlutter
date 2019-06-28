import 'package:flutter/material.dart';

import 'NetPage.dart';

class MainPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MainPageState();
}

class _MainPageState extends State<StatefulWidget>
    with SingleTickerProviderStateMixin {
  int _selectedIndex = 2;
  List<Widget> _list = List();
  static List tabData = [
    {'text': '首页', 'icon': Icon(Icons.extension)},
    {'text': '伙伴', 'icon': Icon(Icons.favorite)},
    {'text': '商店', 'icon': Icon(Icons.import_contacts)},
    {'text': '我', 'icon': Icon(Icons.inbox)},
  ];
  String title = "首页";
  List<BottomNavigationBarItem> _myTabs = [];

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < tabData.length; i++) {
      // 初始化底部Tab
      _myTabs.add(BottomNavigationBarItem(
        icon: tabData[i]['icon'],
        title: Text(
          tabData[i]['text'],
        ),
      ));
    }
    title = tabData[_selectedIndex]['text'];
    _list..add(NetPage())..add(NetPage())..add(NetPage())..add(NetPage());
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // 导航栏
        title: Text(title),
        actions: <Widget>[
          //  导航栏右侧菜单按钮图标等
          IconButton(
            icon: Icon(Icons.share),
            onPressed: () {},
          )
        ],
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: _list,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: _myTabs,
        //高亮  被点击高亮
        currentIndex: _selectedIndex,
        //修改 页面
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        fixedColor: Colors.blue,
      ),
    );
  }

  // 导航tab 点击回调
  void _onItemTapped(int index) {
    // 刷新widget
    setState(() {
      _selectedIndex = index;
      title = tabData[index]['text'];
    });
  }
}

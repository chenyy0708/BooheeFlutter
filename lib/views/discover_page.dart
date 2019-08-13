import 'package:boohee_flutter/widget/common_search_bar.dart';
import 'package:flutter/material.dart';

class DiscoverPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SearchBar(
        text: "搜索动态、文章、话题、用户",
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[Text("伙伴")],
        ),
      ),
    );
  }
}

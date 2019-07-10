import 'package:boohee_flutter/common/Colors.dart';
import 'package:flutter/material.dart';

class MinePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MinePageState();
}

class _MinePageState extends State<MinePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        new SliverAppBar(
          backgroundColor: mainColor,
          primary: true,
          expandedHeight: 200.0,
          floating: false,
          pinned: true,
          snap: false,
          flexibleSpace: new FlexibleSpaceBar(
            title: new Text("ChenYy"),
            centerTitle: true,
            collapseMode: CollapseMode.pin,
          ),
        ),
        new SliverFixedExtentList(
          itemExtent: 150.0,
          delegate:
              new SliverChildBuilderDelegate((context, index) => new ListTile(
                    title: new Text("List item $index"),
                  )),
        )
      ],
    );
  }
}

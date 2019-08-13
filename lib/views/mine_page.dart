import 'package:boohee_flutter/model/login_user.dart';
import 'package:boohee_flutter/utils/account_utils.dart';
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
      appBar: PreferredSize(
          child: Stack(
            children: <Widget>[
              Align(
                alignment: Alignment.centerLeft,
                child: Text(mUser.userName ?? ""),
              )
            ],
          ),
          preferredSize: Size.fromHeight(72)),
      body: CustomScrollView(
        slivers: <Widget>[
          new SliverFixedExtentList(
            itemExtent: 150.0,
            delegate:
                new SliverChildBuilderDelegate((context, index) => new ListTile(
                      title: new Text("List item $index"),
                    )),
          )
        ],
      ),
    );
  }
}

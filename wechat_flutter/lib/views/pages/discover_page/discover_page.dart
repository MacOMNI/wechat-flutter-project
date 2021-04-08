import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:wechat_flutter/models/common_item.dart';
import 'package:wechat_flutter/views/listItem/common_item_widget.dart';

const _disCoverList = [
  {"avatar": "", "title": "", "havline": "0", "sep": "1"},
  {
    "avatar": "assets/images/discover/discover_moment.png",
    "title": "朋友圈",
    "havline": "0",
    "sep": "0"
  },
  {"avatar": "", "title": "", "havline": "0", "sep": "1"},
  {
    "avatar": "assets/images/discover/discover_scan.png",
    "title": "扫一扫",
    "havline": "1",
    "sep": "0"
  },
  {
    "avatar": "assets/images/discover/discover_shake.png",
    "title": "摇一摇",
    "havline": "0",
    "sep": "0"
  },
  {"avatar": "", "title": "", "havline": "0", "sep": "1"},
  {
    "avatar": "assets/images/discover/discover_nearby.png",
    "title": "附近的人",
    "havline": "0",
    "sep": "0"
  },
  {"avatar": "", "title": "", "havline": "0", "sep": "1"},
  {
    "avatar": "assets/images/discover/discover_shopping.png",
    "title": "购物",
    "havline": "1",
    "sep": "0"
  },
  {
    "avatar": "assets/images/discover/discover_games.png",
    "title": "游戏",
    "havline": "0",
    "sep": "0"
  },
];

class DiscoverPage extends StatelessWidget {
  const DiscoverPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
          brightness: Brightness.dark,
          title: new Text(
            "发现",
            style: new TextStyle(fontSize: 22),
          ),
          flexibleSpace: ClipRect(
            child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 0, sigmaY: 2),
                child: Container(color: Color(0xff2D2C33))),
          )),
      backgroundColor: Color(0xffF0F0F6),
      body: ListView.builder(
        itemCount: _disCoverList.length,
        itemBuilder: (BuildContext context, int index) {
          CommonItemModel model =
              CommonItemModel.fromJson(_disCoverList[index]);
          if (model.sep == "1") {
            return SizedBox(
              height: 20,
              width: double.infinity,
            );
          }
          return CommonItemWidget(
            image: model.image,
            title: model.title,
            haveLine: model.haveLine == "1",
            height: 44,
          );
        },
      ),
    );
  }
}

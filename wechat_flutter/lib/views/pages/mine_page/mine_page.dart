import 'dart:ui';
import 'package:wechat_flutter/models/common_item.dart';
import 'package:wechat_flutter/views/listItem/common_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:wechat_flutter/views/pages/mine_page/header_itemWidget.dart';

const _meList = [
  {"avatar": "", "title": "", "type": "line", "sep": "1"},
  {
    "avatar": "assets/images/me/me_profile.png",
    "title": "MacKun",
    "name": "微信号:MacKunsj",
    "type": "header",
    "havline": "0",
    "sep": "0"
  },
  {"avatar": "", "title": "", "havline": "0", "sep": "1"},
  {
    "avatar": "assets/images/me/me_album.png",
    "title": "相册",
    "type": "normal",
    "havline": "0",
    "sep": "0"
  },
  {
    "avatar": "assets/images/me/me_save.png",
    "title": "收藏",
    "type": "normal",
    "havline": "0",
    "sep": "0"
  },
  {
    "avatar": "assets/images/me/me_wallet.png",
    "title": "钱包",
    "havline": "0",
    "type": "normal",
    "sep": "0"
  },
  {"avatar": "", "title": "", "havline": "0", "sep": "1"},
  {
    "avatar": "assets/images/me/me_stickers.png",
    "title": "表情",
    "havline": "0",
    "sep": "0"
  },
  {"avatar": "", "title": "", "havline": "0", "sep": "1"},
  {
    "avatar": "assets/images/me/me_settings.png",
    "title": "设置",
    "havline": "0",
    "sep": "0"
  },
];

class MinePage extends StatelessWidget {
  const MinePage({Key key}) : super(key: key);

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
        itemCount: _meList.length,
        itemBuilder: (BuildContext context, int index) {
          CommonItemModel model = CommonItemModel.fromJson(_meList[index]);
          if (model.sep == "1") {
            return SizedBox(
              height: 20,
              width: double.infinity,
            );
          }
          if (model.type == "header") {
            return HeaderItemWidget(
                avactar: model.image, name: model.title, wxID: model.name);
          }
          return CommonItemWidget(
            image: model.image,
            title: model.title,
            height: 44,
          );
        },
      ),
    );
  }
}

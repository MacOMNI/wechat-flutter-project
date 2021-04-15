import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:wechat_flutter/views/pages/discover_page/head_view.dart';

class FriendPage extends StatefulWidget {
  FriendPage({Key key}) : super(key: key);

  @override
  _FriendPageState createState() => _FriendPageState();
}

class _FriendPageState extends State<FriendPage> {
  ScrollController _scrollController = new ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //     brightness: Brightness.dark,
      //     title: Text("朋友圈", style: new TextStyle(fontSize: 22)),
      //     leading: IconButton(
      //       alignment: Alignment.center,
      //       icon: Image.asset(
      //         "assets/images/navbar/navbar_back.png",
      //         fit: BoxFit.contain,
      //         height: 25,
      //         width: 20,
      //       ),
      //       onPressed: () {
      //         Navigator.of(context).pop();
      //       },
      //     ),
      //     flexibleSpace: ClipRect(
      //       child: BackdropFilter(
      //           filter: ImageFilter.blur(sigmaX: 0, sigmaY: 2),
      //           child: Container(color: Color(0xff2D2C33))),
      //     )),
      // backgroundColor: Color(0xffF0F0F6),
      body: Stack(
        children: [
          ListView(
            controller: _scrollController,
            padding: EdgeInsets.only(top: 0),
            children: [
              HeadViewWidget(),
            ],
          ),
          CupertinoNavigationBar(
            brightness: Brightness.dark,
            middle: Text("朋友圈", style: new TextStyle(fontSize: 22)),
            // backgroundColor: Colors.transparent,
            leading: IconButton(
              alignment: Alignment.center,
              icon: Image.asset(
                "assets/images/navbar/navbar_back.png",
                fit: BoxFit.contain,
                height: 25,
                width: 20,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ),
        ],
      ),
    );
  }
}

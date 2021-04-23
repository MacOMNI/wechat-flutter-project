import 'dart:convert';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:wechat_flutter/models/Friend_model.dart';
import 'package:wechat_flutter/views/pages/discover_page/friend_item_widget.dart';
import 'package:wechat_flutter/views/pages/discover_page/head_view.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

const APPBAR_SCROLL_OFFSET = 200;

class FriendPage extends StatefulWidget {
  FriendPage({Key key}) : super(key: key);

  @override
  _FriendPageState createState() => _FriendPageState();
}

class _FriendPageState extends State<FriendPage> {
  double _appBarAlpha = 0;

  FriendListModel _friendList = FriendListModel();

  // ScrollController _scrollController = new ScrollController();

  Future<String> loadAsset() async {
    return await rootBundle
        .loadString('assets/images/discover/MessageJSON.json');
  }

  @override
  void initState() {
    super.initState();
    loadAsset().then((value) {
      var json = jsonDecode(value);
      print("json ${json}");
      _friendList = new FriendListModel.fromJson(json);
      // print(_friendList);
      setState(() {});
    });
    //SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
  }

  @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     backgroundColor: Colors.white,
  //     body: EasyRefresh(
  //       header: MaterialHeader(),
  //       footer: ClassicalFooter(),
  //       onRefresh: () async {
  //         await Future.delayed(Duration(seconds: 2), () {
  //           print("refreash ");
  //         });
  //       },
  //       onLoad: () async {
  //         await Future.delayed(Duration(seconds: 2), () {
  //           print("onLoad");
  //         });
  //       },
  //       child: Stack(
  //         children: [
  //           MediaQuery.removePadding(
  //             removeTop: true,
  //             context: context,
  //             child: NotificationListener(
  //               onNotification: (scrollNotification) {
  //                 if (scrollNotification is ScrollUpdateNotification &&
  //                     scrollNotification.depth == 0) {
  //                   _onScroll(scrollNotification.metrics.pixels);
  //                 }
  //                 return true;
  //               },
  //               child: ListView(
  //                 // controller: _scrollController,
  //                 padding: EdgeInsets.only(top: 0),
  //                 children: [
  //                   HeadViewWidget(),
  //                   ListView.separated(
  //                     itemCount: _friendList.list.length,
  //                     separatorBuilder: (BuildContext context, int index) {
  //                       return Divider(
  //                         color: Color(0xffd8d8d8),
  //                         height: 0.5,
  //                       );
  //                     },
  //                     itemBuilder: (BuildContext context, int index) {
  //                       return InkWell(
  //                         child: FriendItemWidget(
  //                           itemData: _friendList.list[index],
  //                           globalKey: widget.key,
  //                         ),
  //                       );
  //                     },
  //                     shrinkWrap: true,
  //                     physics: NeverScrollableScrollPhysics(),
  //                   ),
  //                 ],
  //               ),
  //             ),
  //           ),
  //           _appBar,
  //         ],
  //       ),
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          MediaQuery.removePadding(
            removeTop: true,
            context: context,
            child: NotificationListener(
              onNotification: (scrollNotification) {
                if (scrollNotification is ScrollUpdateNotification &&
                    scrollNotification.depth == 0) {
                  _onScroll(scrollNotification.metrics.pixels);
                }
                return true;
              },
              child: ListView(
                // controller: _scrollController,
                padding: EdgeInsets.only(top: 0),
                children: [
                  HeadViewWidget(),
                  ListView.separated(
                    itemCount: _friendList.list.length,
                    separatorBuilder: (BuildContext context, int index) {
                      return Divider(
                        color: Color(0xffd8d8d8),
                        height: 0.5,
                      );
                    },
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                        child: FriendItemWidget(
                          itemData: _friendList.list[index],
                          globalKey: widget.key,
                        ),
                      );
                    },
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                  ),
                ],
              ),
            ),
          ),
          _appBar,
        ],
      ),
    );
  }

  void _onScroll(offset) {
    double alpha = offset / APPBAR_SCROLL_OFFSET;
    if (alpha < 0) {
      alpha = 0;
    } else if (alpha > 1) {
      alpha = 1;
      //SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    }
    setState(() {
      _appBarAlpha = alpha;
    });
  }

  Widget get _appBar {
    double navTop = MediaQueryData.fromWindow(window).padding.top;
    double toolBar = kToolbarHeight;
    return Column(
      children: <Widget>[
        Container(
          height: navTop + toolBar,
          padding: EdgeInsets.only(top: navTop),
          decoration: BoxDecoration(
            color: Color(0xff2D2C33).withOpacity(_appBarAlpha),
          ),
          child: Row(
            children: [
              IconButton(
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
              Expanded(
                child: Opacity(
                  opacity: _appBarAlpha,
                  child: Text(
                    "朋友圈",
                    textAlign: TextAlign.center,
                    style: new TextStyle(
                        fontSize: 22,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              IconButton(
                padding: EdgeInsets.only(right: 10),
                alignment: Alignment.centerRight,
                icon: Image.asset(
                  "assets/images/discover/moment_camera.png",
                  fit: BoxFit.contain,
                  height: 25,
                  width: 20,
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}

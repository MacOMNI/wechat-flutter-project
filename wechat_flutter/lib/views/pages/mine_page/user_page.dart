import 'dart:ui';

import 'package:flutter/material.dart';

class UserPage extends StatefulWidget {
  UserPage({Key key}) : super(key: key);

  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.dark,
        flexibleSpace: ClipRect(
          child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 0, sigmaY: 2),
              child: Container(color: Color(0xff2D2C33))),
        ),
        title: Text(
          "我的二维码",
          style: new TextStyle(fontSize: 22),
        ),
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
        actions: [
          IconButton(
              constraints: BoxConstraints(maxWidth: 44, maxHeight: 25),
              alignment: Alignment.center,
              icon: Image.asset("assets/images/navbar/navbar_more.png"),
              onPressed: () {
                Navigator.of(context).pop();
              }),
        ],
      ),
      body: new Container(
        color: Color(0xffB2B2B2),
        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
        // width: MediaQuery.of(context).size.width,
        // height: MediaQuery.of(context).size.height,
        child: new SizedBox(
          height: 380,
          width: 292,
          child: new Container(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

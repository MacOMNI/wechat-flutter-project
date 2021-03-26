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
          iconSize: 25,
          alignment: Alignment.center,
          icon: Image.asset(
            "assets/images/navbar/navbar_back.png",
            fit: BoxFit.contain,
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
    );
    return Container(
      alignment: Alignment.center,
      child: Text("User Page!"),
    );
  }
}

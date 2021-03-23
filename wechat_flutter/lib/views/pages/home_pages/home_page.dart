import 'dart:ui';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
          brightness: Brightness.dark,
          title: new Text("微信", style: new TextStyle(fontSize: 22)),
          flexibleSpace: ClipRect(
            child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 0, sigmaY: 2),
                child: Container(color: Color(0xff2D2C33))),
          )),
      body: new Center(
        child: new Text(
          "Message",
          style: new TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

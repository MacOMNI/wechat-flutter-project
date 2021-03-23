import 'package:flutter/material.dart';
import 'dart:ui';

class ContactPage extends StatelessWidget {
  const ContactPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
          brightness: Brightness.dark,
          title: new Text("联系人", style: new TextStyle(fontSize: 22)),
          flexibleSpace: ClipRect(
            child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 0, sigmaY: 2),
                child: Container(color: Color(0xff2D2C33))),
          )),
      body: new Center(
        child: new Text(
          "Contact",
          style: new TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class MinePage extends StatelessWidget {
  const MinePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("我的"),
      ),
      body: new Text("HomePage"),
    );
  }
}

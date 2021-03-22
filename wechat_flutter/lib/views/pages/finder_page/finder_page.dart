import 'package:flutter/material.dart';

class FinderPage extends StatelessWidget {
  const FinderPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("发现"),
      ),
      body: new Text("FinderPage"),
    );
  }
}

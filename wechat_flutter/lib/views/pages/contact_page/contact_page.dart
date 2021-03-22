import 'package:flutter/material.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("联系人"),
      ),
      body: new Text("FinderPage"),
    );
  }
}

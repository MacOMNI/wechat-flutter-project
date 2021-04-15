import 'package:flutter/material.dart';

class HeadViewWidget extends StatefulWidget {
  HeadViewWidget({Key key}) : super(key: key);

  @override
  _HeadViewWidgetState createState() => _HeadViewWidgetState();
}

class _HeadViewWidgetState extends State<HeadViewWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 320,
      child: Stack(
        children: [
          Positioned(
              left: 0,
              top: 0,
              right: 0,
              bottom: 40,
              child: Image.asset(
                "assets/images/discover/moment_bg.png",
                fit: BoxFit.fill,
              )),
        ],
      ),
    );
  }
}

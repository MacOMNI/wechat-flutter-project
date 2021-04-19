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
          Positioned(
              right: 10,
              bottom: 15,
              child: Image.asset(
                "assets/images/me/me_profile.png",
                width: 75,
                height: 75,
                fit: BoxFit.fill,
              )),
          Positioned(
            right: 100,
            bottom: 50,
            child: Text(
              "麦克坤",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                  shadows: [Shadow(color: Colors.black, offset: Offset(1, 1))]),
            ),
          ),
        ],
      ),
    );
  }
}

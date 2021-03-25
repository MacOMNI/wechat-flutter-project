import 'package:flutter/material.dart';

class HeaderItemWidget extends StatefulWidget {
  final String avactar;
  final String name;
  final String wxID;
  HeaderItemWidget({Key key, this.avactar, this.name, this.wxID})
      : super(key: key);

  @override
  _HeaderItemWidgetState createState() => _HeaderItemWidgetState();
}

class _HeaderItemWidgetState extends State<HeaderItemWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
      height: 88,
      color: Colors.white,
      child: Row(
        children: [
          Image.asset(widget.avactar, width: 65, height: 65),
          SizedBox(
            width: 10,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.name,
                  style: TextStyle(fontSize: 17),
                ),
                Text(
                  widget.wxID,
                  style: TextStyle(fontSize: 15),
                )
              ],
            ),
          ),
          Flexible(child: SizedBox(width: double.infinity)),
          Align(
            alignment: Alignment.centerRight,
            child: Row(
              children: [
                Image.asset(
                  "assets/images/me/me_qr.png",
                  width: 17,
                  height: 17,
                ),
                SizedBox(width: 5),
                Image.asset(
                  "assets/images/common/common_next.png",
                  width: 9,
                  height: 14,
                  fit: BoxFit.contain,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

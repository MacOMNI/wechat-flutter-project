import 'package:flutter/material.dart';

const textStyle = TextStyle(
  fontSize: 17,
);

class CommonItemWidget extends StatefulWidget {
  final String image;
  final String title;
  final double height;
  final bool haveLine;
  CommonItemWidget({
    Key key,
    this.image,
    this.title,
    this.height,
    this.haveLine,
  }) : super(key: key);

  @override
  _CommonCellState createState() => _CommonCellState();
}

class _CommonCellState extends State<CommonItemWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
      height: widget.height,
      child: Row(
        children: [
          Image.asset(
            widget.image,
            height: 22,
            width: 22,
            fit: BoxFit.contain,
          ),
          SizedBox(width: 10),
          Text(
            widget.title,
            style: textStyle,
          ),
          Flexible(
              child: SizedBox(
            width: double.infinity,
          )),
          Align(
            alignment: Alignment.centerRight,
            child: Image.asset(
              "assets/images/common/common_next.png",
              height: 14,
              width: 9,
              fit: BoxFit.contain,
            ),
          )
        ],
      ),
    );
  }
}

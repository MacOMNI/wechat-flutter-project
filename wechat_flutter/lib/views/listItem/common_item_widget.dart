import 'package:flutter/material.dart';

class CommonItemWidget extends StatefulWidget {
  final String image;
  final String text;
  final double height;
  CommonItemWidget({
    Key key,
    this.image,
    this.text,
    this.height,
  }) : super(key: key);

  @override
  _CommonCellState createState() => _CommonCellState();
}

class _CommonCellState extends State<CommonItemWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        minWidth: double.infinity,
        minHeight: widget.height,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: Alignment.center,
          ),
        ],
      ),
    );
  }
}

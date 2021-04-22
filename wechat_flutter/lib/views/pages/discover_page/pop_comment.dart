import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'dart:core';
import 'dart:ui';
import 'package:flutter/widgets.dart';

class PopLikeCommentMenu {
  double _popWidth = 120;
  double _popHeight = 30;
  Rect _showRect;

  OverlayEntry _entry;
  BuildContext context;
  VoidCallback dissmissCallBack;
  Size _screenSize;

  PopLikeCommentMenu({this.context, VoidCallback dissmissCallBack}) {
    this.dissmissCallBack = dissmissCallBack;
  }
  void Show({Rect rect}) {
    this._screenSize = window.physicalSize / window.devicePixelRatio;

    this._showRect = rect ?? _getWidgetGlobalRect();
    this.dissmissCallBack = dissmissCallBack;
    double dx = _showRect.left;

    double dy = _showRect.top;
    //_entry = OverlayEntry(builder: builder)
    _entry = OverlayEntry(
        builder: (BuildContext context) => buildPopLayout(Offset(dx, dy)));
    Overlay.of(context).insert(_entry);
  }

  Widget buildPopLayout(Offset offset) {
    // return LayoutBuilder(builder: (context, constraints) => GestureDetector());
    return new GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        _entry.remove();
        print('tap down');
      },
      child: Positioned(
        top: kToolbarHeight,
        right: 20,
        width: 200,
        height: 320,
        //right: offset.dx,
        child: Container(
          height: _popHeight,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              AnimatedContainer(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Color(0XFF4C5154)),
                  duration: Duration(milliseconds: 100),
                  width: _popWidth,
                  height: _popHeight,
                  child: Flex(
                    direction: Axis.horizontal,
                    children: <Widget>[
                      Expanded(
                          flex: 1,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              ImageIcon(
                                AssetImage(
                                    "assets/images/discover/moment_heart.png"),
                                size: 15,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                "赞",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 12),
                              )
                            ],
                          )),
                      Expanded(
                          flex: 1,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              ImageIcon(
                                AssetImage(
                                    "assets/images/discover/moment_comment.png"),
                                size: 15,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                "评论",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 12),
                              )
                            ],
                          ))
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }

  Rect _getWidgetGlobalRect() {
    RenderBox renderBox = context.findRenderObject(); // 当前上下文
    Size size = renderBox.paintBounds.size; //获取元素位置
    var offset = renderBox.localToGlobal(Offset.zero);

    return Rect.fromLTWH(
        offset.dx, offset.dy, renderBox.size.width, renderBox.size.height);
  }
}

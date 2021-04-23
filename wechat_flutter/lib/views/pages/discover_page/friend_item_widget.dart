import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:wechat_flutter/models/Friend_model.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:wechat_flutter/views/pages/discover_page/attached_toast.dart';

// ignore: must_be_immutable
class FriendItemWidget extends StatefulWidget {
  FriendModel itemData;
  GlobalKey globalKey;
  FriendItemWidget({Key key, this.itemData, this.globalKey}) : super(key: key);
  @override
  _FriendItemWidgetState createState() => _FriendItemWidgetState();
}

double _showWidth = 0;
bool _isShow = false;

class _FriendItemWidgetState extends State<FriendItemWidget> {
  Widget _loadImageUrl(String url) {
    return CachedNetworkImage(
      imageUrl: url,
      fit: BoxFit.fill,
      placeholder: (context, url) => Container(color: Colors.grey[100]),
      errorWidget: (context, url, error) => Container(color: Colors.grey[100]),
    );
  }

  Widget _loadImageUrlWidthHeight(String url, double width, double height) {
    return CachedNetworkImage(
      width: width,
      height: height,
      imageUrl: url,
      fit: BoxFit.fill,
      placeholder: (context, url) => Container(color: Colors.grey[100]),
      errorWidget: (context, url, error) => Container(color: Colors.grey[100]),
    );
  }

  Widget buildDescWdiget(String desc) {
    if (desc.length > 0) {
      return Text(desc, style: TextStyle(fontSize: 16));
    }
    return SizedBox(
      height: 0.5,
    );
  }

  Widget buildPicsWdiget(List<String> pics) {
    if (pics.length == 1) {
      String url = pics.first;
      return Container(
        margin: EdgeInsets.only(top: 15),
        width: 150,
        height: 180,
        child: _loadImageUrl(url),
      );
    }
    if (pics.length == 2 || pics.length == 4) {
      return Container(
        margin: EdgeInsets.only(top: 15),
        child: Wrap(
          spacing: 5,
          runSpacing: 5,
          alignment: WrapAlignment.start,
          children: pics
              .map((val) => _loadImageUrlWidthHeight(val, 120, 120))
              .toList(),
        ),
      );
    }
    if (pics.length == 3 || pics.length > 4) {
      return Container(
        // margin: EdgeInsets.only(top: 0),
        child: Wrap(
          spacing: 5,
          runSpacing: 5,
          alignment: WrapAlignment.start,
          children: (pics
              .map((val) => _loadImageUrlWidthHeight(val, 80, 80))
              .toList()),
        ),
      );
    }
    return Container(
      height: 0,
    );
  }

  Widget buildCommentListView(List<CommentModel> comments) {
    return Offstage(
      offstage: comments.length == 0 ? true : false,
      child: Wrap(
        alignment: WrapAlignment.start,
        runSpacing: 5,
        children: comments.map((value) => buildCommentWidget(value)).toList(),
      ),
    );
  }

  Widget buildCommentWidget(CommentModel model) {
    if (model.toUserName.length > 0) {}
    return Text.rich(TextSpan(
      children: [
        TextSpan(
          text: model.userName +
              (model.toUserName.length > 0 ? "@" : "") +
              model.toUserName +
              " :  ",
          style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: Color(0xff566b94)),
        ),
        TextSpan(text: model.contentMessage, style: TextStyle(fontSize: 14)),
      ],
    ));
  }

  Widget popAttachedWidget() {
    return Container(
      height: 120,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          AnimatedContainer(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Color(0XFF4C5154)),
              duration: Duration(milliseconds: 100),
              width: 120,
              height: 30,
              child: Flex(
                direction: Axis.horizontal,
                children: <Widget>[
                  Expanded(
                      flex: 1,
                      child: GestureDetector(
                        onTap: () {
                          print("onTapDown 1");
                        },
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
                              style:
                                  TextStyle(color: Colors.white, fontSize: 12),
                            )
                          ],
                        ),
                      )),
                  Expanded(
                    flex: 1,
                    child: GestureDetector(
                        onTap: () {
                          print("onTapDown 2");
                        },
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
                              style:
                                  TextStyle(color: Colors.white, fontSize: 12),
                            )
                          ],
                        )),
                  ),
                ],
              )),
        ],
      ),
    );
  }

  CancelFunc tapShow(BuildContext context) {
    Offset target;
    double verticalOffset = 0;
    double horizontalOffset = 0;
    int second = 4;
    PreferDirection preferDirection = PreferDirection.rightCenter;
    bool ignoreContentClick = false;
    bool onlyOne = true;
    bool allowClick = true;
    bool enableSafeArea = true;
    int backgroundColor = 0x00000000;
    int animationMilliseconds = 200;
    int animationReverseMilliseconds = 200;
    return BotToast.showAttachedWidget(
        target: target,
        targetContext: context,
        verticalOffset: verticalOffset,
        horizontalOffset: horizontalOffset,
        duration: Duration(seconds: second),
        animationDuration: Duration(milliseconds: animationMilliseconds),
        animationReverseDuration:
            Duration(milliseconds: animationReverseMilliseconds),
        preferDirection: preferDirection,
        ignoreContentClick: ignoreContentClick,
        onlyOne: onlyOne,
        allowClick: allowClick,
        enableSafeArea: enableSafeArea,
        backgroundColor: Color(backgroundColor),
        attachedBuilder: (cancel) => popAttachedWidget());
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: <Widget>[
          Flex(
            direction: Axis.horizontal,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 42,
                height: 42,
                margin: EdgeInsets.fromLTRB(15, 10, 15, 0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: _loadImageUrl(widget.itemData.avactor),
                ),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.fromLTRB(0, 10, 20, 0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.itemData.userName,
                        style: TextStyle(
                            fontSize: 17,
                            color: Color(0XFF566B94),
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                          height: widget.itemData.desc.length > 0 ? 5 : 0.5),
                      buildDescWdiget(widget.itemData.desc),
                      buildPicsWdiget(widget.itemData.pics),
                      Container(
                        //  margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                        child: Row(
                          children: [
                            Text(
                              widget.itemData.time,
                              style: TextStyle(
                                fontSize: 12,
                                color: Color(0XFF737373),
                              ),
                            ),
                            Flexible(child: SizedBox(width: double.infinity)),
                            Builder(
                                builder: (context) => IconButton(
                                      // padding: EdgeInsets.only(right: 0),
                                      alignment: Alignment.centerRight,
                                      icon: Image.asset(
                                        "assets/images/discover/discover_comment.png",
                                        fit: BoxFit.contain,
                                        height: 15,
                                        width: 20,
                                      ),
                                      onPressed: () {
                                        tapShow(context);
                                        print("Show popview!");
                                      },
                                    )),
                          ],
                        ),
                      ),
                      buildCommentListView(widget.itemData.comments),
                      SizedBox(height: 5),
                    ],
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

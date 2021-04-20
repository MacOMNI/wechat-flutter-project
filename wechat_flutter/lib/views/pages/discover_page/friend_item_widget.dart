import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:wechat_flutter/models/Friend_model.dart';

// ignore: must_be_immutable
class FriendItemWidget extends StatefulWidget {
  FriendModel itemData;
  FriendItemWidget({Key key, this.itemData}) : super(key: key);
  @override
  _FriendItemWidgetState createState() => _FriendItemWidgetState();
}

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

  Widget _buildPicsWdiget(List<String> pics) {
    print("pics.length = ${pics.length}");
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
        margin: EdgeInsets.only(top: 15),
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
    return Container();
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
                  margin: EdgeInsets.fromLTRB(0, 20, 20, 0),
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
                      SizedBox(height: 5),
                      Text(
                        widget.itemData.desc,
                        style: TextStyle(fontSize: 16),
                      ),
                      _buildPicsWdiget(widget.itemData.pics),
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
                            IconButton(
                              // padding: EdgeInsets.only(right: 0),
                              alignment: Alignment.centerRight,
                              icon: Image.asset(
                                "assets/images/discover/discover_comment.png",
                                fit: BoxFit.contain,
                                height: 15,
                                width: 20,
                              ),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        ),
                      ),
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

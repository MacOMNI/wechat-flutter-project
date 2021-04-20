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
  Widget _loadImageUrl(String url, String placeholder) {
    return CachedNetworkImage(
      imageUrl: url,
      fit: BoxFit.fill,
      placeholder: (context, url) => Image.asset(
        placeholder,
        fit: BoxFit.fill,
      ),
      errorWidget: (context, url, error) => Image.asset(
        placeholder,
        fit: BoxFit.fill,
      ),
    );
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
                margin: EdgeInsets.fromLTRB(15, 20, 15, 0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: _loadImageUrl(widget.itemData.avactor,
                      "assets/images/common/common_placeholder.png"),
                ),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.fromLTRB(0, 20, 70, 0),
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
                        style: TextStyle(fontSize: 15),
                      ),
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

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class UserPage extends StatefulWidget {
  UserPage({Key key}) : super(key: key);

  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  @override
  Widget build(BuildContext context) {
    Widget qrCode = Container(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
              child: Container(
            child: QrImage(
              data: "MacKunsj",
              size: MediaQuery.of(context).size.width - 60 * 2,
              version: QrVersions.auto,
            ),
          ))
        ],
      ),
    );
    return Scaffold(
        appBar: AppBar(
          brightness: Brightness.dark,
          flexibleSpace: ClipRect(
            child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 0, sigmaY: 2),
                child: Container(color: Color(0xff2D2C33))),
          ),
          title: Text(
            "我的二维码",
            style: new TextStyle(fontSize: 22),
          ),
          leading: IconButton(
            alignment: Alignment.center,
            icon: Image.asset(
              "assets/images/navbar/navbar_back.png",
              fit: BoxFit.contain,
              height: 25,
              width: 20,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          actions: [
            IconButton(
                constraints: BoxConstraints(maxWidth: 44, maxHeight: 25),
                alignment: Alignment.center,
                icon: Image.asset("assets/images/navbar/navbar_more.png"),
                onPressed: () {
                  Navigator.of(context).pop();
                }),
          ],
        ),
        body: Container(
          color: Color(0xff2E3132),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                  top: 70,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                    ),
                    width: MediaQuery.of(context).size.width - 60,
                    height:
                        (MediaQuery.of(context).size.width - 60) / 552 * 769,
                    child: Column(
                      children: [
                        headRow,
                        qrCode,
                        SizedBox(height: 35),
                        bottomView,
                      ],
                    ),
                  )),
            ],
          ),
        ));
  }

  Widget bottomView = Container(
    child: Text(
      "扫一扫上面的二维码图案，加我微信",
      style: TextStyle(fontSize: 14, color: Color(0xff888888)),
    ),
  );

  Widget headRow = Container(
    padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
    height: 108,
    child: Row(
      children: [
        Image.asset(
          "assets/images/me/me_profile.png",
          width: 64,
          height: 64,
          fit: BoxFit.cover,
        ),
        SizedBox(
          width: 10,
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    "MacKunsj",
                    style: TextStyle(fontSize: 17),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Image.asset(
                    "assets/images/me/user_person.png",
                    width: 14,
                    height: 14,
                    fit: BoxFit.cover,
                  ),
                ],
              ),
              SizedBox(
                height: 2,
              ),
              Text(
                "ShangHai",
                style: TextStyle(fontSize: 15),
              )
            ],
          ),
        ),
        SizedBox(
          width: 10,
        ),
      ],
    ),
  );
}

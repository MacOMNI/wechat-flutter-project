import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  MainPage({Key key}) : super(key: key);
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  var _cur_page_index = 0;
  PageController _page_controller = PageController(initialPage: 0);
  final iconMap = {
    "微信": Icons.home,
    "通讯录": Icons.contacts,
    "朋友圈": Icons.group,
    "我的": Icons.circle,
  };
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: PageView(
        controller: _page_controller,
        onPageChanged: (index) {
          setState(() {
            _cur_page_index = index;
          });
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          _page_controller.jumpToPage(index);
          setState(() {
            _cur_page_index = index;
          });
        },
        items: iconMap.keys.map((key) => BottomNavigationBarItem(
            title: Text(key),
            icon: Icon(
              iconMap[key],
            ))),
      ),
    );
  }
}

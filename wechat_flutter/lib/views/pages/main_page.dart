import 'package:flutter/material.dart';
import 'package:wechat_flutter/views/pages/contact_page/contact_page.dart';
import 'package:wechat_flutter/views/pages/discover_page/discover_page.dart';
import 'package:wechat_flutter/views/pages/home_pages/home_page.dart';
import 'package:wechat_flutter/views/pages/mine_page/mine_page.dart';

class MainPage extends StatefulWidget {
  MainPage({Key key}) : super(key: key);
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  var _cur_page_index = 0;
  final _pages = [HomePage(), ContactPage(), DiscoverPage(), MinePage()];
  PageController _controller = PageController(initialPage: 0);
  final iconMap = {
    "微信": {
      "select": "assets/images/tabbar/tabbar_message.png",
      "unselect": "assets/images/tabbar/tabbar_message_unselect.png",
    },
    "联系人": {
      "select": "assets/images/tabbar/tabbar_contacts.png",
      "unselect": "assets/images/tabbar/tabbar_contacts_unselect.png",
    },
    "发现": {
      "select": "assets/images/tabbar/tabbar_discover.png",
      "unselect": "assets/images/tabbar/tabbar_discover_unselect.png",
    },
    "我": {
      "select": "assets/images/tabbar/tabbar_me.png",
      "unselect": "assets/images/tabbar/tabbar_me_unselect.png",
    },
  };
  // images/tabbar/tabbar_contracts_unselect

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: PageView(
        controller: _controller,
        onPageChanged: (index) {
          setState(() {
            _cur_page_index = index;
          });
        },
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          _controller.jumpToPage(index);
          setState(() {
            _cur_page_index = index;
          });
        },
        currentIndex: _cur_page_index,
        type: BottomNavigationBarType.fixed,
        fixedColor: Color(0xff0abb07),
        backgroundColor: Color(0xfff9f9f9),
        items: iconMap.keys
            .map((key) => BottomNavigationBarItem(
                  title: Text(key),
                  icon: ImageIcon(
                      AssetImage(iconMap[key]["unselect"].toString())),
                  activeIcon:
                      ImageIcon(AssetImage(iconMap[key]["select"].toString())),
                ))
            .toList(),
      ),
    );
  }
}

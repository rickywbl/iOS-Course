import 'package:flutter/material.dart';
import 'home/home_page.dart';
import 'video/video_page.dart';
import 'mine/mine_page.dart';
import 'market/market_page.dart';
import 'group/group_page.dart';



class ContainerPage extends StatefulWidget {
  @override
  _ContainerPageState createState() => _ContainerPageState();
}

class _TabItem {
  String title , activeIcon , normalIcon ;
  _TabItem(this.title,this.activeIcon,this.normalIcon);
}

class _ContainerPageState extends State<ContainerPage> {
  List<Widget> pages;
  int _selectIndex = 0;
  final items = [
     _TabItem('首页', 'assets/images/ic_tab_home_active.png',
        'assets/images/ic_tab_home_normal.png'),
    _TabItem('书影音', 'assets/images/ic_tab_subject_active.png',
        'assets/images/ic_tab_subject_normal.png'),
    _TabItem('小组', 'assets/images/ic_tab_group_active.png',
        'assets/images/ic_tab_group_normal.png'),
    _TabItem('市集', 'assets/images/ic_tab_shiji_active.png',
        'assets/images/ic_tab_shiji_normal.png'),
    _TabItem('我的', 'assets/images/ic_tab_profile_active.png',
        'assets/images/ic_tab_profile_normal.png')
  ];

  List<BottomNavigationBarItem> itemList;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (pages == null){
      pages = [
        HomePage(),
        VideoPage(),
        GroupPage(),
        MarketPage(),
        MinePage()
      ];
    }

    if (itemList == null){
      itemList = items.map((item) => BottomNavigationBarItem(
        icon: Image.asset(
          item.normalIcon,
          width: 30.0,
          height: 30.0,
        ),
        title: Text(
          item.title,
          style: TextStyle(fontSize: 10.0),
        ),
        activeIcon: Image.asset(
          item.activeIcon,
          width: 30.0,
          height: 30.0,
        )
      )).toList();
    }
  }

  // Widget _getPagesWidget(int index){
  //   return Offstage(
  //     offstage: _selectIndex != index,
  //     child: TickerMode(
  //       enabled: _selectIndex == index,
  //       child: pages[index],
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new IndexedStack  (
        index: _selectIndex,
        children: pages,
        // children: <Widget>[
          // _getPagesWidget(0),
          // _getPagesWidget(1),
          // _getPagesWidget(2),
          // _getPagesWidget(3),
          // _getPagesWidget(4),
        // ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: itemList,
        onTap: (int index){
          setState(() {
            _selectIndex = index;
          });
        },
        iconSize: 24,
        currentIndex: _selectIndex,
        fixedColor: Color.fromARGB(255, 0, 188, 96),
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
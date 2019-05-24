import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:rickydouban/pages/video/video_page_bar.dart' as myapp;
import 'package:rickydouban/widget/search_text_field_widget.dart';
import 'movie_tab_widget.dart';
import 'dart:math' as math;

var titleList = ['电影', '电视', '综艺', '读书', '音乐', '同城'];
List<Widget> tabList;

class VideoPage extends StatefulWidget {
  @override
  _VideoPage createState() => _VideoPage();
}

TabController _tabController;

class _VideoPage extends State<VideoPage> with SingleTickerProviderStateMixin {
  var tabBar;

  @override
  void initState() {
    super.initState();
    tabBar = HomePageTabBar();
    tabList = getTabList();
    _tabController = TabController(vsync: this, length: tabList.length);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
  }

  List<Widget> getTabList() {
    return titleList
        .map((item) => Container(
              margin: EdgeInsets.only(bottom: 10),
              child: Text(
                '$item',
                style: TextStyle(fontSize: 15),
              ),
            ))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: DefaultTabController(
          length: titleList.length,
          child: _getNestedScrollView(tabBar),
        ),
      ),
    );
  }

  Widget _getNestedScrollView(Widget tabBar) {
    String hintText = '用一部电影来形容你的2018';
    return NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverToBoxAdapter(
              child: Container(
                color: Colors.white,
                padding: const EdgeInsets.all(10.0),
                child: SearchTextFieldWidget(
                  hintText: hintText,
                  onTap: () {},
                ),
              ),
            ),
            SliverPersistentHeader(
                floating: true,
                pinned: true,
                delegate: _SliverAppBarDelegate(
                    maxHeight: 49.0,
                    minHeight: 49.0,
                    child: Container(
                      color: Colors.white,
                      child: tabBar,
                    )))
          ];
        },
        body: TabBarView(
          controller: _tabController,
          children: <Widget>[
            MovicePageWidget(),
            Text('22222'),
            Text('3333'),
            Text('444'),
            Text('555'),
            Text('666'),
          ],
        ));
  }
}

class HomePageTabBar extends StatefulWidget {
  HomePageTabBar({Key key}) : super(key: key);
  @override
  _HomePageTabBarState createState() => _HomePageTabBarState();
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(
      {@required this.minHeight,
      @required this.maxHeight,
      @required this.child});

  final double minHeight;
  final double maxHeight;
  final Widget child;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return child;
  }

  @override
  // TODO: implement maxExtent
  double get maxExtent => math.max((minExtent ?? kToolbarHeight), minExtent);

  @override
  // TODO: implement minExtent
  double get minExtent => minHeight;

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}

class _HomePageTabBarState extends State<HomePageTabBar> {
  Color selectColor, unselectedColor;
  TextStyle selectStyle, unselectedStyle;

  @override
  void initState() {
    super.initState();
    selectColor = Colors.black;
    unselectedColor = Color.fromARGB(255, 117, 117, 117);
    selectStyle = TextStyle(fontSize: 18, color: selectColor);
    unselectedStyle = TextStyle(fontSize: 18, color: selectColor);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10.0, bottom: 10.0),
      child: TabBar(
        tabs: tabList,
        isScrollable: true,
        controller: _tabController,
        indicatorColor: selectColor,
        labelColor: selectColor,
        labelStyle: selectStyle,
        unselectedLabelColor: unselectedColor,
        unselectedLabelStyle: unselectedStyle,
        indicatorSize: TabBarIndicatorSize.label,
      ),
    );
  }
}

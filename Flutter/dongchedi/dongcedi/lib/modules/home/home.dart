import 'package:flutter/material.dart';
import 'package:dongcedi/utils/screen_utils.dart';
import 'package:dongcedi/modules/home/attendion/attendion.dart';
import 'find/home_find_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

var _tabs = ["关注", '发现', "车友圈"];

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return _getWidget(context);
  }

  DefaultTabController _getWidget(BuildContext context) {
    return DefaultTabController(
        length: _tabs.length,
        initialIndex: 0,
        child: Container(
          child: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverOverlapAbsorber(
                  handle:
                      NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                  child: SliverAppBar(
                    backgroundColor: Colors.white,
                    title: Container(
                      color: Colors.white,
                      width: 300,
                      child: TabBar(
                        unselectedLabelColor: Colors.grey,
                        labelStyle: TextStyle(fontSize: 18),
                        unselectedLabelStyle: TextStyle(fontSize: 16),
                        labelColor: Colors.black,
                        indicatorColor: Colors.yellow,
                        tabs: <Widget>[
                          Text("关注"),
                          Text("发现"),
                          Text("车友圈"),
                        ],
                      ),
                    ),
                    pinned: true,
                    floating: false,
                    centerTitle: true,
                    bottom: PreferredSize(
                      preferredSize: Size.fromHeight(40),
                      child: Container(
                        color: Colors.white,
                        height: 40,
                        width: ScreenUtils.screenW(context),
                        child: Container(
                          alignment: Alignment(0.0, 0.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(17)),
                            child: Container(
                              width: (ScreenUtils.screenW(context) - 30),
                              height: ScreenUtils.get375Width(context, 35),
                              color: Color.fromARGB(243, 243, 243, 243),
                              child: Center(
                                child: Row(
                                  children: <Widget>[
                                    Expanded(
                                      flex: 1,
                                      child: Icon(
                                        Icons.search,
                                        color: Color.fromARGB(255, 128, 128, 128),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 8,
                                      child: Text(
                                        '宝马五系开启预售',
                                        style: TextStyle(color:  Color.fromARGB(255, 128, 128, 128)),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ];
            },
            body: TabBarView(
              children: <Widget>[
                AttendionPage(),
                HomeFindPage(),
                Container(),
              ],
            ),
          ),
        ));
  }
}

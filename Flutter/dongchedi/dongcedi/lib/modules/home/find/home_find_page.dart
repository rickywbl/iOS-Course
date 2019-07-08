import 'package:dongcedi/utils/screen_utils.dart';
import 'package:flutter/material.dart';
import 'home_find_recommend_widget.dart';

class HomeFindPage extends StatefulWidget {
  @override
  _HomeFindPageState createState() => _HomeFindPageState();
}

class _HomeFindPageState extends State<HomeFindPage>
    with SingleTickerProviderStateMixin {
  List<String> titles = ['推荐', '精选', '视频'];

  List<Tab> tabs = [
    Tab(
      text: '精选',
    ),
    Tab(
      text: '推荐',
    ),
    Tab(
      text: '视频',
    ),
    Tab(
      text: '新车',
    ),
      Tab(
      text: 'SUV',
    ),
      Tab(
      text: '导购',
    ),
      Tab(
      text: '新能源车',
    ),
      Tab(
      text: '中国品牌',
    ),
  ];
  TabController _tabController;
  int selectIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(initialIndex: 0,length: tabs.length,vsync: this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: kToolbarHeight + 40),
      child: DefaultTabController(
        initialIndex: 0,
        length: tabs.length,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            title: TabBar(
              indicatorColor: Colors.white,
              labelColor: Colors.black,
              isScrollable: true,
              unselectedLabelColor: Color.fromARGB(255, 200, 200, 200),
              tabs: tabs,
              onTap: (index){
                setState(() {
                  selectIndex = index;
                });
              },
            ),
          ),
          body: getBody(selectIndex)
        ),
      )
    );
  }

  Widget getBody(int index){
    return Container(
      child: Stack(
        children: <Widget>[
          Offstage(
            offstage: !(index == 0),
             child: HomeFindBestWidget(),
          ),
          Offstage(
            offstage: !(index == 1),
            child: HomeFindRecommendWidget(),
          ),
           Offstage(
            offstage: !(index == 2),
            child: HomeFindVideoWidget(),
          ),
        ],
      ),
    );
  }
}

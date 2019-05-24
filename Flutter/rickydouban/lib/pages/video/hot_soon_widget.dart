import 'package:flutter/material.dart';

typedef HotSoonCallBack = void Function(int index);

class HotSoonWidget extends StatefulWidget {
  final state = _HotSoonWidgetState();
  HotSoonWidget({Key key, HotSoonCallBack onTapCallBack}) : super(key: key) {
    state.setTapCallBack(onTapCallBack);
  }
  @override
  State<StatefulWidget> createState() {
    return state;
  }
}

List<String> titles = ['影院热映', '即将上映'];

class _HotSoonWidgetState extends State<HotSoonWidget>
    with SingleTickerProviderStateMixin {
  int movieCount = 30;
  TabController _tabController;
  HotSoonCallBack onTapCallBack;
  Widget tabBar;
  int selectIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 2);
    _tabController.addListener(listener);
    tabBar = TabBar(
      tabs: [
        Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Text(
            '影院热映',
            style: TextStyle(
              fontSize: 18,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Text('即将上映',
              style: TextStyle(
                fontSize: 18,
              )),
        )
      ],
      indicatorColor: Colors.black,
      labelColor: Colors.black,
      unselectedLabelColor: Colors.grey,
      controller: _tabController,
    );
  }

  setmovieCount(int count) {
    setState(() {
      movieCount = count;
    });
  }

  void listener() {
    if (_tabController.indexIsChanging) {
      var index = _tabController.index;
      selectIndex = index;
      setState(() {
        if (onTapCallBack != null) {
          onTapCallBack(index);
        }
      });
    }
  }

  @override
  void dispose() {
    _tabController.dispose();
    _tabController.removeListener(listener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            child: tabBar,
            flex: 4,
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: EdgeInsets.only(right: 0),
              child: Text(
                '全部 $movieCount > ',
                textAlign: TextAlign.end,
                style: TextStyle(
                    fontSize: 12,
                    color: Colors.black,
                    fontWeight: FontWeight.normal),
              ),
            ),
          )
        ],
      ),
    );
  }

  void setTapCallBack(HotSoonCallBack onTapCallBack) {
    this.onTapCallBack = onTapCallBack;
  }
}

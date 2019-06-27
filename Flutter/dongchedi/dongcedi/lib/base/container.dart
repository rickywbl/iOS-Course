import 'package:flutter/material.dart';
import 'package:dongcedi/modules/home/home.dart';
import 'package:dongcedi/modules/choose/choose.dart';

class ContainerPage extends StatefulWidget {
  @override
  _ContainerPageState createState() => _ContainerPageState();
}

class _ContainerPageState extends State<ContainerPage> {
  var items = ['首页', '选车', '', '用车', '未登录'];
  int selectIndex = 0;
  List<BottomNavigationBarItem> barItems;
  List<Widget> pages;
  @override
  void initState() {
    super.initState();
    if (pages == null) {
      pages = [
        HomePage(),
        ChooseCarPage(),
        Container(
          color: Colors.orange,
        ),
        Container(
          color: Colors.pink,
        ),
        Container(
          color: Colors.green,
        ),
      ];
    }

    if (barItems == null) {
      barItems = [
        BottomNavigationBarItem(
          title: Text("首页"),
          icon: Image.asset(''),
        ),
        BottomNavigationBarItem(
          title: Text("选车"),
          icon: Image.asset(''),
        ),
        BottomNavigationBarItem(
          title: Text(""),
          icon: new Icon(Icons.add),
        ),
        BottomNavigationBarItem(
          title: Text("用车"),
          icon: Image.asset(''),
        ),
        BottomNavigationBarItem(
          title: Text("未登录"),
          icon: Image.asset(''),
        ),
      ];
    }
  }

  _getPageWidget(int index) {
    return Offstage(
      offstage: selectIndex != index,
      child: TickerMode(
        enabled: selectIndex == index,
        child: pages[index],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          unselectedItemColor: Colors.grey,
          fixedColor: Colors.black,
          items: barItems,
          iconSize: 20,
          currentIndex: selectIndex,
          selectedFontSize: 16,
          unselectedFontSize: 16,
          type: BottomNavigationBarType.fixed,
          onTap: (index) {
            setState(() {
              selectIndex = index;
            });
          },
        ),
        body: Stack(
          children: <Widget>[
            _getPageWidget(0),
            _getPageWidget(1),
            _getPageWidget(2),
            _getPageWidget(3),
            _getPageWidget(4),
          ],
        ),
      ),
    );
  }
}


import 'package:flutter/material.dart';
import 'home_app_bar.dart' as myapp;
import 'package:rickydouban/widget/search_text_field_widget.dart';
import 'package:rickydouban/bean/subject_entity.dart';
import 'package:rickydouban/http/API.dart';
import 'package:rickydouban/http/http_request.dart';
import 'package:rickydouban/http/mock_request.dart';
import 'dart:async';
import 'package:rickydouban/utils/user_namager.dart';

var _tabs = ['动态', '推荐'];

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return getWidget();
  }

  DefaultTabController getWidget() {
    return DefaultTabController(
      initialIndex: 1,
      length: _tabs.length,
      child: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverOverlapAbsorber(
              handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
              child: myapp.SliverAppBar(
                pinned: true,
                expandedHeight: 120.0,
                primary: true,
                titleSpacing: 0.0,
                backgroundColor: Colors.white,
                // 通过这个属性设置 AppBar 的背景
                flexibleSpace: FlexibleSpaceBar(
                    collapseMode: CollapseMode.pin,
                    background: Container(
                      color: Colors.green,
                      child: SearchTextFieldWidget(
                        hintText: '我的读书趣味转变史',
                        margin: const EdgeInsets.only(left: 15.0, right: 15.0),
                      ),
                      alignment: Alignment(0.0, 0.0),
                    )),
                bottomTextString: _tabs,
                bottom: TabBar(
                  tabs: <Widget>[],
                ),
              ),
            )
          ];
        },
        body: TabBarView(
          children: _tabs
              .map((String name) => Container(
                    child: SliverContainer(
                      name: name,
                    ),
                  ))
              .toList(),
        ),
      ),
    );
  }
}

class SliverContainer extends StatefulWidget {
  final String name;
  SliverContainer({Key key, @required this.name}) : super(key: key);
  @override
  _SliverContainerState createState() => _SliverContainerState();
}

class _SliverContainerState extends State<SliverContainer> {
  List<Subject> list;
  @override
  void initState() {
    super.initState();
    if (list == null || list.isEmpty) {
      if (_tabs[0] == widget.name) {
        requestAPI();
      } else {
        requestAPI();
      }
    }
  }

  Future requestAPI() async {
    var _request = MockRequest();
    var result = await _request.get(API.TOP_250);
    list = SubjectResp.fromJson(result).subjects;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    if ( _tabs[0] ==  widget.name){
      if (!UserManager().islogin) {
        return _loginContainer(context);
      }
    }

    return Container();
  }

  Widget _loginContainer(BuildContext context) {
    return Align(
      alignment: Alignment(0.0, 0.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset('assets/images/ic_new_empty_view_default.png',width: 160,),
          Padding(
            padding: EdgeInsets.only(top: 10),
            child:     Text(
            '登录后查看关注人动态',
            style: TextStyle(
                fontSize: 18, color: Color.fromARGB(255, 160, 160, 160)),
            ),
          ),
          GestureDetector(
            onTap: (){
              print('去登录');
            },
            child: Container(
              width: 100,
              height: 35,
              margin: EdgeInsets.only(top: 15),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                border: Border.all(color: Colors.green),
              ),
              child: Text(
                '去登录',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, color: Colors.green),
              ),
            ),
          )
        ],
      ),
    );
  }
}

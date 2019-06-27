import 'package:dongcedi/modules/home/attendion/bean/attendion_video_bean.dart';
import 'package:dongcedi/utils/screen_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'widget/attendion_author.dart';
import 'package:dongcedi/http/api.dart';
import 'attendion_bean.dart';

class AttendionPage extends StatefulWidget {
  @override
  _AttendionPageState createState() => _AttendionPageState();
}

class _AttendionPageState extends State<AttendionPage> {
  ScrollController _controller;
  List attendionList = [];
  List attendionVideoList = [];
  @override
  void initState() {
    super.initState();
    _controller = ScrollController();
    API().getAttendion((response) {
      Resp resp = response;
      if (resp.data.list.length > 0) {
        setState(() {
          attendionList = resp.data.list[0].info.card_content.users;
        });
      }
    });

    API().getAttendionVideo((response) {
      VideoResp resp = response;
      if (resp.data.length > 0) {
        setState(() {
          attendionVideoList = resp.data;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: CustomScrollView(
      controller: _controller,
      shrinkWrap: true,
      slivers: <Widget>[
        // 占位置 修改pinned的0坐标的问题
        SliverOverlapInjector(
          handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
        ),
        // 关注作者List
        SliverList(
          delegate:
              SliverChildBuilderDelegate((BuildContext context, int index) {
            if (index < attendionList.length) {
              return AuthorCell(
                attendion: attendionList[index],
              );
            }
            return CharMoreAuthorCell();
          }, childCount: attendionList.length + 1),
        ),

        SliverList(
          delegate:
              SliverChildBuilderDelegate((BuildContext context, int index) {
            return AttendionCell(video: attendionVideoList[index],);
          }, childCount: attendionVideoList.length),
        )
      ],
    ));
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}

import 'package:flutter/material.dart';
import 'title_widget.dart';
import 'package:rickydouban/utils/screen_utils.dart';
import 'package:rickydouban/http/API.dart';
import 'dart:math' as math;
import 'hot_soon_widget.dart';
import 'package:rickydouban/bean/subject_entity.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:rickydouban/widget/star_average_widget.dart';
import 'package:rickydouban/widget/movie_photo_widget.dart';
import 'coming_soon_item.dart';

final API _api = API();

class MovicePageWidget extends StatefulWidget {
  @override
  _MovicePageWidgetState createState() => _MovicePageWidgetState();
}

class _MovicePageWidgetState extends State<MovicePageWidget>
    with AutomaticKeepAliveClientMixin {
  List<String> todayImages = [];
  Color backgroundColor;
  List<Subject> hotMoviceBeans = [];
  List<Subject> comingSoonMoviceBeans = [];
  List soonMoviceBeans;
  HotSoonWidget hotSoonWidget;
  int selectIndex = 0;
  @override
  void initState() {
    super.initState();
    hotSoonWidget = HotSoonWidget(
      onTapCallBack: (index) {
        setState(() {
          selectIndex = index;
        });
      },
    );
    _requresAPI();
  }

  void _requresAPI() {
    API().getTodayPlay((map) {
      setState(() {
        todayImages = map['list'];
        backgroundColor = map['todayPlayBg'];
      });
    });

    API().getHotSoon((map) {
      setState(() {
        hotMoviceBeans = map['list'];
      });
    });

    API().getComingSoon((map){
      setState(() {
        comingSoonMoviceBeans = map['list'];
      });
    });
  }

  Widget _getTodayBroadCast() {
    if (todayImages.length == 3) {
      return TodayBroadCastWiedget(
        todayImages: todayImages,
        backgroundColor: backgroundColor,
      );
    }
    return Container(
      color: Colors.black26,
      width: ScreenUtils.screenW(context) - 30,
      height: 180.0,
      margin: EdgeInsets.fromLTRB(15, 25, 15, 15),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
      child: CustomScrollView(
        shrinkWrap: true,
        slivers: <Widget>[
          SliverToBoxAdapter(
            child: MovieTopItemTabBar(),
          ),
          SliverToBoxAdapter(
            child: _getTodayBroadCast(),
          ),
          SliverToBoxAdapter(
            child: hotSoonWidget,
          ),
          SliverGrid(
            delegate:
                SliverChildBuilderDelegate((BuildContext context, int index) {
              return Stack(
                children: <Widget>[
                  Offstage(
                    child: HotMovieItem(
                      subject: hotMoviceBeans[index],
                    ),
                    offstage: !(selectIndex == 0),
                  ),
                  Offstage(
                    child: CommingSoonItemWidget(
                      subject: comingSoonMoviceBeans[index],
                    ),
                    offstage: !(selectIndex == 1),
                  )
                ],
              );
            }, childCount: math.min(_getChildCount(), 6)),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 10.0,
              mainAxisSpacing: 0.0,
              childAspectRatio: _getAspectRatio()
            ),
          )
        ],
      ),
    );
  }

  double _getAspectRatio(){
     if ( selectIndex == 0){
      return 0.45;
    }else{
      return 0.4;
    }
  }
  int _getChildCount(){
    if ( selectIndex == 0){
      return hotMoviceBeans.length;
    }else{
      return comingSoonMoviceBeans.length;
    }
  }

  @override
  // TODO: implement wantKeepAliveRR
  bool get wantKeepAlive => true;
}

class HotMovieItem extends StatefulWidget {
  final Subject subject;
  HotMovieItem({Key key, this.subject}) : super(key: key);
  @override
  _HotMovieItemState createState() => _HotMovieItemState();
}

class _HotMovieItemState extends State<HotMovieItem> {
  @override
  Widget build(BuildContext context) {
    final width = (ScreenUtils.screenW(context) - 30) / 3.0;
    return Container(
      margin: EdgeInsets.only(top: 10),
      width: width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          MoviePhotoWidget(imageUrl: widget.subject.images.large, width: width,),
          Padding(
            padding: EdgeInsets.only(top: 5),
            child: Text(
              widget.subject.title,
              softWrap: false,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              textAlign: TextAlign.left,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          StarAverageWidget(stars: widget.subject.rating.stars,average: widget.subject.rating.average.toString(),)
        ],
      ),
    );
  }
}

class TodayBroadCastWiedget extends StatefulWidget {
  final List<String> todayImages;
  final Color backgroundColor;
  TodayBroadCastWiedget({Key key, this.todayImages, this.backgroundColor})
      : super(key: key);
  @override
  _TodayBroadCastWiedgetState createState() => _TodayBroadCastWiedgetState();
}

class _TodayBroadCastWiedgetState extends State<TodayBroadCastWiedget> {
  @override
  void initState() {
    super.initState();
  }

  getTodayImage(String url, int index) {
    return Positioned(
        left: 20.0 * index + 15 + 90 * (1 - math.pow(0.9, index)),
        bottom: 15,
        child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(30)),
              shape: BoxShape.rectangle,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5.0),
              child: Image.network(
                url,
                fit: BoxFit.cover,
                width: 90 * math.pow(0.9, index),
                height: 160 * math.pow(0.9, index),
              ),
            )));
  }

  var contentHeight = 180.0;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtils.screenW(context) - 30,
      height: contentHeight,
      margin: EdgeInsets.fromLTRB(0, 25, 0, 15),
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Positioned(
            top: 20,
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              color: widget.backgroundColor,
            ),
          ),
          getTodayImage(widget.todayImages[2], 2),
          getTodayImage(widget.todayImages[1], 1),
          getTodayImage(widget.todayImages[0], 0),
          Positioned(
              width: 40,
              height: 40,
              left: 15.0 + 45.0 - 20.0,
              bottom: contentHeight / 2.0 - 20.0,
              child: Image.asset(
                "assets/images/ic_action_playable_video_s.png",
                fit: BoxFit.cover,
                width: 40,
                height: 40,
              )),
          Positioned(
            right: 25,
            bottom: 50,
            child: Column(
              children: <Widget>[
                Text(
                  "今日可播放电影已更新",
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 5),
                  child: Text(
                    "全部 30 >",
                    style: TextStyle(fontSize: 14, color: Colors.white),
                  ),
                )
              ],
            ),
          ),
          Positioned(
            right: 5,
            bottom: 5,
            child: Container(
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(right: 3),
                    child: Image.asset(
                      'assets/images/sofa.png',
                      width: 15.0,
                      height: 15.0,
                    ),
                  ),
                  Text(
                    '看电影',
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

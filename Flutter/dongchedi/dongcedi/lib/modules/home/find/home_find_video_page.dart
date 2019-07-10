import 'dart:math';
import 'package:dongcedi/modules/home/find/bean/banner_bean.dart';
import 'package:dongcedi/utils/screen_utils.dart';
import 'package:flutter/material.dart';
import 'package:dongcedi/http/api.dart';
import '../attendion/bean/attendion_video_bean.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_easyrefresh/ball_pulse_header.dart';
import 'package:flutter_easyrefresh/ball_pulse_footer.dart';
import 'package:cached_network_image/cached_network_image.dart';

//发现视频
class HomeFindVideoWidget extends StatefulWidget {
  @override
  _HomeFindVideoWidgetState createState() => _HomeFindVideoWidgetState();
}

class _HomeFindVideoWidgetState extends State<HomeFindVideoWidget> {
  int currentPage = 1;
  List<VideoInfoBean> videos;
  GlobalKey<EasyRefreshState> _easyRefreshKey =
      new GlobalKey<EasyRefreshState>();
  GlobalKey<RefreshHeaderState> _headerKey =
      new GlobalKey<RefreshHeaderState>();
  GlobalKey<RefreshFooterState> _footerKey =
      new GlobalKey<RefreshFooterState>();
  @override
  void initState() {
    super.initState();
    getHttpRequest();
  }

  getHttpRequest(){
    currentPage = 1;
    Map parms = {"refresh_num":'$currentPage',"loadmore_num":'0',"feed_type":'0',"new_feed":'1'};
    API().getVideoChannel(parms, (resp){
      setState(() {
        videos = resp['videos'];
      });
    });
  }

  loadMore(){
    currentPage ++;
    Map parms = {"refresh_num":'$currentPage',"loadmore_num":'0',"feed_type":'0',"new_feed":'1'};
    API().getVideoChannel(parms, (resp){
      setState(() {
        videos.addAll(resp['videos']) ;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: EasyRefresh(
        key: _easyRefreshKey,
        refreshHeader: BallPulseHeader(
          color: Colors.yellow,
          key: _headerKey,
        ),
        onRefresh: (){
          getHttpRequest();
        },
        refreshFooter: BallPulseFooter(
          key: _footerKey,
          color: Colors.yellow,
        ),
        loadMore: (){
          loadMore();
        },
        child: ListView.builder(
          itemCount: videos.length,
          itemBuilder: (context,index){
            VideoInfoBean video = videos[index];
            return FindVideo(videoInfo: video,);
          },
        ),
      ),
    );
  }
}

class FindVideo extends StatefulWidget {
  final VideoInfoBean videoInfo;
  FindVideo({Key key, this.videoInfo}) : super(key: key);
  _FindVideoState createState() => _FindVideoState();
}

class _FindVideoState extends State<FindVideo> {
  @override
  Widget build(BuildContext context) {
    double imageHeight = widget.videoInfo.imageList[0].height.toDouble() / widget.videoInfo.imageList[0].width.toDouble() * ScreenUtils.screenW(context);
    return Container(
      child: Container(
        height: imageHeight + 60,
        color: Colors.white,
        child: Column(
          children: <Widget>[
            Container(
              height: imageHeight,
              child: Stack(
                children: <Widget>[
                  Positioned(
                    top: 0,
                    left: 0,
                    child: CachedNetworkImage(
                      imageUrl: widget.videoInfo.repostInfo.imageUrl,
                      height: imageHeight,
                    ),
                  ),
                  Positioned(
                    top: 10,
                    left: 15,
                    child: Container(
                      width: ScreenUtils.screenW(context) - 30,
                      child: Text(widget.videoInfo.title , style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),),
                    ),
                  ),
                  Positioned(
                    top: (imageHeight - 50) / 2.0,
                    left: (ScreenUtils.screenW(context) - 50) / 2.0,
                    child: Container(
                      width: 50,
                      height: 50,
                      child: Image.asset('assets/images/playicon_video.png' , width: 50, height: 50,),
                    ),
                  )
                ],
              ),
            ),
            Container(
              height: 50,
              padding: EdgeInsets.only(left: 15, top: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    child: Container(
                      child: CachedNetworkImage(
                        width: 40,
                        height: 40,
                        imageUrl: widget.videoInfo.userInfo.avatarUrl,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10),
                    child: Text(widget.videoInfo.userInfo.name),
                  ),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.only(right: 15),
                    child: Row(
                    children: <Widget>[
                      Icon(Icons.games),
                      Container(
                        margin: EdgeInsets.only(left: 5),
                        child: Text(widget.videoInfo.diggCount.toString()),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 10),
                        child: Icon(Icons.comment),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 5),
                        child: Text(widget.videoInfo.commentCount.toString()),
                      ),
                       Container(
                        margin: EdgeInsets.only(left: 10),
                        child: Icon(Icons.more),
                      ),
                    ],
                  ),
                  )

                ],
              ),
            ),
            Container(
              height: 10,
            )
          ],
        ),
      ),
    );
  }
}
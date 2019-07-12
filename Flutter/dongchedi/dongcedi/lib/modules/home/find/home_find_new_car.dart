import 'package:dongcedi/modules/home/find/bean/banner_bean.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:cached_network_image/cached_network_image.dart';
import 'bean/new_car_recommend_bean.dart';
import 'package:dongcedi/http/api.dart';
import 'home_find_video_cell.dart';

import 'package:flutter_easyrefresh/ball_pulse_header.dart';
import 'package:flutter_easyrefresh/ball_pulse_footer.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:dongcedi/router/router.dart';

class FindNewCarPage extends StatefulWidget {
  @override
  _FindNewCarPageState createState() => _FindNewCarPageState();
}

class _FindNewCarPageState extends State<FindNewCarPage> {
  List<RecommendNewCarBean> cars = [];
  List<VideoInfoBean> news = [];
  int currentIndex = 1;

  GlobalKey<EasyRefreshState> _easyRefreshKey =
      new GlobalKey<EasyRefreshState>();
  GlobalKey<RefreshHeaderState> _headerKey =
      new GlobalKey<RefreshHeaderState>();
  GlobalKey<RefreshFooterState> _footerKey =
      new GlobalKey<RefreshFooterState>();
  @override
  void initState() {
    super.initState();
    getAPiRequest();
  }

  getAPiRequest() {
    currentIndex = 1;
    API().getNewCarRecommend((resp) {
      if (mounted) {
        setState(() {
          cars = resp['cars'];
        });
      }
    });

    API().getNewCarNews({
      "refresh_num": currentIndex,
      "loadmore_num": 0,
      "feed_type": 0,
      "new_feed": true
    }, (resp) {
      if (mounted) {
        setState(() {
          news = resp;
        });
      }
    });
  }

  loadMore() {
    currentIndex++;
    API().getNewCarRecommend((resp) {
      if (mounted) {
        setState(() {
          cars = resp['cars'];
        });
      }
    });

    API().getNewCarNews({
      "refresh_num": currentIndex,
      "loadmore_num": 0,
      "feed_type": 0,
      "new_feed": true
    }, (resp) {
      if (mounted) {
        setState(() {
          news.addAll(resp);
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: EasyRefresh(
        key: _easyRefreshKey,
        refreshHeader: BallPulseHeader(
          key: _headerKey,
          color: Colors.yellow,
        ),
        onRefresh: () {
          getAPiRequest();
        },
        refreshFooter: BallPulseFooter(
          key: _footerKey,
          color: Colors.yellow,
        ),
        loadMore: () {
          loadMore();
        },
        child: ListView.builder(
          itemBuilder: (context, index) {
            if (index == 0) {
              return RecommendNewCarCell(cars: cars);
            }
            return HomeVideoThreeImageCell(
              info: news[index - 1],
            );
          },
          itemCount: news.length + 1,
        ),
      ),
    );
  }
}

// 新车推荐
class RecommendNewCarCell extends StatefulWidget {
  final List<RecommendNewCarBean> cars;
  RecommendNewCarCell({Key key, this.cars}) : super(key: key);
  @override
  _RecommendNewCarCellState createState() => _RecommendNewCarCellState();
}

class _RecommendNewCarCellState extends State<RecommendNewCarCell> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onTap: (){
      //   Router.pushWithParams(context, Router.carDetailPage, params:{'seriesId':widget.cars.});
      // },
      child: Container(
        margin: EdgeInsets.only(top: 15, left: 15, right: 15),
        height: 200,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              height: 40,
              child: Text(
                "新车推荐",
                style: TextStyle(
                    fontSize: 17,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              height: 160,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: widget.cars.length,
                itemBuilder: (context, index) {
                  RecommendNewCarBean car = widget.cars[index];
                  return Container(
                    height: 130,
                    width: 160,
                    margin: EdgeInsets.only(top: 5, bottom: 5, right: 10),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Color.fromRGBO(200, 200, 200, 1.0),
                          width: 0.5,
                        ),
                      ),
                      child: Column(
                        children: <Widget>[
                          Container(
                            height: 80,
                            padding: EdgeInsets.only(top: 5),
                            child: CachedNetworkImage(
                              imageUrl: car.coverUrl,
                              height: 75,
                              width: 150,
                            ),
                          ),
                          Container(
                            child: Text(
                              car.seriesName,
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                            child: Text(
                              car.price,
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.orange,
                              ),
                            ),
                          ),
                          Container(
                            child: Text(
                              car.onlineData,
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.black,
                              ),
                            ),
                          )
                        ],
                      ),
                      //   color: Color.fromRGBO(Random().nextInt(255), Random().nextInt(255), Random().nextInt(255), 1.0),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

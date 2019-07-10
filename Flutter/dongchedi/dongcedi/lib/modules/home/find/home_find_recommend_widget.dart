import 'package:dongcedi/utils/screen_utils.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:banner_view/banner_view.dart';
import 'package:dongcedi/modules/home/find/bean/banner_bean.dart';
import 'package:dongcedi/http/api.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'dart:math';
import 'home_find_video_cell.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_easyrefresh/ball_pulse_header.dart';
import 'package:flutter_easyrefresh/ball_pulse_footer.dart';

//发现推荐模块
class HomeFindRecommendWidget extends StatefulWidget {
  @override
  _HomeFindRecommendWidgetState createState() =>
      _HomeFindRecommendWidgetState();
}

class _HomeFindRecommendWidgetState extends State<HomeFindRecommendWidget> {
  GlobalKey<EasyRefreshState> _easyRefreshKey =
      new GlobalKey<EasyRefreshState>();
  GlobalKey<RefreshHeaderState> _headerKey =
      new GlobalKey<RefreshHeaderState>();
  GlobalKey<RefreshFooterState> _footerKey =
      new GlobalKey<RefreshFooterState>();

  int dataSelectedIndex = 0;
  ScrollController _scrollController;
  double itemWidth;

  List<Tab> tabs = [
    Tab(
      child: Text('昨天'),
    ),
    Tab(
      child: Text('7-9'),
    ),
    Tab(
      child: Text('7-10'),
    ),
  ];
  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener((){

    });
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    itemWidth = ScreenUtils.screenW(context) - 50;
    return Container(
      child: EasyRefresh(
          key: _easyRefreshKey,
          refreshHeader: BallPulseHeader(
            color: Colors.yellow,
            key: _headerKey,
          ),
          onRefresh: () {},
          child: ListView.builder(
            itemCount: 20,
            itemBuilder: (context, index) {
              if (index == 0) {
                return Container(
                  height: 60,
                  child: ListView.builder(
                    itemCount: 7,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          setState(() {
                            dataSelectedIndex = index;
                          });
                        _scrollController.animateTo(itemWidth* 2 * dataSelectedIndex, duration: Duration(seconds: 1), curve: Curves.ease);
                        },
                        child: HomeDataCell(
                          title: '7月' + index.toString() + '日',
                          selected: dataSelectedIndex == index ? true : false,
                        ),
                      );
                    },
                  ),
                );
              }
              if (index == 1) {
                return Container(
                  height: 150,
                  width: ScreenUtils.screenW(context),
                  child: ListView.builder(
                    controller: _scrollController,
                    scrollDirection: Axis.horizontal,
                    itemCount: 7,
                    itemBuilder: (context,index){
                      return FindRecommendDataVideoCell(videos: ['111','22'],);
                    },
                  ),
                );
              }
              return Text('Row ++++++' + index.toString());
            },
          )),
    );
  }
}

//发现精选模块
class HomeFindBestWidget extends StatefulWidget {
  @override
  _HomeFindBestWidgetState createState() => _HomeFindBestWidgetState();
}

class _HomeFindBestWidgetState extends State<HomeFindBestWidget> with AutomaticKeepAliveClientMixin{
  List<BannerBean> banners;
  List<IconBean> icons;
  List<VideoInfoBean> videoInfos;
  int itemCount = 0;
  int otherCount = 0;
  bool isLoading = false;

  GlobalKey<EasyRefreshState> _easyRefreshKey =
      new GlobalKey<EasyRefreshState>();
  GlobalKey<RefreshHeaderState> _headerKey =
      new GlobalKey<RefreshHeaderState>();
  GlobalKey<RefreshFooterState> _footerKey =
      new GlobalKey<RefreshFooterState>();

  @override
  void initState() {
    super.initState();
    getApiRequest();
  }

  getApiRequest() {
    isLoading = true;
    API().getBanner((resp) {
      setState(() {
        banners = resp['banners'];
        icons = resp['icons'];
        videoInfos = resp['videos'];
        int count = videoInfos == null ? 0 : videoInfos.length;
        int count2 = 0;
        if (banners != null) {
          count = count + 1;
          count2 = count2 + 1;
        }
        if (icons != null) {
          count = count + 1;
          count2 = count2 + 1;
        }
        itemCount = count;
        otherCount = count2;
        isLoading = false;
      });
    });
  }

  getBannerItemWidgets() {
    return banners.map((BannerBean bean) {
      return Container(
        child: CachedNetworkImage(
          imageUrl: bean.imageUrl,
        ),
      );
    }).toList();
  }

  getBannerWidget() {
    return banners == null
        ? Container()
        : Container(
            height: ScreenUtils.get375Width(context, 150),
            child: BannerView(
              getBannerItemWidgets(),
              indicatorBuilder: (context, indicator) {
                return _indicatorContainer(indicator);
              },
              animationDuration: Duration(milliseconds: 20000),
              indicatorNormal: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(3)),
                child: Container(
                  color: Colors.grey,
                  width: 6,
                  height: 6,
                ),
              ),
              indicatorSelected: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(3)),
                child: Container(
                  color: Colors.white,
                  width: 12,
                  height: 6,
                ),
              ),
              autoRolling: false,
            ),
          );
  }

  _indicatorContainer(Widget indicator) {
    var container = new Container(
      height: 30.0,
      child: new Stack(
        children: <Widget>[
          new Opacity(
            opacity: 0.5,
            child: new Container(),
          ),
          new Align(
            alignment: Alignment.center,
            child: indicator,
          ),
        ],
      ),
    );
    return new Align(
      alignment: Alignment.bottomCenter,
      child: container,
    );
  }

  @override
  Widget build(BuildContext context) {
    return isLoading? Container(
      child: Center(child: CircularProgressIndicator(),),
    ): Container(
        margin: EdgeInsets.all(0),
        padding: EdgeInsets.only(left: 15, right: 15, top: 10),
        child: EasyRefresh(
          key: _easyRefreshKey,
          refreshHeader: BallPulseHeader(
            key: _headerKey,
            color: Colors.yellow,
          ),
          refreshFooter: BallPulseFooter(
            key: _footerKey,
            color: Colors.yellow,
          ),
          loadMore: () {},
          onRefresh: () {
            getApiRequest();
          },
          child: ListView.builder(
            itemCount: itemCount,
            itemBuilder: (context, index) {
              if (index == 0 && banners != null) {
                return getBannerWidget();
              }
              if (index == 1 && icons != null) {
                return IconWidget(
                  iconBeans: icons,
                );
              }
              return HomeVideoOneImageCell(
                videoInfo: videoInfos[index - otherCount],
              );
            },
          ),
        ));
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}

//发现推荐工具
class IconWidget extends StatefulWidget {
  final List<IconBean> iconBeans;
  IconWidget({Key key, this.iconBeans}) : super(key: key);
  @override
  _IconWidgetState createState() => _IconWidgetState();
}

class _IconWidgetState extends State<IconWidget> {
  PageController _pageController;
  int selectIndex = 0;

  getIconItem(BuildContext context, List<IconBean> icons) {
    return Container(
      height: 80,
      child: Row(
        children: getIcon(icons),
      ),
    );
  }

  getIcon(List<IconBean> icons) {
    var width = (ScreenUtils.screenW(context) - 30) / 4;
    return icons.map((IconBean bean) {
      return Container(
        width: width,
        child: Column(
          children: <Widget>[
            CachedNetworkImage(
              imageUrl: bean.imageUrl,
              width: 30,
              height: 30,
            ),
            Padding(
              padding: EdgeInsets.only(top: 5),
              child: Text(bean.title),
            )
          ],
        ),
      );
    }).toList();
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _pageController.addListener(() {
      setState(() {
        selectIndex = (_pageController.offset.toInt() /
                (ScreenUtils.screenW(context) - 30))
            .toInt();
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
    // _pageController.removeListener(listener);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      height: 80,
      child: Column(
        children: <Widget>[
          Expanded(
            flex: 3,
            child: widget.iconBeans == null
                ? Container()
                : Container(
                    child: PageView.builder(
                    scrollDirection: Axis.horizontal,
                    controller: _pageController,
                    itemCount: 2,
                    itemBuilder: (BuildContext context, int index) {
                      return getIconItem(context,
                          widget.iconBeans.sublist(index * 4, index * 4 + 4));
                    },
                  )),
          ),
          Expanded(
            flex: 1,
            child: Container(
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(3)),
                      child: Container(
                          width: 6,
                          height: 6,
                          color:
                              selectIndex == 0 ? Colors.yellow : Colors.grey),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 5),
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(3)),
                        child: Container(
                            width: 6,
                            height: 6,
                            color:
                                selectIndex == 1 ? Colors.yellow : Colors.grey),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}


class FindRecommendDataVideoCell extends StatefulWidget {
  final List videos;
  FindRecommendDataVideoCell({Key key,this.videos}): super(key:key);
  @override
  _FindRecommendDataVideoCellState createState() => _FindRecommendDataVideoCellState();
}

class _FindRecommendDataVideoCellState extends State<FindRecommendDataVideoCell> {
  int count;
  @override
  void initState() {
    super.initState();
    setState(() {
      count = widget.videos == null ? 1 : widget.videos.length;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: (ScreenUtils.screenW(context) - 50) * count,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.videos.length,
        itemBuilder: (context,index){
          return getItem(index.toString());
        },
      )
    );
  }

  List<Widget> getWidget(){
    return widget.videos.map((item){
      return getItem(item);
    }).toList();
  }
  Widget getItem(String index){
    return Container(
      width: ScreenUtils.screenW(context) - 50,
      color: Color.fromARGB(255,Random().nextInt(255), Random().nextInt(255), Random().nextInt(255)),
      child: Center(
        child: Text('Container ========== ' + index),
      ),
    );
  }
}
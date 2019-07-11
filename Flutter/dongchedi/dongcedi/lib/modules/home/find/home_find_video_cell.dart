import 'package:dongcedi/modules/home/attendion/bean/attendion_video_bean.dart';
import 'package:dongcedi/utils/screen_utils.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import './bean/banner_bean.dart';
import 'package:dongcedi/utils/utils.dart';

//一张图片楼层
class HomeVideoOneImageCell extends StatefulWidget {
  final VideoInfoBean videoInfo;
  HomeVideoOneImageCell({Key key, this.videoInfo}) : super(key: key);
  @override
  _HomeVideoOneImageCellState createState() => _HomeVideoOneImageCellState();
}

class _HomeVideoOneImageCellState extends State<HomeVideoOneImageCell> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(top: 10, bottom: 10),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(right: 10),
                        child: Text(
                          widget.videoInfo.title,
                          maxLines: 2,
                          style: TextStyle(fontSize: 16, color: Colors.black),
                        ),
                      ),
                      Row(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(right: 10, top: 20),
                            child: Container(
                                child: Text(
                              widget.videoInfo.repostInfo.name,
                              maxLines: 1,
                              style:
                                  TextStyle(fontSize: 12, color: Colors.grey),
                            )),
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 10, top: 20),
                            child: Text(
                                widget.videoInfo.commentCount.toString() + '评论',
                                style: TextStyle(
                                    fontSize: 12, color: Colors.grey)),
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 10, top: 20),
                            child: Text(
                                Utils.getTimeStamp(widget.videoInfo.behotTime),
                                style: TextStyle(
                                    fontSize: 12, color: Colors.grey)),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: CachedNetworkImage(
                    width: 120,
                    height: 90,
                    imageUrl: widget.videoInfo.repostInfo.imageUrl == null
                        ? "https://cdn2.jianshu.io/assets/web/nav-logo-4c7bbafe27adc892f3046e6978459bac.png"
                        : widget.videoInfo.repostInfo.imageUrl,
                    placeholder: (BuildContext context, String content) {
                      Container(
                        color: Colors.grey,
                        child: Text(content),
                      );
                    },
                  ),
                )
              ],
            ),
            Container(
              height: 0.5,
              color: Color.fromARGB(200, 200, 200, 200),
              margin: EdgeInsets.only(top: 10),
            )
          ],
        ));
  }
}

class HomeDataCell extends StatelessWidget {
  final String title;
  final bool selected;
  HomeDataCell({Key key, this.title, this.selected}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 100,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            child: Center(
              child: Text(
                title,
                style: TextStyle(
                  color: selected
                      ? Colors.black
                      : Color.fromARGB(255, 170, 170, 170),
                  fontSize: selected ? 15 : 13,
                ),
              ),
            ),
            height: 32,
          ),
          Container(
            height: 8,
            child: Stack(
              children: <Widget>[
                Positioned(
                  left: 0,
                  right: 0,
                  top: 3.5,
                  child: Container(
                    color: Color.fromARGB(200, 200, 200, 200),
                    height: 1,
                  ),
                ),
                Positioned(
                  left: 47.5,
                  top: selected ? 0 : 1,
                  child: ClipRRect(
                    borderRadius:
                        BorderRadius.all(Radius.circular(selected ? 4 : 2.5)),
                    child: Container(
                      color: selected ? Colors.black : Colors.grey,
                      width: selected ? 8 : 5,
                      height: selected ? 8 : 5,
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class HomeVideoThreeImageCell extends StatefulWidget {
  final VideoInfoBean info;
  HomeVideoThreeImageCell({Key key, this.info}) : super(key: key);
  @override
  _HomeVideoThreeImageCellState createState() =>
      _HomeVideoThreeImageCellState();
}

class _HomeVideoThreeImageCellState extends State<HomeVideoThreeImageCell> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 15, left: 15, right: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          widget.info.imageList.length == 3 ?  getTitleImageColumnWidget() : getTitleImageRowWidget(),
          getBottomWidget(),
          Container(
            height: 0.5,
            margin: EdgeInsets.only(top: 5),
            color: Color.fromRGBO(200, 200, 200, 1.0),
          )
        ],
      ),
    );
  }

  getTitleImageRowWidget() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(
          flex: 2,
          child: Container(
            padding: EdgeInsets.only(right: 5),
            child: Text(
              widget.info.title,
              style: TextStyle(fontSize: 17, color: Colors.black),
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Container(
            child: CachedNetworkImage(
              imageUrl: widget.info.imageList[0].url,
              fit: BoxFit.cover,
            ),
          ),
        )
      ],
    );
  }

  getTitleImageColumnWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          child: Text(
            widget.info.title,
            style: TextStyle(fontSize: 17, color: Colors.black),
          ),
        ),
        Container(
          padding: EdgeInsets.only(top: 10),
          width: ScreenUtils.screenW(context) - 30,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: getCarsImageWidget(),
          ),
        ),
      ],
    );
  }

  getTitleImageVideoColumnWidget(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(bottom: 5),
          child: Text(
            widget.info.title,
            style: TextStyle(fontSize: 17, color: Colors.black),
          ),
        ),
        Container(
          width: ScreenUtils.screenW(context) - 30,
          child: CachedNetworkImage(
            fit: BoxFit.cover,
            imageUrl: widget.info.imageList[0].url,
            width: ScreenUtils.screenW(context) - 30,
            height: (widget.info.imageList[0].height / widget.info.imageList[0].width) * (ScreenUtils.screenW(context) - 30),
          ),
        )
      ],
    );
  }

  getBottomWidget() {
    return Container(
      height: 40,
      child: Row(
        children: <Widget>[
          widget.info.label.length == 0
              ? Container()
              : Container(
                  height: 20,
                  padding: EdgeInsets.only(left: 5, right: 5),
                  margin: EdgeInsets.only(right: 5),
                  child: Center(
                    child: Text(
                      widget.info.label,
                      style: TextStyle(color: Colors.red, fontSize: 12),
                    ),
                  ),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.red, width: 0.5),
                      borderRadius: BorderRadius.all(Radius.circular(5))),
                ),
          Container(
            child: Text(
              widget.info.repostInfo.name,
              style: TextStyle(color: Color.fromRGBO(150, 150, 150, 1)),
            ),
          ),
          Container(
              padding: EdgeInsets.only(left: 10),
              child: Text(
                widget.info.commentCount.toString() + '评论',
                style: TextStyle(
                  color: Color.fromRGBO(150, 150, 150, 1),
                ),
              )),
          Container(
              padding: EdgeInsets.only(left: 10),
              child: Text(
                Utils.getTimeStamp(widget.info.behotTime),
                style: TextStyle(
                  color: Color.fromRGBO(150, 150, 150, 1),
                ),
              )),
        ],
      ),
    );
  }

  getCarsImageWidget() {
    return widget.info.imageList.map((item) {
      return Container(
          width: (ScreenUtils.screenW(context) - 30) / 3,
          padding: EdgeInsets.only(right: 10),
          child: CachedNetworkImage(
            fit: BoxFit.cover,
            imageUrl: item.url,
          ));
    }).toList();
  }
}

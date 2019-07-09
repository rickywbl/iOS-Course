import 'dart:ui' as prefix0;

import 'package:dongcedi/modules/home/attendion/bean/attendion_video_bean.dart';
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
                            child: Text(widget.videoInfo.repostInfo.name,
                                style: TextStyle(
                                    fontSize: 12, color: Colors.grey)),
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
                    imageUrl: widget.videoInfo.imageList[0].url,
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

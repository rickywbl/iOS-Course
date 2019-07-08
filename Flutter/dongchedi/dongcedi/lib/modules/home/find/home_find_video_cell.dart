import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

//一张图片楼层
class HomeVideoOneImageCell extends StatefulWidget {
  @override
  _HomeVideoOneImageCellState createState() => _HomeVideoOneImageCellState();
}

class _HomeVideoOneImageCellState extends State<HomeVideoOneImageCell> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 15,right: 15,top: 10),
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 4,
            child: Column(
              children: <Widget>[

              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: CachedNetworkImage(

            ),
          )
        ],
      ),
    );
  }
}
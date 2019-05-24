import 'package:flutter/material.dart';
import 'package:rickydouban/bean/subject_entity.dart';
import 'package:rickydouban/widget/movie_photo_widget.dart';
import 'package:rickydouban/utils/screen_utils.dart';

class CommingSoonItemWidget extends StatefulWidget {
  final Subject subject;
  CommingSoonItemWidget({Key key, this.subject}) : super(key: key);
  @override
  _CommingSoonItemWidgetState createState() => _CommingSoonItemWidgetState();
}

class _CommingSoonItemWidgetState extends State<CommingSoonItemWidget> {

  _getMainlandTime(){
    DateTime time = DateTime.parse(widget.subject.mainland_pubdate);
    return time.month.toString() + '月' + time.day.toString() + '日';
  }
  @override
  Widget build(BuildContext context) {
    final width = (ScreenUtils.screenW(context) - 30) / 3.0;
    return Container(
      margin: EdgeInsets.only(top: 10),
      width: width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          MoviePhotoWidget(
            imageUrl: widget.subject.images.large,
            width: width,
          ),
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
          Padding(
            padding: EdgeInsets.only(top: 2),
            child: Text(
              widget.subject.collect_count.toString() + '人想看',
              style: TextStyle(fontSize: 12),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 5),
            padding: EdgeInsets.fromLTRB(5,1,5,1),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(3),
                border: Border.all(

                color: Colors.redAccent[200],
                width: 1,
            )),
            child: Text(
              _getMainlandTime(),
              style: TextStyle(
                fontSize: 9,
                color: Colors.redAccent[200],
              ),
            ),
          )
        ],
      ),
    );
  }
}

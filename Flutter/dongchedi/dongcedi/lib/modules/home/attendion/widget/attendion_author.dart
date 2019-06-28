import 'package:flutter/material.dart';
import 'package:dongcedi/utils/screen_utils.dart';
import '../attendion_bean.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../bean/attendion_video_bean.dart';
import 'package:dongcedi/utils/utils.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';



//关注作者
class AuthorCell extends StatefulWidget {
  final User attendion;
  AuthorCell({Key key,this.attendion}) : super(key : key);

  @override
  _AuthorCellState createState() => _AuthorCellState();
}

class _AuthorCellState extends State<AuthorCell> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: ScreenUtils.get375Width(context, 80),
        padding: EdgeInsets.only(left: 15, right: 15, top: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(25)),
                  // child: Image.asset(
                  //   'assets/images/icon.png',
                  //   width: ScreenUtils.get375Width(context, 50),
                  //   height: ScreenUtils.get375Width(context, 50),
                  // ),
                  child: CachedNetworkImage(
                    imageUrl: widget.attendion.avatar_url,
                    width: ScreenUtils.get375Width(context, 50),
                    height: ScreenUtils.get375Width(context, 50),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        widget.attendion.name.toString(),
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      Container(
                        width: 200,
                        child: Text(
                        widget.attendion.motor_auth_show_info.auth_v_desc,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: TextStyle(
                            color: Color.fromARGB(255, 173, 173, 173),
                            fontSize: 14,
                            fontWeight: FontWeight.normal),
                      ),
                      ),
                      Text(
                        (widget.attendion.subscribers_count / 10000.00).toInt().toString() + "万粉丝",
                        style: TextStyle(
                            color: Color.fromARGB(255, 173, 173, 173),
                            fontSize: 14,
                            fontWeight: FontWeight.normal),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            AttendtinButton()
          ],
        ));
  }
}

//查看更多作者
class CharMoreAuthorCell extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(left: 15, right: 15),
        padding: EdgeInsets.only(top: 10, bottom: 10),
        height: 60,
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          child: Container(
            color: Color.fromARGB(255, 247, 247, 247),
            height: 40,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('查看更多作者'),
                Padding(
                  padding: EdgeInsets.only(left: 5),
                  child: Icon(
                    Icons.arrow_forward_ios,
                    color: Color.fromARGB(255, 192, 192, 192),
                    size: 10,
                  ),
                )
              ],
            ),
          ),
        ));
  }
}

//关注视频
class AttendionCell extends StatefulWidget {
  final AttendionVideo video;
  AttendionCell({Key key, this.video}) : super(key:key);
  @override
  _AttendionCellState createState() => _AttendionCellState();
}

class _AttendionCellState extends State<AttendionCell> {

  @override 
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 15, right: 15, top: 5,bottom: 15),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(25)),
                    child: CachedNetworkImage(
                      width: ScreenUtils.get375Width(context, 45),
                      height: ScreenUtils.get375Width(context, 45),
                      imageUrl: widget.video.info.user_info.avatar_url,
                    )
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 6),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(widget.video.info.user_info.name , style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.bold
                        ),),
                        Container(
                          width: 200,
                          child: Text(Utils.getTimeStamp(widget.video.info.display_time) + ' · '+widget.video.info.user_info.motor_auth_show_info.auth_v_desc, maxLines: 1,overflow:TextOverflow.ellipsis,style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                        ),),
                        )
                      ],
                    ),
                  )
                ],
              ),
            AttendtinButton()
            ],
          ),
          Container(
            padding: EdgeInsets.only(top: 10),
            width: ScreenUtils.screenW(context) - 30,
            child: Text(widget.video.info.title , textAlign: TextAlign.left,style: TextStyle(
              fontSize: 18,
              color: Colors.black,
              fontWeight: FontWeight.normal
            ),),
          ),
        Container(
          margin: EdgeInsets.only(top: 10) ,
          height: ScreenUtils.screenW(context) * 0.5625, 
          child: CachedNetworkImage(
            imageUrl: widget.video.info.image_list[0].url,
          ),
          ),
        Container(
          height: 45,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(''),
              Row(
                children: <Widget>[
                  FlatButton(
                    onPressed: (){},
                    child: Row(
                      children: <Widget>[
                        Image.asset('assets/images/share.png',width: 20,height: 20,color: Color.fromARGB(255, 50, 50, 50),),
                        Padding(
                          padding: EdgeInsets.only(left: 5),
                          child: Text('分享'),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 5,),
                    child: Icon(FontAwesomeIcons.commentDots,size: 20,color: Color.fromARGB(255, 50, 50, 50),),
                    // child: Image.asset('assets/images/comment.png',width: 25,height: 25,color: Color.fromARGB(255, 50, 50, 50),),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 5),
                    child: Text(widget.video.info.comment_count.toString()),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Icon(FontAwesomeIcons.thumbsUp,size: 20,color: Color.fromARGB(255, 50, 50, 50),),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 5),
                    child: Text(widget.video.info.user_info.follower_count.toString()),
                  )
                ],
              )
            ],
          ),
        )
        ],
      ),
    );
  }
}

// 关注按钮
class AttendtinButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(15)),
      child: Container(
        width: 65,
        height: 30,
        color: Colors.yellow,
        child: FlatButton(
          onPressed: () {},
          child: Text("关注"),
        ),
      ),
    );
  }
}

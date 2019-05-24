import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class MoviePhotoWidget extends StatefulWidget {
  final String imageUrl;
  final double width;
  MoviePhotoWidget({Key key, this.imageUrl, this.width}) : super(key: key);
  @override
  _MoviePhotoWidgetState createState() => _MoviePhotoWidgetState();
}

class _MoviePhotoWidgetState extends State<MoviePhotoWidget> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(5.0),
      child: Container(
        width: widget.width,
        height: widget.width /9 * 14,
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Positioned(
              top: 0,
              left: 0,
              bottom: 0,
              child: CachedNetworkImage(imageUrl: widget.imageUrl , width: widget.width , fit: BoxFit.cover,),
            ),
            Positioned(
              top: 0,
              left: 0,
              child: Image.asset('assets/images/ic_subject_rating_mark_wish.png' ,width: 21,height: 21,),
            )
          ],
        ),
      ),
    );
  }
}

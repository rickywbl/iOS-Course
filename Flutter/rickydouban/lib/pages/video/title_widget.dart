import 'package:flutter/material.dart';
import 'package:rickydouban/pages/route.dart';

class MovieTopItemTabBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          TitleItemWidget(name: "找电影", imageName: "assets/images/find_movie.png",),
          TitleItemWidget(name: "豆瓣榜单", imageName: "assets/images/douban_top.png",),
          TitleItemWidget(name: "豆瓣猜", imageName: "assets/images/douban_guess.png",),
          TitleItemWidget(name: "豆瓣片单", imageName: "assets/images/douban_film_list.png",),
        ],
      ),
    );
  }
}

class TitleItemWidget extends StatefulWidget {
  TitleItemWidget({Key key,this.name,this.imageName}) : super(key:key);
  final String name;
  final String imageName;
  @override
  _TitleItemWidgetState createState() => _TitleItemWidgetState();
}

class _TitleItemWidgetState extends State<TitleItemWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Router.push(context, Router.doubanGuess);
      },
      child: Container(
      child: Column(
        children: <Widget>[
          Padding(
            child: Image.asset(widget.imageName, width:50),
            padding: EdgeInsets.fromLTRB(0, 15, 0, 15),
          ),
          Text(widget.name),
        ],
      ),
    ),
    );
  }
}
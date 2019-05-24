import 'package:flutter/material.dart';
import 'package:rickydouban/pages/route.dart';
import 'package:rickydouban/bean/subject_entity.dart';
import 'package:rickydouban/http/API.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:rickydouban/widget/star_average_widget.dart';

class DouBanGuessPage extends StatefulWidget {
  @override
  _DouBanGuessPageState createState() => _DouBanGuessPageState();
}

class _DouBanGuessPageState extends State<DouBanGuessPage> {
  List<Subject> movieLists = [];

  @override
  void initState() {
    super.initState();
    _RequestAPI();
  }

  _RequestAPI() {
    API().top250((resp) {
      SubjectResp resp1 = resp;
      setState(() {
        movieLists = resp1.subjects;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          '豆瓣猜你喜欢',
          style: TextStyle(color: Colors.black),
        ),
        leading: GestureDetector(
          child: Icon(
            Icons.arrow_back_ios,
            color: Colors.black87,
          ),
          onTap: () {
            Router.pop(context);
          },
        ),
      ),
      body: SafeArea(
        child: ListView.builder(
          itemCount: this.movieLists.length,
          itemBuilder: (context, index) {
            return Container(
              child: GuessMovieWidget(
                movice: this.movieLists[index],
              ),
            );
          },
        ),
      ),
    );
  }
}

class GuessMovieWidget extends StatefulWidget {
  final Subject movice;
  GuessMovieWidget({Key key, this.movice}) : super(key: key);
  @override
  _GuessMovieWidgetState createState() => _GuessMovieWidgetState();
}

class _GuessMovieWidgetState extends State<GuessMovieWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
      child: Row(
        children: <Widget>[
          Expanded(
              flex: 2,
              child: CachedNetworkImage(
                imageUrl: widget.movice.images.small,
                width: 100,
                height: 150,
              )),
          Expanded(
              flex: 4,
              child: Container(
                padding: EdgeInsets.all(0),
                color: Colors.red,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(
                            left: 10,
                          ),
                          child: Image.asset(
                            'assets/images/ic_action_playable_video_s.png',
                            width: 20,
                            height: 20,
                          ),
                        ),
                        Container(
                          constraints: BoxConstraints(maxWidth: 110),
                          padding: EdgeInsets.only(left: 10),
                          child: Text(
                            widget.movice.title,
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                            softWrap: false,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 2),
                          child: Text(
                            '(' + widget.movice.year + ')',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.normal,
                                color: Colors.grey),
                          ),
                        )
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 5, left: 10),
                      child: StarAverageWidget(
                        stars: widget.movice.rating.stars,
                        average: widget.movice.rating.average.toString(),
                      ),
                    ),
                    Container(
                      // constraints: BoxConstraints(maxWidth: 180),
                      margin: EdgeInsets.fromLTRB(10, 5, 0, 0),
                      child: Text(_getMovieSubTitle(),
                          softWrap: true,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis),
                    )
                  ],
                ),
              )),
          Expanded(
              flex: 1,
              child: Container(
                  padding: EdgeInsets.fromLTRB(10, 5, 0, 5),
                  child: Container(
                    child: Text(
                      '.\n.\n.\n.\n.\n.\n.\n.\n.',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                      softWrap: true,
                    ),
                  )))
        ],
      ),
    );
  }

  _getMovieSubTitle() {
    String sub = widget.movice.year + ' / ';
    widget.movice.genres.forEach((String item) {
      sub = sub + ' ' + item;
    });
    sub = sub + ' / ';

    widget.movice.directors.forEach((Director item) {
      sub = sub + ' ' + item.name;
    });
    sub = sub + ' / ';

    widget.movice.casts.forEach((Cast item) {
      sub = sub + ' ' + item.name;
    });
    sub = sub + ' / ';
    return sub;
  }
}

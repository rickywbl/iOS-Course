import 'package:dongcedi/utils/screen_utils.dart';
import 'package:flutter/material.dart';
import 'package:dongcedi/router/router.dart';
import 'package:dongcedi/http/api.dart';
import 'car_detail_bean.dart';

class CarDetailPage extends StatefulWidget {
  final int seriesId;
  CarDetailPage({Key key, this.seriesId}) : super(key:key);
  @override
  _CarDetailPageState createState() => _CarDetailPageState();
}

class _CarDetailPageState extends State<CarDetailPage> {
  CarDetailResp carDetailResp;
  @override
  void initState() {
    super.initState();
    Map<String, dynamic> map = {
      'city_name': '%E5%8D%97%E4%BA%AC',
      'concern_id': widget.seriesId,
      'current_city_name': '%E5%8D%97%E4%BA%AC',
      'city_name': '1392'
    };
    API().getCarDetail(map, (resp) {
      if (mounted) {
        setState(() {
          carDetailResp = resp;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: <Widget>[
          Positioned(
              child: Container(
            color: Colors.red,
            width: ScreenUtils.screenW(context),
            height: ScreenUtils.screenH(context),
          )),
          Positioned(
            top: 0,
            left: 0,
            child: Container(
              color: Colors.white,
              width: ScreenUtils.screenW(context),
              height: ScreenUtils.getStatusBarH(context) + 44,
              child: Container(
                padding:
                    EdgeInsets.only(top: ScreenUtils.getStatusBarH(context)),
                height: 44,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: Container(
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.only(left: 5),
                        child: GestureDetector(
                          onTap: () {
                            Router.pop(context);
                          },
                          child: Icon(Icons.arrow_back_ios),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Container(
                        alignment: Alignment.center,
                        child: Text(
                          carDetailResp == null
                              ? ""
                              : carDetailResp.forum.forumName,
                          style: TextStyle(
                              fontSize: 18,
                              decoration: TextDecoration.none,
                              color: Colors.black,
                              fontWeight: FontWeight.normal),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Icon(
                              Icons.favorite,
                              color: Colors.red,
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 10, right: 10),
                              child: Icon(Icons.share),
                            ),
                          ],
                        ),
                      ),
                    ),
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

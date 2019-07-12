import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:dongcedi/base/container.dart';
import 'package:dongcedi/modules/detail/car_detail.dart';

class Router {
  static const homePage = 'dongchedi://';
  static const carDetailPage = 'dengchedi://carDetailPage';

  Widget _getPage(String url, dynamic parms) {
    if (url.startsWith('http://') || url.startsWith('https://')) {
    } else {
      switch (url) {
        case homePage:
          return ContainerPage();
        case carDetailPage:
          return CarDetailPage();
      }
    }
    return null;
  }

  Router.push(BuildContext context, String url) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return _getPage(url, null);
    }));
  }

  Router.pushWithParams(BuildContext context, String url, dynamic params) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return _getPage(url, params);
    }));
  }

  Router.pop(BuildContext context) {
    Navigator.pop(context);
  }
}

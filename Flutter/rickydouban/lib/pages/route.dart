import 'package:flutter/material.dart';
import 'package:rickydouban/pages/contain_page.dart';
import 'package:rickydouban/pages/video/douban_guess_page.dart';

class Router {

  static const homePage = 'app://';
  static const doubanGuess = 'app://DoubanGuessPage';

  Widget _getPage(String url, dynamic params){
    if (url.startsWith('http://') || url.startsWith('https://')){

    }else{
      switch (url) {
        case homePage:
          return ContainerPage();
        case doubanGuess:
          return DouBanGuessPage();
      }
    }

    return null;
  }

  Router.push(BuildContext context, String url){
    Navigator.push(context, MaterialPageRoute(builder: (context){
      return _getPage(url, null);
    }));
  }

  Router.pop(BuildContext context){
    Navigator.pop(context);
  }
}
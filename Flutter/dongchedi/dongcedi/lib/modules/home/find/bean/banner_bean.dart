import 'dart:convert' show json;

import 'package:dongcedi/modules/home/attendion/attendion_bean.dart';
import 'package:dongcedi/modules/home/attendion/bean/attendion_video_bean.dart';
import 'package:flutter/widgets.dart';

class BannerBean {
  String source;
  String openUrl;
  String gid;
  String imageUrl;
  String title;

  BannerBean.fromParams({this.source, this.openUrl, this.gid, this.imageUrl, this.title});

  factory BannerBean(jsonStr) => jsonStr == null ? null : jsonStr is String ? new BannerBean.fromJson(json.decode(jsonStr)) : new BannerBean.fromJson(jsonStr);
  BannerBean.fromJson(jsonRes){
    source = jsonRes['source'];
    openUrl = jsonRes['open_url'];
    gid = jsonRes['gid'];
    imageUrl = jsonRes['img_url'];
    title = jsonRes['title'];
  }

}


class IconBean {
  String subtitle;
  String openUrl;
  String imageUrl;
  String title;

  IconBean.fromParams({this.subtitle, this.openUrl , this.imageUrl, this.title});

  factory IconBean(jsonStr) => jsonStr == null ? null : jsonStr is String ? new IconBean.fromJson(json.decode(jsonStr)) : new BannerBean.fromJson(jsonStr);
  IconBean.fromJson(jsonRes){
    subtitle = jsonRes['subtitle'];
    openUrl = jsonRes['open_url'];
    imageUrl = jsonRes['img_url'];
    title = jsonRes['title'];
  }

}



class VideoInfoBean {
  String title;
  int readCount;
  int commentCount;
  int behotTime;
  List<VideoImage> imageList;
  RepostInfo repostInfo;
 
  VideoInfoBean.fromParams({this.readCount, this.behotTime , this.title ,this.imageList, this.repostInfo , this.commentCount});

  factory VideoInfoBean(jsonStr) => jsonStr == null ? null : jsonStr is String ? new VideoInfoBean.fromJson(json.decode(jsonStr)) : new VideoInfoBean.fromJson(jsonStr);
  VideoInfoBean.fromJson(jsonRes){
    readCount = jsonRes['read_count'];
    behotTime = jsonRes['behot_time'];
    title = jsonRes['title'];
    commentCount = jsonRes['comment_count'];
    repostInfo = RepostInfo.fromJson(jsonRes['repost_info']);
    imageList = jsonRes['image_list'] == null ? null : [];
    for (var imageItem in imageList == null ? [] : jsonRes['image_list']){
       imageList.add(imageItem == null ? null : new VideoImage.fromJson(imageItem));
    }
  }

}


class VideoImage{
  int width;
  String url;
  int type;
  String uri;
  int height;
  List urlList;

  VideoImage.fromParams({this.width, this.url , this.type, this.uri, this.height, this.urlList});
  factory VideoImage(jsonStr) => jsonStr == null ? null : jsonStr is String ? new VideoImage.fromJson(json.decode(jsonStr)) : new VideoImage.fromJson(jsonStr);
  VideoImage.fromJson(jsonRes){
    width = jsonRes['width'];
    url = jsonRes['url'];
    type = jsonRes['type'];
    uri = jsonRes['uri'];
    height = jsonRes['height'];
    urlList = jsonRes['url_list'];
  }
}

class RepostInfo {
  String name;
  String title;
  int uiStyle;
  String imageUrl;
  String itemIdStr;

  RepostInfo.fromParams({this.name, this.title , this.uiStyle, this.imageUrl, this.itemIdStr});
  factory RepostInfo(jsonStr) => jsonStr == null ? null : jsonStr is String ? new RepostInfo.fromJson(json.decode(jsonStr)) : new RepostInfo.fromJson(jsonStr);
  RepostInfo.fromJson(jsonRes){
    name = jsonRes['name'];
    title = jsonRes['title'];
    uiStyle = jsonRes['ui_style'];
    imageUrl = jsonRes['image_url'];
    itemIdStr = jsonRes['item_id_str'].toString();
  }

}


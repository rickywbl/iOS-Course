import 'dart:convert' show json;

import 'package:dongcedi/modules/home/attendion/attendion_bean.dart';

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
  String readCount;
  String behotTime;
  // Map imageList;
  RepostInfo repostInfo;
 
  VideoInfoBean.fromParams({this.readCount, this.behotTime , this.title ,this.repostInfo});

  factory VideoInfoBean(jsonStr) => jsonStr == null ? null : jsonStr is String ? new VideoInfoBean.fromJson(json.decode(jsonStr)) : new VideoInfoBean.fromJson(jsonStr);
  VideoInfoBean.fromJson(jsonRes){
    readCount = jsonRes['read_count'];
    // imageList = json.decode(jsonRes['image_list']);
    behotTime = jsonRes['behot_time'];
    title = jsonRes['title'];
    repostInfo = RepostInfo.fromJson(jsonRes['repost_info']);
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
    itemIdStr = jsonRes['item_id_str'];
  }

}


import 'dart:convert' show json;

import 'package:dongcedi/modules/home/find/bean/banner_bean.dart';

class CarDetailResp {

  Forum forum;
  List<CarTabs> tabs;
  Concern concern;

  CarDetailResp.fromParams({this.forum ,this.tabs , this.concern});

  factory CarDetailResp(jsonStr) => jsonStr == null ? null : jsonStr is String ? new CarDetailResp.fromJson(json.decode(jsonStr)) : new CarDetailResp.fromJson(jsonStr);

  CarDetailResp.fromJson(jsonResp){
    forum = Forum.fromJson(jsonResp['forum']);
    concern = Concern.fromJson(jsonResp['concern_obj']);
    tabs = jsonResp['tabs'] == null ? null : [];
    for (var item in tabs == null ? [] : jsonResp['tabs']){
       tabs.add(item == null ? null : new CarTabs.fromJson(item));
    }
  }
}

class Forum {
  int status;
  String forumName;
  String avatarUrl;
  String shareUrl;
  String desc;
  int followCount;
  int talkCount;
  String bannerUrl;

  Forum.fromParams({this.status, this.forumName,this.avatarUrl,this.shareUrl,this.desc,this.followCount,this.talkCount,this.bannerUrl});
  factory Forum(jsonStr) => jsonStr == null ? null : jsonStr is String ? new Forum.fromJson(json.decode(jsonStr)) : new Forum.fromJson(jsonStr);

  Forum.fromJson(jsonResp){
    status = jsonResp['status'];
    forumName = jsonResp['forum_name'];
    avatarUrl = jsonResp['avatar_url'];
    shareUrl  = jsonResp['share_url'];
    desc = jsonResp['desc'];
    followCount = jsonResp['follower_count'];
    talkCount = jsonResp['talk_count'];
    bannerUrl = jsonResp['banner_url'];
   }
}

class CarTabs {
  String name;
  String soleName;
  int tableStyle;
  String url;
  List<CarTabs> subTabs;
  int isChecked;

  CarTabs.fromParams({this.name , this.soleName, this.tableStyle , this.isChecked ,this.subTabs ,this.url});
  factory CarTabs(jsonStr) => jsonStr == null ? null : jsonStr is String ? new CarTabs.fromJson(json.decode(jsonStr)) : new CarTabs.fromJson(jsonStr);

  CarTabs.fromJson(jsonResp){
     name = jsonResp['name'];
     soleName = jsonResp['sole_name'];
     tableStyle = jsonResp['table_type'];
     url = jsonResp['url'];
     isChecked = jsonResp['is_checked'];
     subTabs = jsonResp['sub_tabs'] == null ? null : [];
     for (var item in subTabs == null ? [] : jsonResp['sub_tabs']){
       subTabs.add(item == null ? null : new CarTabs.fromJson(item));
     }
  }
}


class Concern {
  String brandName;
  String preSalePrice;
  String desc;
  String concernId;
  String avatarUrl;
  String businessStatus;
  String carIdList;
  String dealerPrice;

  Concern.fromParams({this.brandName , this.preSalePrice, this.desc , this.concernId ,this.avatarUrl ,this.businessStatus,this.carIdList,this.dealerPrice});
  factory Concern(jsonStr) => jsonStr == null ? null : jsonStr is String ? new Concern.fromJson(json.decode(jsonStr)) : new Concern.fromJson(jsonStr);

  Concern.fromJson(jsonResp){
    brandName = jsonResp['brand_name'].toString();
    preSalePrice = jsonResp['pre_sale_price'].toString();
    desc = jsonResp['desc'].toString();
    concernId = jsonResp['concern_id'].toString();
    businessStatus = jsonResp['business_status'].toString();
    carIdList = jsonResp['car_id_list'].toString();
    dealerPrice = jsonResp['dealer_price'].toString();
    // extra = jsonResp['extra'].toString();
  }
}
import 'dart:io';
import 'http_util.dart';
import 'http_request.dart';
import 'package:dio/dio.dart';
import 'dart:convert';
import 'dart:convert' show json;

import 'package:dongcedi/modules/home/attendion/bean/attendion_video_bean.dart';
import 'package:dongcedi/modules/home/attendion/attendion_bean.dart';
import 'package:dongcedi/modules/home/find/bean/banner_bean.dart';
import 'package:dongcedi/modules/home/find/bean/new_car_recommend_bean.dart';
import 'package:dongcedi/modules/detail/car_detail_bean.dart';


//https://is.snssdk.com/motor/card/common_cate_head/v1/?fp=iSTrLMQ5JYPMFlHtPrU1F2U7LlGb&version_code=4.5.2&app_name=automobile&vid=E936A208-215A-45CD-8C81-11B077DB25E6&device_id=40267172353&channel=App%20Store&latitude=39.976298&city_name=%E5%8D%97%E4%BA%AC&resolution=1242*2688&aid=36&gps_city_name=%E5%8D%97%E4%BA%AC&ab_group=934639&selected_city_name=&openudid=89aee0c542be7353d8986148b3a204d7fbc5aae6&am_time=1561108855.895316&longitude=116.328995&idfv=E936A208-215A-45CD-8C81-11B077DB25E6&ac=WIFI&os_version=12.3.1&ssmix=a&device_platform=iphone&iid=75486654540&device_type=iPhone11,6&idfa=A86D355F-A3C4-47E4-BB3E-8A75498002AA&category=motor_followed_fan_channel
typedef RequestCallBack<T> = void Function(T value);

class API{
  var _request = HttpRequest("https://is.snssdk.com/");
  
  void getAttendion(RequestCallBack requestCallBack) async {
    Map<String, dynamic> parms = {
      'fp':'iSTrLMQ5JYPMFlHtPrU1F2U7LlGb',
      'version_code':'4.5.2',
      'app_name':'automobile',
      'vid':'E936A208-215A-45CD-8C81-11B077DB25E6',
      'device_id':'40267172353',
      'channel':'App%20Store',
      'latitude': '39.976298',
      'city_name':'%E5%8D%97%E4%BA%AC',
      'resolution':'1242*2688',
      'aid': '36',
      'gps_city_name':'%E5%8D%97%E4%BA%AC',
      'ab_group':'934639',
      'selected_city_name':'',
      'openudid':'89aee0c542be7353d8986148b3a204d7fbc5aae6',
      'am_time':'1561108855.895316',
      'longitude': '116.328995',
      'idfv':'E936A208-215A-45CD-8C81-11B077DB25E6',
      'ac':'WIFI',
      'os_version':'12.3.1',
      'ssmix':'a',
      'device_platform':'iphone',
      'iid':'75486654540',
      'device_type':'iPhone11,6',
      'idfa':'A86D355F-A3C4-47E4-BB3E-8A75498002AA',
      'category':'motor_followed_fan_channel',
    };
    Response result = await HttpUtil.getInstance().get('motor/card/common_cate_head/v1/',data: parms);
    Resp resp = Resp.fromJson(json.decode(result.data.toString()));
    requestCallBack(resp);
  }

  void getAttendionVideo(RequestCallBack requestCallBack) async {
     Map<String, dynamic> parms = {
      'fp':'iSTrLMQ5JYPMFlHtPrU1F2U7LlGb',
      'version_code':'4.5.2',
      'app_name':'automobile',
      'vid':'E936A208-215A-45CD-8C81-11B077DB25E6',
      'device_id':'40267172353',
      'channel':'App%20Store',
      'latitude': '39.976298',
      'city_name':'%E5%8D%97%E4%BA%AC',
      'resolution':'1242*2688',
      'aid': '36',
      'gps_city_name':'%E5%8D%97%E4%BA%AC',
      'ab_group':'934639',
      'selected_city_name':'',
      'openudid':'89aee0c542be7353d8986148b3a204d7fbc5aae6',
      'am_time':'1561108855.895316',
      'longitude': '116.328995',
      'idfv':'E936A208-215A-45CD-8C81-11B077DB25E6',
      'ac':'WIFI',
      'os_version':'12.3.1',
      'ssmix':'a',
      'device_platform':'iphone',
      'iid':'75486654540',
      'device_type':'iPhone11,6',
      'idfa':'A86D355F-A3C4-47E4-BB3E-8A75498002AA',
      'category':'motor_followed_fan_channel',
      'detail':'1',
      'impression_info': {"page_id":"page_category","sub_tab":"motor_followed_fan_channel"},
      'cp':'5cDd1d478a1BDq1',
      'refer':'1',
      'loc_time':'1561625012',
    };
    Response result = await HttpUtil.getInstance().get('motor/stream/api/news/feed/motor/v47/',data: parms);
    VideoResp resp = VideoResp.fromJson(json.decode(result.data.toString()));
    requestCallBack(resp);
  }

  void getVideoChannel( Map parmas ,RequestCallBack requestCallBack) async {
     Map<String, dynamic> parms = {
      'fp':'iSTrLMQ5JYPMFlHtPrU1F2U7LlGb',
      'version_code':'4.5.4',
      'app_name':'automobile',
      'vid':'E936A208-215A-45CD-8C81-11B077DB25E6',
      'device_id':'40267172353',
      'channel':'App%20Store',
      'latitude': '39.976298',
      'city_name':'%E5%8D%97%E4%BA%AC',
      'resolution':'1242*2688',
      'aid': '36',
      'gps_city_name':'%E5%8D%97%E4%BA%AC',
      'ab_group':'934639',
      'selected_city_name':'',
      'openudid':'89aee0c542be7353d8986148b3a204d7fbc5aae6',
      'am_time':'1561108855.895316',
      'longitude': '116.328995',
      'idfv':'E936A208-215A-45CD-8C81-11B077DB25E6',
      'ac':'WIFI',
      'os_version':'12.3.1',
      'ssmix':'a',
      'device_platform':'iphone',
      'iid':'75486654540',
      'device_type':'iPhone11,6',
      'idfa':'A86D355F-A3C4-47E4-BB3E-8A75498002AA',
      'detail':'1',
      'category':'motor_car_video',
      'motor_feed_extra_params': parmas,
      'impression_info': {"page_id":"page_category","sub_tab":"motor_car_video"},
      'tt_form':'pull',
      'count':'9',
      'loc_mode':'1',
      'min_behot_time':'1562744894',
      'cp':'50D42f539c879q1',
      'refer':'1',
      'loc_time':'1561625012',
    };
    List<VideoInfoBean> videos = [];
    Response result = await HttpUtil.getInstance().get('motor/stream/api/news/feed/motor/v47/',data: parms);
    Map map = json.decode(result.data);
    for (var i = 0; i < map['data'].length;  i++) {
      VideoInfoBean info = VideoInfoBean.fromJson(map['data'][i]['info']);
      videos.add(info);
    }
    requestCallBack({'videos':videos});
  }

  void getBanner(RequestCallBack requestCallBack) async{
     Map<String, dynamic> parms = {
    };
    //https://is.snssdk.com/motor/stream/api/news/feed/motor/v47/?fp=iSTrLMQ5JYPMFlHtPrU1F2U7LlGb&version_code=4.5.2&app_name=automobile&vid=E936A208-215A-45CD-8C81-11B077DB25E6&device_id=40267172353&channel=App%20Store&latitude=32.0918823099041&city_name=%E5%8D%97%E4%BA%AC&resolution=1242*2688&aid=36&gps_city_name=%E5%8D%97%E4%BA%AC&ab_group=934639&selected_city_name=&openudid=89aee0c542be7353d8986148b3a204d7fbc5aae6&am_time=1562312313.684644&longitude=118.8889946796093&idfv=E936A208-215A-45CD-8C81-11B077DB25E6&ac=WIFI&os_version=12.3.1&ssmix=a&device_platform=iphone&iid=75486654540&device_type=iPhone11,6&idfa=9EC70EA6-6295-4EA8-B953-9B0B9BCE46CD&detail=1&category=motor_car&motor_feed_extra_params=%7B%22refresh_num%22%3A1%2C%22loadmore_num%22%3A0%2C%22feed_type%22%3A0%2C%22new_feed%22%3Atrue%7D&tt_from=pull&count=9&loc_mode=1&longitude=118.8889946796093&latitude=32.0918823099041&cp=51Db1dEfF1E7Aq1&impression_info=%7B%22page_id%22%3A%22page_category%22%2C%22sub_tab%22%3A%22motor_car%22%7D&min_behot_time=1562312243&refer=1&loc_time=1562312306
    Response result = await HttpUtil.getInstance().get('motor/stream/api/news/feed/motor/v47/?fp=iSTrLMQ5JYPMFlHtPrU1F2U7LlGb&version_code=4.5.2&app_name=automobile&vid=E936A208-215A-45CD-8C81-11B077DB25E6&device_id=40267172353&channel=App%20Store&latitude=32.0918823099041&city_name=%E5%8D%97%E4%BA%AC&resolution=1242*2688&aid=36&gps_city_name=%E5%8D%97%E4%BA%AC&ab_group=934639&selected_city_name=&openudid=89aee0c542be7353d8986148b3a204d7fbc5aae6&am_time=1562312313.684644&longitude=118.8889946796093&idfv=E936A208-215A-45CD-8C81-11B077DB25E6&ac=WIFI&os_version=12.3.1&ssmix=a&device_platform=iphone&iid=75486654540&device_type=iPhone11,6&idfa=9EC70EA6-6295-4EA8-B953-9B0B9BCE46CD&detail=1&category=motor_car&motor_feed_extra_params=%7B%22refresh_num%22%3A1%2C%22loadmore_num%22%3A0%2C%22feed_type%22%3A0%2C%22new_feed%22%3Atrue%7D&tt_from=pull&count=9&loc_mode=1&longitude=118.8889946796093&latitude=32.0918823099041&cp=51Db1dEfF1E7Aq1&impression_info=%7B%22page_id%22%3A%22page_category%22%2C%22sub_tab%22%3A%22motor_car%22%7D&min_behot_time=1562312243&refer=1&loc_time=1562312306',data: parms);
    Map map = json.decode(result.data);
    List<BannerBean> banners = [];
    List<IconBean> icons = [];
     List<VideoInfoBean> videos = [];
    for (var banner in map['data'][0]['info']['card_content']['list']) {
      BannerBean bean = BannerBean.fromJson(banner);
      banners.add(bean);
    }

     for (var icon in map['data'][1]['info']['card_content']['circle_btn_lists']) {
      IconBean bean = IconBean.fromJson(icon);
      icons.add(bean);
    }

    for (var i = 2; i < map['data'].length;  i++) {
      VideoInfoBean info = VideoInfoBean.fromJson(map['data'][i]['info']);
      videos.add(info);
    }

    requestCallBack({'banners':banners , 'icons': icons , 'videos':videos});
  }

  void getNewCarRecommend(RequestCallBack requestCallBack) async{
     Map<String, dynamic> parms = {
      'app_name':'automobile',
      'vid':'E936A208-215A-45CD-8C81-11B077DB25E6',
      'device_id':'40267172353',
      'latitude': '39.976298', 
      'city_name':'%E5%8D%97%E4%BA%AC',
      'resolution':'1242*2688',
      'aid': '36',
      'gps_city_name':'%E5%8D%97%E4%BA%AC',
      'fp':'iSTrLMQ5JYPMFlHtPrU1F2U7LlGb',
      'version_code':'4.5.4',
      'channel':'App%20Store',
      'ab_group':'934639',
      'selected_city_name':'',
      'openudid':'89aee0c542be7353d8986148b3a204d7fbc5aae6',
      'am_time':'1561108855.895316',
      'longitude': '116.328995',
      'idfv':'E936A208-215A-45CD-8C81-11B077DB25E6',
      'ac':'WIFI',
      'os_version':'12.3.1',
      'ssmix':'a',
      'device_platform':'iphone',
      'iid':'75486654540',
      'device_type':'iPhone11,6',
      'idfa':'A86D355F-A3C4-47E4-BB3E-8A75498002AA',
      'detail':'1',
      'category':'motor_car_new_arrival',
    };
    List<RecommendNewCarBean> cars = [];
    Response result = await HttpUtil.getInstance().get('motor/card/common_cate_head/v1/',data: parms);
    Map map = json.decode(result.data);
    if (map['data']['list'] == null) return;
    for (var i = 0; i < map['data']['list'][0]['info']['list'].length;  i++) {
      RecommendNewCarBean info = RecommendNewCarBean.fromJson(map['data']['list'][0]['info']['list'][i]);
      cars.add(info);
    }
    requestCallBack({'cars':cars});
  }

   void getNewCarNews(Map parmas,RequestCallBack requestCallBack) async{
      Map<String, dynamic> parms = {
      'fp':'iSTrLMQ5JYPMFlHtPrU1F2U7LlGb',
      'version_code':'4.5.4',
      'app_name':'automobile',
      'vid':'E936A208-215A-45CD-8C81-11B077DB25E6',
      'device_id':'40267172353',
      'channel':'App%20Store',
      'latitude': '39.976298',
      'city_name':'%E5%8D%97%E4%BA%AC',
      'resolution':'1242*2688',
      'aid': '36',
      'gps_city_name':'%E5%8D%97%E4%BA%AC',
      'ab_group':'934639',
      'selected_city_name':'',
      'openudid':'89aee0c542be7353d8986148b3a204d7fbc5aae6',
      'am_time':'1561108855.895316',
      'longitude': '116.328995',
      'idfv':'E936A208-215A-45CD-8C81-11B077DB25E6',
      'ac':'WIFI',
      'os_version':'12.3.1',
      'ssmix':'a',
      'device_platform':'iphone',
      'iid':'75486654540',
      'device_type':'iPhone11,6',
      'idfa':'A86D355F-A3C4-47E4-BB3E-8A75498002AA',
      'detail':'1',
      'category':'motor_car_new_arrival',
      'motor_feed_extra_params': parmas,
      'impression_info': {"page_id":"page_category","sub_tab":"motor_car_new_arrival"},
      'tt_form':'pull',
      'count':'9',
      'loc_mode':'1',
      'min_behot_time':'1562744894',
      'cp':'50D42f539c879q1',
      'refer':'1',
      'loc_time':'1561625012',
    };
    List<VideoInfoBean> news = [];
    Response result = await HttpUtil.getInstance().get('motor/stream/api/news/feed/motor/v47/',data: parms);
    Map map = json.decode(result.data);
    if (map['data'] == null) return;
    for (var i = 0; i < map['data'].length;  i++) {
      VideoInfoBean info = VideoInfoBean.fromJson(map['data'][i]['info']);
      news.add(info);
    }
    requestCallBack(news);
  }

   void getCarDetail(Map parmas, RequestCallBack requestCallBack) async{
      Map<String, dynamic> parms = {
      'fp':'iSTrLMQ5JYPMFlHtPrU1F2U7LlGb',
      'version_code':'4.5.4',
      'app_name':'automobile',
      'vid':'E936A208-215A-45CD-8C81-11B077DB25E6',
      'device_id':'40267172353',
      'channel':'App%20Store',
      'latitude': '39.976298',
      'city_name':'%E5%8D%97%E4%BA%AC',
      'resolution':'1242*2688',
      'aid': '36',
      'gps_city_name':'%E5%8D%97%E4%BA%AC',
      'ab_group':'934639',
      'selected_city_name':'',
      'openudid':'89aee0c542be7353d8986148b3a204d7fbc5aae6',
      'am_time':'1561108855.895316',
      'longitude': '116.328995',
      'idfv':'E936A208-215A-45CD-8C81-11B077DB25E6',
      'ac':'WIFI',
      'os_version':'12.3.1',
      'ssmix':'a',
      'device_platform':'iphone',
      'iid':'75486654540',
      'device_type':'iPhone11,6',
      'idfa':'A86D355F-A3C4-47E4-BB3E-8A75498002AA',
    };
    parms.addAll(parmas);
    Response result = await HttpUtil.getInstance().post('motor/car_page/v4/get_head/',data: parms);
    CarDetailResp resp = CarDetailResp.fromJson(json.decode(result.data.toString()));
    requestCallBack(resp);
   }
}
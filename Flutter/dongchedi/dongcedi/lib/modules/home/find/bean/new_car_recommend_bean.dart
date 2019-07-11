import 'dart:convert' show json;

class RecommendNewCarBean{
  String openUrl;
  String price;
  String onlineData;
  String seriesName;
  String coverUrl;
  int seriesId;

 RecommendNewCarBean.fromParams({this.openUrl, this.price, this.onlineData, this.seriesName, this.coverUrl , this.seriesId});
 
 factory RecommendNewCarBean(jsonStr) => jsonStr == null ? null : jsonStr is String ? new RecommendNewCarBean.fromJson(json.decode(jsonStr)) : new RecommendNewCarBean.fromJson(jsonStr);
  
  RecommendNewCarBean.fromJson(jsonRes){
    openUrl = jsonRes['open_url'];
    price = jsonRes['price'];
    onlineData = jsonRes['online_date'];
    seriesName = jsonRes['series_name'];
    coverUrl = jsonRes['cover_url'];
    seriesId = jsonRes['series_id'];
  }
}
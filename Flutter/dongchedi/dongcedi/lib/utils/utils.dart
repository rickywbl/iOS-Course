
class Utils {

  static String getTimeStamp (int timestamp){
    var time = new DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
    var now  = new DateTime.now();
    var dif = now.difference(time);
    if (dif.inDays > 0){
      return dif.inDays.toString() + "天前";
    }else{
      if (dif.inHours > 0){
        return dif.inHours.toString() + "小时前";
      }else{
        return dif.inMinutes.toString() + "分钟前";
      }
    }
  }
}
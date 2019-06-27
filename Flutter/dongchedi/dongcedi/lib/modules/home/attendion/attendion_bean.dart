import 'dart:convert' show json;

class Resp {

  String message;
  Data data;

  Resp.fromParams({this.message, this.data});

  factory Resp(jsonStr) => jsonStr == null ? null : jsonStr is String ? new Resp.fromJson(json.decode(jsonStr)) : new Resp.fromJson(jsonStr);
  
  Resp.fromJson(jsonRes) {
    message = jsonRes['message'];
    data = jsonRes['data'] == null ? null : new Data.fromJson(jsonRes['data']);
  }

  @override
  String toString() {
    return '{"message": ${message != null?'${json.encode(message)}':'null'},"data": $data}';
  }
}

class Data {

  List<Subject> list;

  Data.fromParams({this.list});
  
  Data.fromJson(jsonRes) {
    list = jsonRes['list'] == null ? null : [];

    for (var listItem in list == null ? [] : jsonRes['list']){
            list.add(listItem == null ? null : new Subject.fromJson(listItem));
    }
  }

  @override
  String toString() {
    return '{"list": $list}';
  }
}

class Subject {

  int blank_type;
  int type;
  int unique_id;
  Info info;

  Subject.fromParams({this.blank_type, this.type, this.unique_id, this.info});
  
  Subject.fromJson(jsonRes) {
    blank_type = jsonRes['blank_type'];
    type = jsonRes['type'];
    unique_id = jsonRes['unique_id'];
    info = jsonRes['info'] == null ? null : new Info.fromJson(jsonRes['info']);
  }

  @override
  String toString() {
    return '{"blank_type": $blank_type,"type": $type,"unique_id": $unique_id,"info": $info}';
  }
}

class Info {

  int blank_type;
  String subscribe_tip;
  CardContent card_content;
  Log_Pb log_pb;
  ShowMore show_more;

  Info.fromParams({this.blank_type, this.subscribe_tip, this.card_content, this.log_pb, this.show_more});
  
  Info.fromJson(jsonRes) {
    blank_type = jsonRes['blank_type'];
    subscribe_tip = jsonRes['subscribe_tip'];
    card_content = jsonRes['card_content'] == null ? null : new CardContent.fromJson(jsonRes['card_content']);
    log_pb = jsonRes['log_pb'] == null ? null : new Log_Pb.fromJson(jsonRes['log_pb']);
    show_more = jsonRes['show_more'] == null ? null : new ShowMore.fromJson(jsonRes['show_more']);
  }

  @override
  String toString() {
    return '{"blank_type": $blank_type,"subscribe_tip": ${subscribe_tip != null?'${json.encode(subscribe_tip)}':'null'},"card_content": $card_content,"log_pb": $log_pb,"show_more": $show_more}';
  }
}

class ShowMore {

  String title;
  String url;

  ShowMore.fromParams({this.title, this.url});
  
  ShowMore.fromJson(jsonRes) {
    title = jsonRes['title'];
    url = jsonRes['url'];
  }

  @override
  String toString() {
    return '{"title": ${title != null?'${json.encode(title)}':'null'},"url": ${url != null?'${json.encode(url)}':'null'}}';
  }
}

class Log_Pb {

  String channel_id;
  String impr_id;

  Log_Pb.fromParams({this.channel_id, this.impr_id});
  
  Log_Pb.fromJson(jsonRes) {
    channel_id = jsonRes['channel_id'];
    impr_id = jsonRes['impr_id'];
  }

  @override
  String toString() {
    return '{"channel_id": ${channel_id != null?'${json.encode(channel_id)}':'null'},"impr_id": ${impr_id != null?'${json.encode(impr_id)}':'null'}}';
  }
}

class CardContent {

  List<User> users;

  CardContent.fromParams({this.users});
  
  CardContent.fromJson(jsonRes) {
    users = jsonRes['users'] == null ? null : [];

    for (var usersItem in users == null ? [] : jsonRes['users']){
            users.add(usersItem == null ? null : new User.fromJson(usersItem));
    }
  }

  @override
  String toString() {
    return '{"users": $users}';
  }
}

class User {

  int last_update_time;
  int media_id;
  int subscribers_count;
  int user_id;
  int user_verified;
  bool follow;
  bool is_banned;
  bool is_star_user;
  String avatar_url;
  String decoration_icon;
  String description;
  String flag;
  String name;
  String schema;
  String screen_name;
  String user_auth_info;
  String verified_content;
  MotorAuthShowInfo motor_auth_show_info;

  User.fromParams({this.last_update_time, this.media_id, this.subscribers_count, this.user_id, this.user_verified, this.follow, this.is_banned, this.is_star_user, this.avatar_url, this.decoration_icon, this.description, this.flag, this.name, this.schema, this.screen_name, this.user_auth_info, this.verified_content, this.motor_auth_show_info});
  
  User.fromJson(jsonRes) {
    last_update_time = jsonRes['last_update_time'];
    media_id = jsonRes['media_id'];
    subscribers_count = jsonRes['subscribers_count'];
    user_id = jsonRes['user_id'];
    user_verified = jsonRes['user_verified'];
    follow = jsonRes['follow'];
    is_banned = jsonRes['is_banned'];
    is_star_user = jsonRes['is_star_user'];
    avatar_url = jsonRes['avatar_url'];
    decoration_icon = jsonRes['decoration_icon'];
    description = jsonRes['description'];
    flag = jsonRes['flag'];
    name = jsonRes['name'];
    schema = jsonRes['schema'];
    screen_name = jsonRes['screen_name'];
    user_auth_info = jsonRes['user_auth_info'];
    verified_content = jsonRes['verified_content'];
    motor_auth_show_info = jsonRes['motor_auth_show_info'] == null ? null : new MotorAuthShowInfo.fromJson(jsonRes['motor_auth_show_info']);
  }

  @override
  String toString() {
    return '{"last_update_time": $last_update_time,"media_id": $media_id,"subscribers_count": $subscribers_count,"user_id": $user_id,"user_verified": $user_verified,"follow": $follow,"is_banned": $is_banned,"is_star_user": $is_star_user,"avatar_url": ${avatar_url != null?'${json.encode(avatar_url)}':'null'},"decoration_icon": ${decoration_icon != null?'${json.encode(decoration_icon)}':'null'},"description": ${description != null?'${json.encode(description)}':'null'},"flag": ${flag != null?'${json.encode(flag)}':'null'},"name": ${name != null?'${json.encode(name)}':'null'},"schema": ${schema != null?'${json.encode(schema)}':'null'},"screen_name": ${screen_name != null?'${json.encode(screen_name)}':'null'},"user_auth_info": ${user_auth_info != null?'${json.encode(user_auth_info)}':'null'},"verified_content": ${verified_content != null?'${json.encode(verified_content)}':'null'},"motor_auth_show_info": $motor_auth_show_info}';
  }
}

class MotorAuthShowInfo {

  int auth_v_type;
  String auth_v_desc;

  MotorAuthShowInfo.fromParams({this.auth_v_type, this.auth_v_desc});
  
  MotorAuthShowInfo.fromJson(jsonRes) {
    auth_v_type = jsonRes['auth_v_type'];
    auth_v_desc = jsonRes['auth_v_desc'];
  }

  @override
  String toString() {
    return '{"auth_v_type": $auth_v_type,"auth_v_desc": ${auth_v_desc != null?'${json.encode(auth_v_desc)}':'null'}}';
  }
}


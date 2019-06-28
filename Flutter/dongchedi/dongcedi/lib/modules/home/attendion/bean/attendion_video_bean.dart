import 'dart:convert' show json;

class VideoResp {

  int feed_flag;
  int loginStatus;
  int show_et_status;
  int total_number;
  bool has_more;
  bool has_more_to_refresh;
  String message;
  String post_content_hint;
  List<AttendionVideo> attendionData;
  Tip tips;

  VideoResp.fromParams({this.feed_flag, this.loginStatus, this.show_et_status, this.total_number, this.has_more, this.has_more_to_refresh, this.message, this.post_content_hint, this.attendionData, this.tips});

  factory VideoResp(jsonStr) => jsonStr == null ? null : jsonStr is String ? new VideoResp.fromJson(json.decode(jsonStr)) : new VideoResp.fromJson(jsonStr);
  
  VideoResp.fromJson(jsonRes) {
    feed_flag = jsonRes['feed_flag'];
    loginStatus = jsonRes['login_status'];
    show_et_status = jsonRes['show_et_status'];
    total_number = jsonRes['total_number'];
    has_more = jsonRes['has_more'];
    has_more_to_refresh = jsonRes['has_more_to_refresh'];
    message = jsonRes['message'];
    post_content_hint = jsonRes['post_content_hint'];
    attendionData = jsonRes['data'] == null ? null : [];

    for (var dataItem in attendionData == null ? [] : jsonRes['data']){
            attendionData.add(dataItem == null ? null : new AttendionVideo.fromJson(dataItem));
    }
    tips = jsonRes['tips'] == null ? null : new Tip.fromJson(jsonRes['tips']);
  }

  @override
  String toString() {
    return '{"feed_flag": $feed_flag,"login_status": $loginStatus,"show_et_status": $show_et_status,"total_number": $total_number,"has_more": $has_more,"has_more_to_refresh": $has_more_to_refresh,"message": ${message != null?'${json.encode(message)}':'null'},"post_content_hint": ${post_content_hint != null?'${json.encode(post_content_hint)}':'null'},"data": $attendionData,"tips": $tips}';
  }
}

class Tip {

  int display_duration;
  String app_name;
  String display_info;
  String display_template;
  String download_url;
  String open_url;
  String package_name;
  String type;
  String web_url;

  Tip.fromParams({this.display_duration, this.app_name, this.display_info, this.display_template, this.download_url, this.open_url, this.package_name, this.type, this.web_url});
  
  Tip.fromJson(jsonRes) {
    display_duration = jsonRes['display_duration'];
    app_name = jsonRes['app_name'];
    display_info = jsonRes['display_info'];
    display_template = jsonRes['display_template'];
    download_url = jsonRes['download_url'];
    open_url = jsonRes['open_url'];
    package_name = jsonRes['package_name'];
    type = jsonRes['type'];
    web_url = jsonRes['web_url'];
  }

  @override
  String toString() {
    return '{"display_duration": $display_duration,"app_name": ${app_name != null?'${json.encode(app_name)}':'null'},"display_info": ${display_info != null?'${json.encode(display_info)}':'null'},"display_template": ${display_template != null?'${json.encode(display_template)}':'null'},"download_url": ${download_url != null?'${json.encode(download_url)}':'null'},"open_url": ${open_url != null?'${json.encode(open_url)}':'null'},"package_name": ${package_name != null?'${json.encode(package_name)}':'null'},"type": ${type != null?'${json.encode(type)}':'null'},"web_url": ${web_url != null?'${json.encode(web_url)}':'null'}}';
  }
}

class AttendionVideo {

  int type;
  int unique_id;
  bool duplicate;
  String unique_id_str;
  VideoInfo info;

  AttendionVideo.fromParams({this.type, this.unique_id, this.duplicate, this.unique_id_str, this.info});
  
  AttendionVideo.fromJson(jsonRes) {
    type = jsonRes['type'];
    unique_id = jsonRes['unique_id'];
    duplicate = jsonRes['duplicate'];
    unique_id_str = jsonRes['unique_id_str'];
    info = jsonRes['info'] == null ? null : new VideoInfo.fromJson(jsonRes['info']);
  }

  @override
  String toString() {
    return '{"type": $type,"unique_id": $unique_id,"duplicate": $duplicate,"unique_id_str": ${unique_id_str != null?'${json.encode(unique_id_str)}':'null'},"info": $info}';
  }
}

class VideoInfo {

  String activity_label;
  String activity_theme;
  String article_labels;
  String dizao_info;
  String feature_label;
  String info_desc;
  String poi_label;
  String point_label;
  bool search_label;
  String seek_video_time;
  String series_entrance_info;
  bool user_digg;
  int aggr_type;
  int article_type;
  int behot_time;
  int blank_type;
  int comment_count;
  int cursor;
  int digg_count;
  int display_time;
  int gallary_image_count;
  int group_id;
  int group_type;
  int image_type;
  int item_id;
  int read_count;
  int share_count;
  int video_duration;
  bool duplicate;
  bool motor_top_article;
  bool user_verified;
  String abstract_content;
  String article_url;
  String label;
  String open_url;
  String recommend_reason;
  String share_url;
  String source;
  String title;
  String video_id;
  String wap_display_url;
  List<VideoComment> comment_list;
  List<VideoImage> image_list;
  VideoImprInfo app_impr_info;
  VideoConfig auto_label_config;
  VideoDislikeInfo dislike_info;
  VideoHeadLabel head_label;
  VideoLogPB log_pb;
  VideoMediaInfo media_info;
  VideoShareInfo share_info;
  VideoUserInfo user_info;
  VideoDetailInfo video_detail_info;

  VideoInfo.fromParams({this.activity_label, this.activity_theme, this.article_labels, this.dizao_info, this.feature_label, this.info_desc, this.poi_label, this.point_label, this.search_label, this.seek_video_time, this.series_entrance_info, this.user_digg, this.aggr_type, this.article_type, this.behot_time, this.blank_type, this.comment_count, this.cursor, this.digg_count, this.display_time, this.gallary_image_count, this.group_id, this.group_type, this.image_type, this.item_id, this.read_count, this.share_count, this.video_duration, this.duplicate, this.motor_top_article, this.user_verified, this.abstract_content, this.article_url, this.label, this.open_url, this.recommend_reason, this.share_url, this.source, this.title, this.video_id, this.wap_display_url, this.comment_list, this.image_list, this.app_impr_info, this.auto_label_config, this.dislike_info, this.head_label, this.log_pb, this.media_info, this.share_info, this.user_info, this.video_detail_info});
  
  VideoInfo.fromJson(jsonRes) {
    activity_label = jsonRes['activity_label'];
    activity_theme = jsonRes['activity_theme'];
    article_labels = jsonRes['article_labels'];
    dizao_info = jsonRes['dizao_info'];
    feature_label = jsonRes['feature_label'];
    info_desc = jsonRes['info_desc'];
    poi_label = jsonRes['poi_label'];
    point_label = jsonRes['point_label'];
    search_label = jsonRes['search_label'];
    seek_video_time = jsonRes['seek_video_time'];
    series_entrance_info = jsonRes['series_entrance_info'];
    user_digg = jsonRes['user_digg'];
    aggr_type = jsonRes['aggr_type'];
    article_type = jsonRes['article_type'];
    behot_time = jsonRes['behot_time'];
    blank_type = jsonRes['blank_type'];
    comment_count = jsonRes['comment_count'];
    cursor = jsonRes['cursor'];
    digg_count = jsonRes['digg_count'];
    display_time = jsonRes['display_time'];
    gallary_image_count = jsonRes['gallary_image_count'];
    group_id = jsonRes['group_id'];
    group_type = jsonRes['group_type'];
    image_type = jsonRes['image_type'];
    item_id = jsonRes['item_id'];
    read_count = jsonRes['read_count'];
    share_count = jsonRes['share_count'];
    video_duration = jsonRes['video_duration'];
    duplicate = jsonRes['duplicate'];
    motor_top_article = jsonRes['motor_top_article'];
    user_verified = jsonRes['user_verified'];
    abstract_content = jsonRes['abstract_content'];
    article_url = jsonRes['article_url'];
    label = jsonRes['label'];
    open_url = jsonRes['open_url'];
    recommend_reason = jsonRes['recommend_reason'];
    share_url = jsonRes['share_url'];
    source = jsonRes['source'];
    title = jsonRes['title'];
    video_id = jsonRes['video_id'];
    wap_display_url = jsonRes['wap_display_url'];
    comment_list = jsonRes['comment_list'] == null ? null : [];

    for (var comment_listItem in comment_list == null ? [] : jsonRes['comment_list']){
            comment_list.add(comment_listItem == null ? null : new VideoComment.fromJson(comment_listItem));
    }

    image_list = jsonRes['image_list'] == null ? null : [];

    for (var image_listItem in image_list == null ? [] : jsonRes['image_list']){
            image_list.add(image_listItem == null ? null : new VideoImage.fromJson(image_listItem));
    }

    app_impr_info = jsonRes['app_impr_info'] == null ? null : new VideoImprInfo.fromJson(jsonRes['app_impr_info']);
    auto_label_config = jsonRes['auto_label_config'] == null ? null : new VideoConfig.fromJson(jsonRes['auto_label_config']);
    dislike_info = jsonRes['dislike_info'] == null ? null : new VideoDislikeInfo.fromJson(jsonRes['dislike_info']);
    head_label = jsonRes['head_label'] == null ? null : new VideoHeadLabel.fromJson(jsonRes['head_label']);
    log_pb = jsonRes['log_pb'] == null ? null : new VideoLogPB.fromJson(jsonRes['log_pb']);
    media_info = jsonRes['media_info'] == null ? null : new VideoMediaInfo.fromJson(jsonRes['media_info']);
    share_info = jsonRes['share_info'] == null ? null : new VideoShareInfo.fromJson(jsonRes['share_info']);
    user_info = jsonRes['user_info'] == null ? null : new VideoUserInfo.fromJson(jsonRes['user_info']);
    video_detail_info = jsonRes['video_detail_info'] == null ? null : new VideoDetailInfo.fromJson(jsonRes['video_detail_info']);
  }

  @override
  String toString() {
    return '{"activity_label": ${activity_label != null?'${json.encode(activity_label)}':'null'},"activity_theme": ${activity_theme != null?'${json.encode(activity_theme)}':'null'},"article_labels": ${article_labels != null?'${json.encode(article_labels)}':'null'},"dizao_info": ${dizao_info != null?'${json.encode(dizao_info)}':'null'},"feature_label": ${feature_label != null?'${json.encode(feature_label)}':'null'},"info_desc": ${info_desc != null?'${json.encode(info_desc)}':'null'},"poi_label": ${poi_label != null?'${json.encode(poi_label)}':'null'},"point_label": ${point_label != null?'${json.encode(point_label)}':'null'},"search_label": $search_label,"seek_video_time": ${seek_video_time != null?'${json.encode(seek_video_time)}':'null'},"series_entrance_info": ${series_entrance_info != null?'${json.encode(series_entrance_info)}':'null'},"user_digg": $user_digg,"aggr_type": $aggr_type,"article_type": $article_type,"behot_time": $behot_time,"blank_type": $blank_type,"comment_count": $comment_count,"cursor": $cursor,"digg_count": $digg_count,"display_time": $display_time,"gallary_image_count": $gallary_image_count,"group_id": $group_id,"group_type": $group_type,"image_type": $image_type,"item_id": $item_id,"read_count": $read_count,"share_count": $share_count,"video_duration": $video_duration,"duplicate": $duplicate,"motor_top_article": $motor_top_article,"user_verified": $user_verified,"abstract_content": ${abstract_content != null?'${json.encode(abstract_content)}':'null'},"article_url": ${article_url != null?'${json.encode(article_url)}':'null'},"label": ${label != null?'${json.encode(label)}':'null'},"open_url": ${open_url != null?'${json.encode(open_url)}':'null'},"recommend_reason": ${recommend_reason != null?'${json.encode(recommend_reason)}':'null'},"share_url": ${share_url != null?'${json.encode(share_url)}':'null'},"source": ${source != null?'${json.encode(source)}':'null'},"title": ${title != null?'${json.encode(title)}':'null'},"video_id": ${video_id != null?'${json.encode(video_id)}':'null'},"wap_display_url": ${wap_display_url != null?'${json.encode(wap_display_url)}':'null'},"comment_list": $comment_list,"image_list": $image_list,"app_impr_info": $app_impr_info,"auto_label_config": $auto_label_config,"dislike_info": $dislike_info,"head_label": $head_label,"log_pb": $log_pb,"media_info": $media_info,"share_info": $share_info,"user_info": $user_info,"video_detail_info": $video_detail_info}';
  }
}

class VideoDetailInfo {

  String video_preloading_flag;
  String video_subject_id;
  String video_type;
  String video_url;
  String video_watching_count;
  int auth_token_expire_at;
  int business_token_expire_at;
  int click_play;
  int direct_play;
  int group_flags;
  int show_pgc_subscribe;
  int video_watch_count;
  String auth_token;
  String bussiness_token;
  String video_id;
  String video_play_info;
  String video_third_monitor_url;
  DetailVideoLargeImage detail_video_large_image;

  VideoDetailInfo.fromParams({this.video_preloading_flag, this.video_subject_id, this.video_type, this.video_url, this.video_watching_count, this.auth_token_expire_at, this.business_token_expire_at, this.click_play, this.direct_play, this.group_flags, this.show_pgc_subscribe, this.video_watch_count, this.auth_token, this.bussiness_token, this.video_id, this.video_play_info, this.video_third_monitor_url, this.detail_video_large_image});
  
  VideoDetailInfo.fromJson(jsonRes) {
    video_preloading_flag = jsonRes['video_preloading_flag'];
    video_subject_id = jsonRes['video_subject_id'];
    video_type = jsonRes['video_type'];
    video_url = jsonRes['video_url'];
    video_watching_count = jsonRes['video_watching_count'];
    auth_token_expire_at = jsonRes['auth_token_expire_at'];
    business_token_expire_at = jsonRes['business_token_expire_at'];
    click_play = jsonRes['click_play'];
    direct_play = jsonRes['direct_play'];
    group_flags = jsonRes['group_flags'];
    show_pgc_subscribe = jsonRes['show_pgc_subscribe'];
    video_watch_count = jsonRes['video_watch_count'];
    auth_token = jsonRes['auth_token'];
    bussiness_token = jsonRes['bussiness_token'];
    video_id = jsonRes['video_id'];
    video_play_info = jsonRes['video_play_info'];
    video_third_monitor_url = jsonRes['video_third_monitor_url'];
    detail_video_large_image = jsonRes['detail_video_large_image'] == null ? null : new DetailVideoLargeImage.fromJson(jsonRes['detail_video_large_image']);
  }

  @override
  String toString() {
    return '{"video_preloading_flag": ${video_preloading_flag != null?'${json.encode(video_preloading_flag)}':'null'},"video_subject_id": ${video_subject_id != null?'${json.encode(video_subject_id)}':'null'},"video_type": ${video_type != null?'${json.encode(video_type)}':'null'},"video_url": ${video_url != null?'${json.encode(video_url)}':'null'},"video_watching_count": ${video_watching_count != null?'${json.encode(video_watching_count)}':'null'},"auth_token_expire_at": ${auth_token != null?'${json.encode(auth_token)}':'null'}_expire_at,"business_token_expire_at": $business_token_expire_at,"click_play": $click_play,"direct_play": $direct_play,"group_flags": $group_flags,"show_pgc_subscribe": $show_pgc_subscribe,"video_watch_count": $video_watch_count,"auth_token": ${auth_token != null?'${json.encode(auth_token)}':'null'},"bussiness_token": ${bussiness_token != null?'${json.encode(bussiness_token)}':'null'},"video_id": ${video_id != null?'${json.encode(video_id)}':'null'},"video_play_info": ${video_play_info != null?'${json.encode(video_play_info)}':'null'},"video_third_monitor_url": ${video_third_monitor_url != null?'${json.encode(video_third_monitor_url)}':'null'},"detail_video_large_image": $detail_video_large_image}';
  }
}

class DetailVideoLargeImage {

  int height;
  int type;
  int width;
  String uri;
  String url;
  List<Url> url_list;

  DetailVideoLargeImage.fromParams({this.height, this.type, this.width, this.uri, this.url, this.url_list});
  
  DetailVideoLargeImage.fromJson(jsonRes) {
    height = jsonRes['height'];
    type = jsonRes['type'];
    width = jsonRes['width'];
    uri = jsonRes['uri'];
    url = jsonRes['url'];
    url_list = jsonRes['url_list'] == null ? null : [];

    for (var url_listItem in url_list == null ? [] : jsonRes['url_list']){
            url_list.add(url_listItem == null ? null : new Url.fromJson(url_listItem));
    }
  }

  @override
  String toString() {
    return '{"height": $height,"type": $type,"width": $width,"uri": ${uri != null?'${json.encode(uri)}':'null'},"url": ${url != null?'${json.encode(url)}':'null'},"url_list": $url_list}';
  }
}

class Url {

  String url;

  Url.fromParams({this.url});
  
  Url.fromJson(jsonRes) {
    url = jsonRes['url'];
  }

  @override
  String toString() {
    return '{"url": ${url != null?'${json.encode(url)}':'null'}}';
  }
}

class VideoUserInfo {

  String medal_list;
  int follower_count;
  int user_id;
  bool follow;
  bool user_verified;
  String avatar_url;
  String description;
  String name;
  String schema;
  String user_auth_info;
  String verified_content;
  MotorAuthShowInfo motor_auth_show_info;

  VideoUserInfo.fromParams({this.medal_list, this.follower_count, this.user_id, this.follow, this.user_verified, this.avatar_url, this.description, this.name, this.schema, this.user_auth_info, this.verified_content, this.motor_auth_show_info});
  
  VideoUserInfo.fromJson(jsonRes) {
    medal_list = jsonRes['medal_list'];
    follower_count = jsonRes['follower_count'];
    user_id = jsonRes['user_id'];
    follow = jsonRes['follow'];
    user_verified = jsonRes['user_verified'];
    avatar_url = jsonRes['avatar_url'];
    description = jsonRes['description'];
    name = jsonRes['name'];
    schema = jsonRes['schema'];
    user_auth_info = jsonRes['user_auth_info'];
    verified_content = jsonRes['verified_content'];
    motor_auth_show_info = jsonRes['motor_auth_show_info'] == null ? null : new MotorAuthShowInfo.fromJson(jsonRes['motor_auth_show_info']);
  }

  @override
  String toString() {
    return '{"medal_list": ${medal_list != null?'${json.encode(medal_list)}':'null'},"follower_count": $follower_count,"user_id": $user_id,"follow": $follow,"user_verified": $user_verified,"avatar_url": ${avatar_url != null?'${json.encode(avatar_url)}':'null'},"description": ${description != null?'${json.encode(description)}':'null'},"name": ${name != null?'${json.encode(name)}':'null'},"schema": ${schema != null?'${json.encode(schema)}':'null'},"user_auth_info": ${user_auth_info != null?'${json.encode(user_auth_info)}':'null'},"verified_content": ${verified_content != null?'${json.encode(verified_content)}':'null'},"motor_auth_show_info": $motor_auth_show_info}';
  }
}

class MotorAuthShowInfo {

  String answer_ans_num;
  String answer_digg_num;
  String answer_invited_num;
  String answer_medal_desc_url;
  String answer_medal_url;
  String car_identity_desc;
  int auth_v_type;
  String auth_v_desc;

  MotorAuthShowInfo.fromParams({this.answer_ans_num, this.answer_digg_num, this.answer_invited_num, this.answer_medal_desc_url, this.answer_medal_url, this.car_identity_desc, this.auth_v_type, this.auth_v_desc});
  
  MotorAuthShowInfo.fromJson(jsonRes) {
    answer_ans_num = jsonRes['answer_ans_num'];
    answer_digg_num = jsonRes['answer_digg_num'];
    answer_invited_num = jsonRes['answer_invited_num'];
    answer_medal_desc_url = jsonRes['answer_medal_desc_url'];
    answer_medal_url = jsonRes['answer_medal_url'];
    car_identity_desc = jsonRes['car_identity_desc'];
    auth_v_type = jsonRes['auth_v_type'];
    auth_v_desc = jsonRes['auth_v_desc'];
  }

  @override
  String toString() {
    return '{"answer_ans_num": ${answer_ans_num != null?'${json.encode(answer_ans_num)}':'null'},"answer_digg_num": ${answer_digg_num != null?'${json.encode(answer_digg_num)}':'null'},"answer_invited_num": ${answer_invited_num != null?'${json.encode(answer_invited_num)}':'null'},"answer_medal_desc_url": ${answer_medal_desc_url != null?'${json.encode(answer_medal_desc_url)}':'null'},"answer_medal_url": ${answer_medal_url != null?'${json.encode(answer_medal_url)}':'null'},"car_identity_desc": ${car_identity_desc != null?'${json.encode(car_identity_desc)}':'null'},"auth_v_type": $auth_v_type,"auth_v_desc": ${auth_v_desc != null?'${json.encode(auth_v_desc)}':'null'}}';
  }
}

class VideoShareInfo {

  int weixin_special_type;
  String share_image;
  String share_text;
  String share_url;
  String title;
  String weixin_share_schema;

  VideoShareInfo.fromParams({this.weixin_special_type, this.share_image, this.share_text, this.share_url, this.title, this.weixin_share_schema});
  
  VideoShareInfo.fromJson(jsonRes) {
    weixin_special_type = jsonRes['weixin_special_type'];
    share_image = jsonRes['share_image'];
    share_text = jsonRes['share_text'];
    share_url = jsonRes['share_url'];
    title = jsonRes['title'];
    weixin_share_schema = jsonRes['weixin_share_schema'];
  }

  @override
  String toString() {
    return '{"weixin_special_type": $weixin_special_type,"share_image": ${share_image != null?'${json.encode(share_image)}':'null'},"share_text": ${share_text != null?'${json.encode(share_text)}':'null'},"share_url": ${share_url != null?'${json.encode(share_url)}':'null'},"title": ${title != null?'${json.encode(title)}':'null'},"weixin_share_schema": ${weixin_share_schema != null?'${json.encode(weixin_share_schema)}':'null'}}';
  }
}

class VideoMediaInfo {

  String is_star_user;
  String recommend_reason;
  String recommend_type;
  String user_auth_info;
  int media_id;
  int user_id;
  bool follow;
  bool user_verified;
  String avatar_url;
  String name;
  String schema;
  String verified_content;

  VideoMediaInfo.fromParams({this.is_star_user, this.recommend_reason, this.recommend_type, this.user_auth_info, this.media_id, this.user_id, this.follow, this.user_verified, this.avatar_url, this.name, this.schema, this.verified_content});
  
  VideoMediaInfo.fromJson(jsonRes) {
    is_star_user = jsonRes['is_star_user'];
    recommend_reason = jsonRes['recommend_reason'];
    recommend_type = jsonRes['recommend_type'];
    user_auth_info = jsonRes['user_auth_info'];
    media_id = jsonRes['media_id'];
    user_id = jsonRes['user_id'];
    follow = jsonRes['follow'];
    user_verified = jsonRes['user_verified'];
    avatar_url = jsonRes['avatar_url'];
    name = jsonRes['name'];
    schema = jsonRes['schema'];
    verified_content = jsonRes['verified_content'];
  }

  @override
  String toString() {
    return '{"is_star_user": ${is_star_user != null?'${json.encode(is_star_user)}':'null'},"recommend_reason": ${recommend_reason != null?'${json.encode(recommend_reason)}':'null'},"recommend_type": ${recommend_type != null?'${json.encode(recommend_type)}':'null'},"user_auth_info": ${user_auth_info != null?'${json.encode(user_auth_info)}':'null'},"media_id": $media_id,"user_id": $user_id,"follow": $follow,"user_verified": $user_verified,"avatar_url": ${avatar_url != null?'${json.encode(avatar_url)}':'null'},"name": ${name != null?'${json.encode(name)}':'null'},"schema": ${schema != null?'${json.encode(schema)}':'null'},"verified_content": ${verified_content != null?'${json.encode(verified_content)}':'null'}}';
  }
}

class VideoLogPB {

  String channel_id;
  String impr_id;

  VideoLogPB.fromParams({this.channel_id, this.impr_id});
  
  VideoLogPB.fromJson(jsonRes) {
    channel_id = jsonRes['channel_id'];
    impr_id = jsonRes['impr_id'];
  }

  @override
  String toString() {
    return '{"channel_id": ${channel_id != null?'${json.encode(channel_id)}':'null'},"impr_id": ${impr_id != null?'${json.encode(impr_id)}':'null'}}';
  }
}

class VideoHeadLabel {

  String activity_flag;
  String desc;
  String image;
  int concern_id;
  String name;
  String open_url;

  VideoHeadLabel.fromParams({this.activity_flag, this.desc, this.image, this.concern_id, this.name, this.open_url});
  
  VideoHeadLabel.fromJson(jsonRes) {
    activity_flag = jsonRes['activity_flag'];
    desc = jsonRes['desc'];
    image = jsonRes['image'];
    concern_id = jsonRes['concern_id'];
    name = jsonRes['name'];
    open_url = jsonRes['open_url'];
  }

  @override
  String toString() {
    return '{"activity_flag": ${activity_flag != null?'${json.encode(activity_flag)}':'null'},"desc": ${desc != null?'${json.encode(desc)}':'null'},"image": ${image != null?'${json.encode(image)}':'null'},"concern_id": $concern_id,"name": ${name != null?'${json.encode(name)}':'null'},"open_url": ${open_url != null?'${json.encode(open_url)}':'null'}}';
  }
}

class VideoDislikeInfo {

  int action_type;
  bool show_dislike;
  String action_extra;
  List<VideoFilterWord> filter_words;

  VideoDislikeInfo.fromParams({this.action_type, this.show_dislike, this.action_extra, this.filter_words});
  
  VideoDislikeInfo.fromJson(jsonRes) {
    action_type = jsonRes['action_type'];
    show_dislike = jsonRes['show_dislike'];
    action_extra = jsonRes['action_extra'];
    filter_words = jsonRes['filter_words'] == null ? null : [];

    for (var filter_wordsItem in filter_words == null ? [] : jsonRes['filter_words']){
            filter_words.add(filter_wordsItem == null ? null : new VideoFilterWord.fromJson(filter_wordsItem));
    }
  }

  @override
  String toString() {
    return '{"action_type": $action_type,"show_dislike": $show_dislike,"action_extra": ${action_extra != null?'${json.encode(action_extra)}':'null'},"filter_words": $filter_words}';
  }
}

class VideoFilterWord {

  bool is_selected;
  String id;
  String name;

  VideoFilterWord.fromParams({this.is_selected, this.id, this.name});
  
  VideoFilterWord.fromJson(jsonRes) {
    is_selected = jsonRes['is_selected'];
    id = jsonRes['id'];
    name = jsonRes['name'];
  }

  @override
  String toString() {
    return '{"is_selected": $is_selected,"id": ${id != null?'${json.encode(id)}':'null'},"name": ${name != null?'${json.encode(name)}':'null'}}';
  }
}

class VideoConfig {

  String activity_flag;
  String desc;
  String image;
  int concern_id;
  String name;
  String open_url;

  VideoConfig.fromParams({this.activity_flag, this.desc, this.image, this.concern_id, this.name, this.open_url});
  
  VideoConfig.fromJson(jsonRes) {
    activity_flag = jsonRes['activity_flag'];
    desc = jsonRes['desc'];
    image = jsonRes['image'];
    concern_id = jsonRes['concern_id'];
    name = jsonRes['name'];
    open_url = jsonRes['open_url'];
  }

  @override
  String toString() {
    return '{"activity_flag": ${activity_flag != null?'${json.encode(activity_flag)}':'null'},"desc": ${desc != null?'${json.encode(desc)}':'null'},"image": ${image != null?'${json.encode(image)}':'null'},"concern_id": $concern_id,"name": ${name != null?'${json.encode(name)}':'null'},"open_url": ${open_url != null?'${json.encode(open_url)}':'null'}}';
  }
}

class VideoImprInfo {

  int style;
  int sub_style;

  VideoImprInfo.fromParams({this.style, this.sub_style});
  
  VideoImprInfo.fromJson(jsonRes) {
    style = jsonRes['style'];
    sub_style = jsonRes['sub_style'];
  }

  @override
  String toString() {
    return '{"style": $style,"sub_style": $sub_style}';
  }
}

class VideoImage {

  int height;
  int type;
  int width;
  String uri;
  String url;
  List<VideoUrl> url_list;

  VideoImage.fromParams({this.height, this.type, this.width, this.uri, this.url, this.url_list});
  
  VideoImage.fromJson(jsonRes) {
    height = jsonRes['height'];
    type = jsonRes['type'];
    width = jsonRes['width'];
    uri = jsonRes['uri'];
    url = jsonRes['url'];
    url_list = jsonRes['url_list'] == null ? null : [];

    for (var url_listItem in url_list == null ? [] : jsonRes['url_list']){
            url_list.add(url_listItem == null ? null : new VideoUrl.fromJson(url_listItem));
    }
  }

  @override
  String toString() {
    return '{"height": $height,"type": $type,"width": $width,"uri": ${uri != null?'${json.encode(uri)}':'null'},"url": ${url != null?'${json.encode(url)}':'null'},"url_list": $url_list}';
  }
}

class VideoUrl {

  String url;

  VideoUrl.fromParams({this.url});
  
  VideoUrl.fromJson(jsonRes) {
    url = jsonRes['url'];
  }

  @override
  String toString() {
    return '{"url": ${url != null?'${json.encode(url)}':'null'}}';
  }
}

class VideoComment {

  String bury_count;
  String create_time;
  String forum_id;
  String motor_auth_show_info;
  String motor_identity_info;
  String platform;
  String reply_count;
  String schema;
  String user_bury;
  String user_info;
  int comment_id;
  int digg_count;
  int from_friend;
  int label_flag;
  int type;
  int user_digg;
  int user_id;
  bool adopted;
  bool high_quality_comment;
  bool user_verfied;
  String avatar_url;
  String text;
  String user_auth_info;
  String user_name;
  List<dynamic> image_list;
  List<VideoReply> reply_list;

  VideoComment.fromParams({this.bury_count, this.create_time, this.forum_id, this.motor_auth_show_info, this.motor_identity_info, this.platform, this.reply_count, this.schema, this.user_bury, this.user_info, this.comment_id, this.digg_count, this.from_friend, this.label_flag, this.type, this.user_digg, this.user_id, this.adopted, this.high_quality_comment, this.user_verfied, this.avatar_url, this.text, this.user_auth_info, this.user_name, this.image_list, this.reply_list});
  
  VideoComment.fromJson(jsonRes) {
    bury_count = jsonRes['bury_count'];
    create_time = jsonRes['create_time'];
    forum_id = jsonRes['forum_id'];
    motor_auth_show_info = jsonRes['motor_auth_show_info'];
    motor_identity_info = jsonRes['motor_identity_info'];
    platform = jsonRes['platform'];
    reply_count = jsonRes['reply_count'];
    schema = jsonRes['schema'];
    user_bury = jsonRes['user_bury'];
    user_info = jsonRes['user_info'];
    comment_id = jsonRes['comment_id'];
    digg_count = jsonRes['digg_count'];
    from_friend = jsonRes['from_friend'];
    label_flag = jsonRes['label_flag'];
    type = jsonRes['type'];
    user_digg = jsonRes['user_digg'];
    user_id = jsonRes['user_id'];
    adopted = jsonRes['adopted'];
    high_quality_comment = jsonRes['high_quality_comment'];
    user_verfied = jsonRes['user_verfied'];
    avatar_url = jsonRes['avatar_url'];
    text = jsonRes['text'];
    user_auth_info = jsonRes['user_auth_info'];
    user_name = jsonRes['user_name'];
    image_list = jsonRes['image_list'] == null ? null : [];

    for (var image_listItem in image_list == null ? [] : jsonRes['image_list']){
            image_list.add(image_listItem);
    }

    reply_list = jsonRes['reply_list'] == null ? null : [];

    for (var reply_listItem in reply_list == null ? [] : jsonRes['reply_list']){
            reply_list.add(reply_listItem == null ? null : new VideoReply.fromJson(reply_listItem));
    }
  }

  @override
  String toString() {
    return '{"bury_count": ${bury_count != null?'${json.encode(bury_count)}':'null'},"create_time": ${create_time != null?'${json.encode(create_time)}':'null'},"forum_id": ${forum_id != null?'${json.encode(forum_id)}':'null'},"motor_auth_show_info": ${motor_auth_show_info != null?'${json.encode(motor_auth_show_info)}':'null'},"motor_identity_info": ${motor_identity_info != null?'${json.encode(motor_identity_info)}':'null'},"platform": ${platform != null?'${json.encode(platform)}':'null'},"reply_count": ${reply_count != null?'${json.encode(reply_count)}':'null'},"schema": ${schema != null?'${json.encode(schema)}':'null'},"user_bury": ${user_bury != null?'${json.encode(user_bury)}':'null'},"user_info": ${user_info != null?'${json.encode(user_info)}':'null'},"comment_id": $comment_id,"digg_count": $digg_count,"from_friend": $from_friend,"label_flag": $label_flag,"type": $type,"user_digg": $user_digg,"user_id": $user_id,"adopted": $adopted,"high_quality_comment": $high_quality_comment,"user_verfied": $user_verfied,"avatar_url": ${avatar_url != null?'${json.encode(avatar_url)}':'null'},"text": ${text != null?'${json.encode(text)}':'null'},"user_auth_info": ${user_auth_info != null?'${json.encode(user_auth_info)}':'null'},"user_name": ${user_name != null?'${json.encode(user_name)}':'null'},"image_list": $image_list,"reply_list": $reply_list}';
  }
}

class VideoReply {

  int id;
  int label_flag;
  int user_id;
  String avatar_url;
  String text;
  String user_name;
  List<List<VideoImage>> image_list;

  VideoReply.fromParams({this.id, this.label_flag, this.user_id, this.avatar_url, this.text, this.user_name, this.image_list});
  
  VideoReply.fromJson(jsonRes) {
    id = jsonRes['id'];
    label_flag = jsonRes['label_flag'];
    user_id = jsonRes['user_id'];
    avatar_url = jsonRes['avatar_url'];
    text = jsonRes['text'];
    user_name = jsonRes['user_name'];
    image_list = jsonRes['image_list'] == null ? null : [];

    for (var image_listItem in image_list == null ? [] : jsonRes['image_list']){      
  List<VideoImage> image_listChild = image_listItem == null ? null : [];
    for (var image_listItemItem in image_listChild == null ? [] : image_listItem){
            image_listChild.add(image_listItemItem == null ? null : new VideoImage.fromJson(image_listItemItem));
    }
      image_list.add(image_listChild);
    }
  }

  @override
  String toString() {
    return '{"id": $id,"label_flag": $label_flag,"user_id": $user_id,"avatar_url": ${avatar_url != null?'${json.encode(avatar_url)}':'null'},"text": ${text != null?'${json.encode(text)}':'null'},"user_name": ${user_name != null?'${json.encode(user_name)}':'null'},"image_list": $image_list}';
  }
}


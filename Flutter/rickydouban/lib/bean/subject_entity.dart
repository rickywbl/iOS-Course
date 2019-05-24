import 'dart:convert' show json;

class SubjectResp {

  int count;
  int start;
  int total;
  String title;
  List<Subject> subjects;

  SubjectResp.fromParams({this.count, this.start, this.total, this.title, this.subjects});

  factory SubjectResp(jsonStr) => jsonStr == null ? null : jsonStr is String ? new SubjectResp.fromJson(json.decode(jsonStr)) : new SubjectResp.fromJson(jsonStr);
  
  SubjectResp.fromJson(jsonRes) {
    count = jsonRes['count'];
    start = jsonRes['start'];
    total = jsonRes['total'];
    title = jsonRes['title'];
    subjects = jsonRes['subjects'] == null ? null : [];

    for (var subjectsItem in subjects == null ? [] : jsonRes['subjects']){
            subjects.add(subjectsItem == null ? null : new Subject.fromJson(subjectsItem));
    }
  }

  @override
  String toString() {
    return '{"count": $count,"start": $start,"total": $total,"title": ${title != null?'${json.encode(title)}':'null'},"subjects": $subjects}';
  }
}

class Subject {

  int collect_count;
  bool has_video;
  String alt;
  String id;
  String mainland_pubdate;
  String original_title;
  String subtype;
  String title;
  String year;
  List<Cast> casts;
  List<Director> directors;
  List<String> durations;
  List<String> genres;
  List<String> pubdates;
  SubjectImage images;
  Rating rating;

  Subject.fromParams({this.collect_count, this.has_video, this.alt, this.id, this.mainland_pubdate, this.original_title, this.subtype, this.title, this.year, this.casts, this.directors, this.durations, this.genres, this.pubdates, this.images, this.rating});
  
  Subject.fromJson(jsonRes) {
    collect_count = jsonRes['collect_count'];
    has_video = jsonRes['has_video'];
    alt = jsonRes['alt'];
    id = jsonRes['id'];
    mainland_pubdate = jsonRes['mainland_pubdate'];
    original_title = jsonRes['original_title'];
    subtype = jsonRes['subtype'];
    title = jsonRes['title'];
    year = jsonRes['year'];
    casts = jsonRes['casts'] == null ? null : [];

    for (var castsItem in casts == null ? [] : jsonRes['casts']){
            casts.add(castsItem == null ? null : new Cast.fromJson(castsItem));
    }

    directors = jsonRes['directors'] == null ? null : [];

    for (var directorsItem in directors == null ? [] : jsonRes['directors']){
            directors.add(directorsItem == null ? null : new Director.fromJson(directorsItem));
    }

    durations = jsonRes['durations'] == null ? null : [];

    for (var durationsItem in durations == null ? [] : jsonRes['durations']){
            durations.add(durationsItem);
    }

    genres = jsonRes['genres'] == null ? null : [];

    for (var genresItem in genres == null ? [] : jsonRes['genres']){
            genres.add(genresItem);
    }

    pubdates = jsonRes['pubdates'] == null ? null : [];

    for (var pubdatesItem in pubdates == null ? [] : jsonRes['pubdates']){
            pubdates.add(pubdatesItem);
    }

    images = jsonRes['images'] == null ? null : new SubjectImage.fromJson(jsonRes['images']);
    rating = jsonRes['rating'] == null ? null : new Rating.fromJson(jsonRes['rating']);
  }

  @override
  String toString() {
    return '{"collect_count": $collect_count,"has_video": $has_video,"alt": ${alt != null?'${json.encode(alt)}':'null'},"id": ${id != null?'${json.encode(id)}':'null'},"mainland_pubdate": ${mainland_pubdate != null?'${json.encode(mainland_pubdate)}':'null'},"original_title": ${original_title != null?'${json.encode(original_title)}':'null'},"subtype": ${subtype != null?'${json.encode(subtype)}':'null'},"title": ${title != null?'${json.encode(title)}':'null'},"year": ${year != null?'${json.encode(year)}':'null'},"casts": $casts,"directors": $directors,"durations": $durations,"genres": $genres,"pubdates": $pubdates,"images": $images,"rating": $rating}';
  }
}

class Rating {

  dynamic max;
  dynamic min;
  dynamic average;
  String stars;
  Detail details;

  Rating.fromParams({this.max, this.min, this.average, this.stars, this.details});
  
  Rating.fromJson(jsonRes) {
    max = jsonRes['max'];
    min = jsonRes['min'];
    average = jsonRes['average'];
    stars = jsonRes['stars'];
    // details = jsonRes['details'] == null ? null : new Detail.fromJson(jsonRes['details']);
  }

  @override
  String toString() {
    return '{"max": $max,"min": $min,"average": $average,"stars": ${stars != null?'${json.encode(stars)}':'null'},"details": $details}';
  }
}

class Detail {

  dynamic first;
  dynamic second;
  dynamic third;
  dynamic four;
  dynamic five;

  Detail.fromParams({this.first, this.second, this.third, this.four, this.five});
  
  Detail.fromJson(jsonRes) {
    first = jsonRes['1'];
    second = jsonRes['2'];
    third = jsonRes['3'];
    four = jsonRes['4'];
    five = jsonRes['5'];
  }

  @override
  String toString() {
    return '{"1": $first,"2": $second,"3": $third,"4": $four,"5": $five}';
  }
}

class SubjectImage {

  String large;
  String medium;
  String small;

  SubjectImage.fromParams({this.large, this.medium, this.small});
  
  SubjectImage.fromJson(jsonRes) {
    large = jsonRes['large'];
    medium = jsonRes['medium'];
    small = jsonRes['small'];
  }

  @override
  String toString() {
    return '{"large": ${large != null?'${json.encode(large)}':'null'},"medium": ${medium != null?'${json.encode(medium)}':'null'},"small": ${small != null?'${json.encode(small)}':'null'}}';
  }
}

class Director {

  String alt;
  String id;
  String name;
  String name_en;
  Avatar avatars;

  Director.fromParams({this.alt, this.id, this.name, this.name_en, this.avatars});
  
  Director.fromJson(jsonRes) {
    alt = jsonRes['alt'];
    id = jsonRes['id'];
    name = jsonRes['name'];
    name_en = jsonRes['name_en'];
    avatars = jsonRes['avatars'] == null ? null : new Avatar.fromJson(jsonRes['avatars']);
  }

  @override
  String toString() {
    return '{"alt": ${alt != null?'${json.encode(alt)}':'null'},"id": ${id != null?'${json.encode(id)}':'null'},"name": ${name != null?'${json.encode(name)}':'null'},"name_en": ${name_en != null?'${json.encode(name_en)}':'null'},"avatars": $avatars}';
  }
}

class Avatar {

  String large;
  String medium;
  String small;

  Avatar.fromParams({this.large, this.medium, this.small});
  
  Avatar.fromJson(jsonRes) {
    large = jsonRes['large'];
    medium = jsonRes['medium'];
    small = jsonRes['small'];
  }

  @override
  String toString() {
    return '{"large": ${large != null?'${json.encode(large)}':'null'},"medium": ${medium != null?'${json.encode(medium)}':'null'},"small": ${small != null?'${json.encode(small)}':'null'}}';
  }
}

class Cast {

  String alt;
  String id;
  String name;
  String name_en;
  Avatar avatars;

  Cast.fromParams({this.alt, this.id, this.name, this.name_en, this.avatars});
  
  Cast.fromJson(jsonRes) {
    alt = jsonRes['alt'];
    id = jsonRes['id'];
    name = jsonRes['name'];
    name_en = jsonRes['name_en'];
    avatars = jsonRes['avatars'] == null ? null : new Avatar.fromJson(jsonRes['avatars']);
  }

  @override
  String toString() {
    return '{"alt": ${alt != null?'${json.encode(alt)}':'null'},"id": ${id != null?'${json.encode(id)}':'null'},"name": ${name != null?'${json.encode(name)}':'null'},"name_en": ${name_en != null?'${json.encode(name_en)}':'null'},"avatars": $avatars}';
  }
}



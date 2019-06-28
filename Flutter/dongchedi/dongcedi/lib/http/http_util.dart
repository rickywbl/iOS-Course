import 'package:dio/dio.dart';


class HttpUtil {
  static final host = 'https://is.snssdk.com/';
  static HttpUtil instance;
  Dio dio;
  BaseOptions options;

  static HttpUtil getInstance (){
    if (instance == null){
      instance = new HttpUtil();
    }
    return instance;
  }

  HttpUtil() {
    BaseOptions options = new BaseOptions(
      baseUrl: host,
      connectTimeout: 5000,
      responseType : ResponseType.plain,
    );
    dio = new Dio(options);
  }

  Future<dynamic> get(url, {data}) async {
    Response response;
    try{
      response = await dio.get(
        url,
        queryParameters: data,
      );
      print('get请求成功!response.data：${response.data}');
    } on DioError catch (e){
      if (CancelToken.isCancel(e)){
        print('get请求取消! ' + e.message);
      }
      print('get请求发生错误：$e');
    }
    return response;
  }

  Future<dynamic> post(url,{data,options,cancelToken}) async {
    Response response;
    try {
      response = await dio.post(
        url,
        data : data,
        cancelToken: cancelToken
      );
      print('post请求成功!response.data：${response.data}');
    } on DioError catch (e) {
      if (CancelToken.isCancel(e)) {
        print('post请求取消! ' + e.message);
      }
      print('post请求发生错误：$e');
    }
    return response.data;
  }

}
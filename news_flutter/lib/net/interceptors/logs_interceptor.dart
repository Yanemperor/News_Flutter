

import 'package:dio/dio.dart';
import 'package:news_flutter/common/constant.dart' show APPConfig;


class LogsInterceptor extends InterceptorsWrapper {


  @override
  Future onRequest(RequestOptions options) {
    if (APPConfig.DEBUG) {
      print("请求url:${options.path}");
      print("请求头: ${options.headers.toString()}");
      print("请求参数:${options.data.toString()}");
    }
    return super.onRequest(options);
  }

  @override
  Future onResponse(Response response) {
    if (APPConfig.DEBUG){
      print("RESPONSE[${response?.statusCode}] => PATH: ${response?.request?.path}");
    }
    return super.onResponse(response);
  }

  @override
  Future onError(DioError err) {
    if (APPConfig.DEBUG){
      print("ERROR[${err?.response?.statusCode}] => PATH: ${err?.request?.path}");
    }
    return super.onError(err);
  }

}

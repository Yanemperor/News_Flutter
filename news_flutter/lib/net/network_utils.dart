
import 'package:dio/dio.dart';
import 'package:news_flutter/common/constant.dart';
import 'package:news_flutter/models/BaseResult.dart';
import 'package:news_flutter/net/http_manager.dart';

class NetworkUtils {
  static requestNewsList(int page) async {
    String url = APPConfig.Server + "/nc/article/headline/T1348647853363/$page-20.html";
    BaseResult result = await httpManager.request(HttpMethod.GET, url, null);
    return result;
  }

  static requestNewsDetail(String id) async {
    String url = APPConfig.Server + "/nc/article/" + id + "/full.html";
    BaseResult result = await httpManager.request(HttpMethod.GET, url, null);
    return result;
  }

}
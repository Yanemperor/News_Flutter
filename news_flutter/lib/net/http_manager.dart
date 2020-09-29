

import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:dio/dio.dart';
import 'package:news_flutter/models/BaseResult.dart';
import 'package:news_flutter/net/code.dart';
import 'package:news_flutter/utils/user_utils.dart';

enum HttpMethod { GET, POST }

const HTTPMethodValues = ['GET', 'POST'];
const ContentTypeURLEncoded = 'application/x-www-form-urlencoded';

class HttpManager {
  Dio _dio = Dio();
  HttpManager() {
    _dio.interceptors.add(LogInterceptor());
  }



  request(HttpMethod method, String url, Map<String, dynamic> params,
      {ContentType contentType}) async {
    Options _options;
    Map<String, dynamic> header;

    var type = contentType == null
        ? Headers.jsonContentType
        : Headers.formUrlEncodedContentType;
    if (UserUtils.isLogin()) {
      header = {'token': ""};
    }

    if (method == HttpMethod.GET) {
      _options = Options(
          method: HTTPMethodValues[method.index],
          contentType: type,
          headers: header);
    } else {
      _options = Options(
          method: HTTPMethodValues[method.index],
          contentType: type,
          headers: header);
    }

    Response response;
    try {
      if (method == HttpMethod.GET) {
        response =
        await _dio.get(url, queryParameters: params, options: _options);
      } else {
        response = await _dio.post(url, data: params, options: _options);
      }
    } on DioError catch (e) {
      if (e.response != null) {
        response = e.response;
      } else {
        response = Response(statusCode: 999, statusMessage: "请求失败,稍后再试！");
      }

      if (e.type == DioErrorType.CONNECT_TIMEOUT ||
          e.type == DioErrorType.RECEIVE_TIMEOUT) {
        response.statusCode = Code.NETWORK_TIMEOUT;
        response.statusMessage = "请求超时,请稍后再试!";
      }
      response.data =
          BaseResult(null, response.statusCode, response.statusMessage);
    }
//    String dataString = json.encode(response.data);
    BaseResult baseResult = BaseResult(response.data, response.statusCode, response.statusMessage);
    return baseResult;
  }

  upload(String url, Uint8List data) async {
    FormData formData = FormData.fromMap({
      "file" : MultipartFile.fromBytes(data, filename: "fileName"),
    });

    Map<String, dynamic> header = {
      "token" : ""
    };

    Response response;
    try {
      response = await _dio.put(url, data: formData, options: Options(headers: header));
    } on DioError catch (e) {
      if (e.response != null) {
        response = e.response;
      }else{
        response = Response(statusCode: 999, statusMessage: "请求失败, 稍后再试");
      }
      if (e.type == DioErrorType.CONNECT_TIMEOUT || e.type == DioErrorType.RECEIVE_TIMEOUT) {
        response.statusCode = Code.NETWORK_TIMEOUT;
        response.statusMessage = "请求超时, 请稍后再试!";
      }
      response.data = BaseResult(null, response.statusCode, response.statusMessage);
    }
    return response.data;
  }
}

final HttpManager httpManager = HttpManager();




















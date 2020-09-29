
import 'dart:convert';
import 'dart:ffi';

import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:news_flutter/pages/application_page.dart';
import 'package:news_flutter/pages/login/login_page.dart';
import 'package:news_flutter/pages/news_detail/news_detail_page.dart';
import 'package:news_flutter/pages/web/webview_page.dart';

var rootHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return ApplicationPage();
  }
);

var mainHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      return ApplicationPage();
    }
);

var loginHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      return LoginPage();
    }
);

var webHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      String title = params["title"]?.first;
      var list = List<int>();
      jsonDecode(title).forEach(list.add);
      title = Utf8Decoder().convert(list);
      String url = params["url"]?.first;
      return WebviewPage(title: title, url: url);
    }
);

var newDetailHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      String id = params["id"]?.first;
      return NewsDetailPage(id: id);
    }
);
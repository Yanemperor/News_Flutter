

import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'router_handlers.dart';

class Routers {
  static String rootPage = "/";
  static String webPage = "/webPage";
  static String loginPage = "/loginPage";
  static String newsDetailPage = "/newsDetailPage";

  static void configureRoutes(Router router) {
    router.notFoundHandler = Handler(handlerFunc: (BuildContext content, Map<String, List<String>> params) {
      print("ROUTE WAS NOT FOUND !!!");
      return null;
    });

    router.define(rootPage, handler: rootHandler);
    router.define(loginPage, handler: loginHandler);
    router.define(webPage, handler: webHandler);
    router.define(newsDetailPage, handler: newDetailHandler);

  }


}
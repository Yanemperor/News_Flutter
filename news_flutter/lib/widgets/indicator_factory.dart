

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

Widget buildDefaultHeader() {
  return ClassicHeader(
    failedText: "刷新失败!",
    completeText: "刷新完成!",
    releaseText: "释放可以刷新",
    idleText: "下拉刷新!",
    refreshingText: "正在刷新",
    failedIcon: Icon(Icons.clear, color: Colors.black),
    completeIcon: Icon(Icons.done, color: Colors.black),
    idleIcon: Icon(Icons.arrow_downward, color: Colors.black),
    releaseIcon: Icon(Icons.arrow_upward, color: Colors.black),
  );
}

Widget buildDefaultFooter() {
  return ClassicFooter(
    idleIcon: Icon(Icons.arrow_upward, color: Colors.black),
    loadingText: "正在加载中",
    idleText: "上拉加载",
    noDataText: "没有加载更多数据",
  );
}
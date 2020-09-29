
//import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_flutter/common/constant.dart';
import 'package:news_flutter/models/BaseResult.dart';
import 'package:news_flutter/models/index.dart';
import 'package:news_flutter/net/http_manager.dart';
import 'package:news_flutter/net/network_utils.dart';
import 'package:news_flutter/pages/home/news_list_item_view.dart';
import 'package:news_flutter/routes/NewsRouter.dart';
import 'package:news_flutter/routes/routers.dart';
import 'package:news_flutter/widgets/indicator_factory.dart';
import 'package:news_flutter/widgets/load_state_layout_widget.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class NewsListPage extends StatefulWidget {
  String title = "";
  NewsListPage ({
    Key key,
    @required this.title,

  }) : super(key: key);

  @override
  _NewsListPageState createState() => _NewsListPageState();
}

class _NewsListPageState extends State<NewsListPage> with AutomaticKeepAliveClientMixin {

  LoadState _layoutState = LoadState.State_Loading;

  RefreshController _refreshController;

  List<NewsListModel> newsItems = [];

  bool get wantKeepAlive => true;

  int _page = 0;

  SmartRefresher _buildRefreshListView() {
    return SmartRefresher(
      controller: _refreshController,
      enablePullUp: true,
      enablePullDown: true,
      header: buildDefaultHeader(),
      footer: buildDefaultFooter(),
      onRefresh: () {
        _loadData(loadMore: false);
      },
      onLoading: () {
        _loadData(loadMore: true);
      },
      child: ListView.builder(
        itemCount: newsItems.length,
        itemBuilder: (context, index) {
          var model = this.newsItems[index];
          return NewsListItemView(model: model, onPressed: () {
//            NewsRouter.push(context, Routers.webPage, {"title":model.title, "url":model.url});
            NewsRouter.push(context, Routers.newsDetailPage, {"id":model.docid});
          });
        },
      )
    );
  }

  @override
  void initState() {
    super.initState();
    _refreshController = RefreshController();
    _loadData();
  }


  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Container(
      color: Colors.white,
      child: LoadStateLayout(
        state: _layoutState,
        errorRetry: () {
          setState(() {
            _layoutState = LoadState.State_Loading;
          });
          this._loadData();
        },
        successWidget: _buildRefreshListView(),
      ),
    );
  }

  void _loadData({bool loadMore = false}) async {
    if (loadMore) {
      _page = _page + 20;
    }else{
      _page = 0;
    }

    NetworkUtils.requestNewsList(_page).then((res) {
      BaseResult baseResult = res;
      if (baseResult.status == 200) {
        List list = baseResult.data["T1348647853363"];
        List<NewsListModel> tempList = list.map((e) {
          return NewsListModel.fromJson(e);
        }).toList();
        if (loadMore) {
          print(tempList.length);
          this.newsItems.addAll(tempList);
          if (tempList.length < 20) {
            _refreshController.loadNoData();
          }else{
            _refreshController.loadComplete();
          }
          setState(() {

          });
        }else{
          this.newsItems = tempList;
          _refreshController.refreshCompleted();
          if (newsItems.length == 0) {
            setState(() {
              _layoutState = LoadState.State_Empty;
            });
          }else{
            setState(() {
              _layoutState = LoadState.State_Success;
            });
          }
        }
      }else{
        // 请求失败
        if (loadMore) {
          _refreshController.loadComplete();
          setState(() {

          });
        }else{
          _refreshController.refreshFailed();
          setState(() {
            _layoutState = loadStateByErrorCode(baseResult.status);
          });
        }
      }
    });
  }
}













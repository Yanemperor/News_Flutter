

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_flutter/common/constant.dart';
import 'package:news_flutter/pages/circle/circle_page.dart';
import 'package:news_flutter/pages/home/home_page.dart';
import 'package:news_flutter/pages/hot_list/hot_list_page.dart';
import 'package:news_flutter/pages/movie/movie_page.dart';
import 'package:news_flutter/pages/my/my_page.dart';
import 'package:news_flutter/routes/NewsRouter.dart';
import 'package:news_flutter/routes/routers.dart';

class ApplicationPage extends StatefulWidget {
  @override
  _ApplicationPage createState() => _ApplicationPage();
}

class _ApplicationPage extends State<ApplicationPage> with SingleTickerProviderStateMixin {
  int page = 0;
  PageController pageController;
  IconButton _searchBtn;

  // 定义底部导航栏目
  final List<BottomNavigationBarItem> _bottomTabs = <BottomNavigationBarItem>[
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      title: Text('首页'),
      backgroundColor: APPColors.PrimaryColor,
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.ondemand_video),
      title: Text('视频'),
      backgroundColor: APPColors.PrimaryColor,
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.whatshot),
      title: Text('热榜'),
      backgroundColor: APPColors.PrimaryColor,
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.blur_circular),
      title: Text('圈子'),
      backgroundColor: APPColors.PrimaryColor,
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.person),
      title: Text('我的'),
      backgroundColor: APPColors.PrimaryColor,
    ),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _searchBtn = IconButton(
      icon: Icon(Icons.search),
      onPressed: () {
        NewsRouter.push(context, Routers.rootPage, {});
      },
    );
    pageController = PageController(initialPage: this.page);
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        /// 去除滑动手势
        children: [
          HomePage(),
          MoviePage(),
          HotListPage(),
          CirclePage(),
          MyPage(),
        ],
        controller: pageController,
        onPageChanged: (int index) {
          onPageChanged(index);
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: _bottomTabs,
        currentIndex: page,
        fixedColor: APPColors.PrimaryColor,
        type: BottomNavigationBarType.fixed,
        onTap: (int index) {
          onTap(index);
        },
      ),
    );
  }

  void onTap(int index) {
    pageController.jumpToPage(index);
  }

  void onPageChanged(int page) {
    print(page);
    setState(() {
      this.page = page;
    });
  }


}





















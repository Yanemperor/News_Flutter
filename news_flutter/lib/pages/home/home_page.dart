
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_flutter/pages/home/news_list_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {

  TabController _tabController;
  List tabs = ["关注", "头条", "抗疫", "娱乐", "体育", "新时代", "视频"];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: tabs.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('首页')
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  height: 50,
                  padding: const EdgeInsets.only(right: 40),
                  color: Color(0xffF9F9F9),
                  alignment: Alignment.center,
                  child: TabBar(
                    isScrollable: true,
                    indicatorColor: Color(0xffFF3700),
                    indicator: UnderlineTabIndicator(
                      borderSide: BorderSide(color: Color(0xffFF3700), width: 2),
                      insets: const EdgeInsets.only(bottom: 7),
                    ),
                    labelColor: Color(0xff333333),
                    unselectedLabelColor: Color(0xff666666),
                    labelStyle: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w700),
                    unselectedLabelStyle: TextStyle(fontSize: 16.0),
                    controller: _tabController,
                    tabs: tabs.map((e) => Tab(text: e)).toList(),
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                    icon: Icon(Icons.add),
                    onPressed: () {

                    },
                  ),
                ),
              ],
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: tabs.map((e) => NewsListPage(title: e)).toList(),
              ),
            )
          ]
        ),
      ),
    );
  }
}


















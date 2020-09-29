
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HotListPage extends StatefulWidget {
  @override
  _HotListPageState createState() => _HotListPageState();
}

class _HotListPageState extends State<HotListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('热榜'),
      ),
    );
  }
}
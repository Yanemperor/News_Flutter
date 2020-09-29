import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:news_flutter/common/constant.dart';
import 'package:news_flutter/routes/NewsRouter.dart';
import 'package:news_flutter/routes/routers.dart';
import 'package:news_flutter/utils/local_storage_utils.dart';
import 'package:oktoast/oktoast.dart';

void main() async {
  // 如果需要在runAPP之前初始化数据, 就需要加这句
  WidgetsFlutterBinding.ensureInitialized();
  await LocalStorage.getInstance();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp() {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    final router = Router();
    Routers.configureRoutes(router);
    NewsRouter.initWithRouter(router);
  }

  @override
  Widget build(BuildContext context) {
    return OKToast(
      textStyle: TextStyle(fontSize: 16.0, color: Colors.white),
      backgroundColor: Colors.black87,
      radius: 6.0,
      child: MaterialApp(
        title: "Flutter新闻",
        theme: ThemeData(
          primaryColor: APPColors.PrimaryColor,
          backgroundColor: Colors.white
        ),
        onGenerateRoute: NewsRouter.router().generator,
      ),
    );
  }
}
























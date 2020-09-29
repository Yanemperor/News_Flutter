
import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/html_parser.dart';
import 'package:flutter_html/style.dart';
import 'package:news_flutter/models/BaseResult.dart';
import 'package:news_flutter/models/index.dart';
import 'package:news_flutter/net/network_utils.dart';
import 'package:news_flutter/widgets/load_state_layout_widget.dart';
import 'package:path_provider/path_provider.dart';

class NewsDetailPage extends StatefulWidget {

  final String id;

  NewsDetailPage({
    Key key,
    @required this.id
  }) : super(key : key);

  @override
  _NewsDetailPageState createState() => _NewsDetailPageState();
}

class _NewsDetailPageState extends State<NewsDetailPage> {

  LoadState _layoutState = LoadState.State_Loading;

  NewsDetailModel _detailModel = NewsDetailModel();

  var _htmlString = "";

  @override
  void initState() {
    super.initState();
    _loadData();
//    _showInWebView();
  }

  void _loadData() async {
    String id = this.widget.id ?? "";
    if (id.isEmpty) return;
    NetworkUtils.requestNewsDetail(id).then((res) {
      BaseResult baseResult = res;
      if (baseResult.status == 200) {
        Map map = baseResult.data;
//        print("map:$map");
        this._detailModel = NewsDetailModel.fromJson(map[map.keys.first]);

        _showInWebView();
        setState(() {
//          this._htmlString = _showInWebView();
        _showInWebView();
          _layoutState = LoadState.State_Success;
        });
      }else{
        setState(() {
          _layoutState = LoadState.State_Error;
        });
      }
    });
  }

  void _showInWebView() async{
      var path1 = rootBundle.loadString("assets/css/detail.css").then((value) {
        String html = """
                <html>
                  <head>
                    <link rel='stylesheet' href='assets/css/detail.css'>
                    <body>
                      ${this._touchBody()}
                    </body>
                  </head>
                </html>
              """;
        setState(() {
          this._htmlString = html;
        });
      });
  }

  String _touchBody() {
    String body = "<div class='title'>${this._detailModel.title}</div>";
    body += "<div class='time'>${this._detailModel.ptime}</div>";
    if (this._detailModel.body != null) {
      body += this._detailModel.body;
    }

    // 遍历
    if (_detailModel.img.length > 0) {
      for (Map detailImg in _detailModel.img) {
        String ref = detailImg["ref"];
        String imgUrl = detailImg["src"];
        String pixel = detailImg["pixel"];
        String onload = "this.onclick = function(){ window.location.href = 'sx:src=' +this.src; }";


        double width = 100.0;
        double height = 100.0;

        if (pixel != null) {
          List pixels = pixel.split("*");
          if (pixels.length > 1) {
            width = double.parse(pixels[0] ?? "100");
            height = double.parse(pixels[1] ?? "100");

            double maxWidth = MediaQuery.of(context).size.width * 0.96;
            if (width > maxWidth) {
              height = maxWidth / width * height;
              width = maxWidth;
            }
          }
        }

        String imgHtml = """
        <img src=$imgUrl onload='$onload' width='$width' height='$height'>
        </img>
      """;
        body = body.replaceAll(ref, imgHtml);
      }
    }
    return body;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_detailModel.title ?? ""),
      ),
      body: Container(
        color: Colors.white,
        child: LoadStateLayout(
          state: _layoutState,
          errorRetry: () {
            setState(() {
              _layoutState = LoadState.State_Loading;
            });
            this._loadData();
          },
          successWidget: _buildDetail(),
        ),
      )
    );
  }

  Widget _buildDetail() {
    return SingleChildScrollView(
      child: Html(
        data: _htmlString ?? "",
        style: {
          "html" : Style(
            backgroundColor: Colors.white,
          ),
          "table" : Style(
            backgroundColor: Color.fromARGB(0x50, 0xee, 0xee, 0xee),
          ),
          "tr" : Style(
            border: Border(bottom: BorderSide(color: Colors.grey)),
          ),
          "th" : Style(
            padding: EdgeInsets.all(6),
            backgroundColor: Colors.grey,
          ),
          "td" : Style(
            padding: EdgeInsets.all(6),
          ),
          "var" : Style(fontFamily: 'serif'),
        },
        customRender: {
          "flutter" : (RenderContext context, Widget child, attributes, _) {
            return FlutterLogo(
              style: (attributes['horizontal'] != null) ? FlutterLogoStyle.horizontal : FlutterLogoStyle.markOnly,
              textColor: context.style.color,
              size: context.style.fontSize.size * 5,
            );
          }
        },
        onLinkTap: (url) {
          print(url);
        },
        onImageTap: (src) {
          print(src);
        },
        onImageError: (exception, stackTrace) {
          print(exception);
        },
      ),
    );
  }
}






















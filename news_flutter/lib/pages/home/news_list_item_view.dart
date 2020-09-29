
import 'package:flutter/cupertino.dart';
import 'package:news_flutter/common/constant.dart';
import 'package:news_flutter/models/NewsListModel.dart';

class NewsListItemView extends StatelessWidget {
  final NewsListModel model;
  final VoidCallback onPressed;

  const NewsListItemView({
    Key key,
    this.model,
    this.onPressed
  }): assert(model != null), super(key : key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: this.onPressed,
      child: Container(
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          border: Border(bottom: BorderSide(width: 1, color: APPColors.LinkColor)),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    this.model.title ?? "",
                    style: TextStyle(
                      color: APPColors.DarkTextColor,
                      fontSize: 18,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  Padding(padding: const EdgeInsets.only(top: 3)),
                  Text(
                    "${model.source + " " + model.replyCount.toString()}" + "跟帖",
                    style: TextStyle(
                      color: APPColors.ArrowNormalColor,
                      fontSize: 12,
                    ),
                  )
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 8.0),
              child: Image(
                image: NetworkImage(
                    model.imgsrc
                ),
                width: 120.0,
                height: 70.0,
              ),
            )
          ],
        ),
      ),
    );
  }
}

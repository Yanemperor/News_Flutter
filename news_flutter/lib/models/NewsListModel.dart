import 'package:json_annotation/json_annotation.dart';

part 'NewsListModel.g.dart';

@JsonSerializable()
class NewsListModel {
    NewsListModel();

    String sourceId;
    String template;
    String lmodify;
    String source;
    String postid;
    String title;
    String mtime;
    num hasImg;
    String topicid;
    String topic_background;
    String digest;
    String boardid;
    String alias;
    num hasAD;
    String imgsrc;
    String ptime;
    String daynum;
    String extraShowFields;
    num hasHead;
    num order;
    num votecount;
    bool hasCover;
    String docid;
    String tname;
    String url_3w;
    num priority;
    String url;
    num quality;
    num commentStatus;
    List ads;
    String ename;
    num replyCount;
    String ltitle;
    bool hasIcon;
    String subtitle;
    String cid;
    
    factory NewsListModel.fromJson(Map<String,dynamic> json) => _$NewsListModelFromJson(json);
    Map<String, dynamic> toJson() => _$NewsListModelToJson(this);
}

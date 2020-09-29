import 'package:json_annotation/json_annotation.dart';

part 'NewsDetailModel.g.dart';

@JsonSerializable()
class NewsDetailModel {
    NewsDetailModel();

    String template;
    List img;
    Map<String,dynamic> sourceinfo;
    List searchKw;
    String threadVoteSwitch;
    List picCards;
    List topiclist_news;
    List book;
    List link;
    String shareLink;
    String source;
    num threadVote;
    String title;
    String body;
    String tid;
    bool picnews;
    String advertiseType;
    List sectionTitle;
    String articleType;
    String digest;
    String statement;
    List liveRoom;
    List boboList;
    String ptime;
    String shareDigest;
    String ec;
    String docid;
    num threadAgainst;
    bool hasNext;
    String recImgsrc;
    String articleTags;
    String dkeys;
    List ydbaike;
    bool hidePlane;
    num replyCount;
    String voicecomment;
    String replyBoard;
    String foldBodyFlag;
    List votes;
    List topiclist;
    String category;
    
    factory NewsDetailModel.fromJson(Map<String,dynamic> json) => _$NewsDetailModelFromJson(json);
    Map<String, dynamic> toJson() => _$NewsDetailModelToJson(this);
}

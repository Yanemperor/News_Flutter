// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'NewsDetailModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewsDetailModel _$NewsDetailModelFromJson(Map<String, dynamic> json) {
  return NewsDetailModel()
    ..template = json['template'] as String
    ..img = json['img'] as List
    ..sourceinfo = json['sourceinfo'] as Map<String, dynamic>
    ..searchKw = json['searchKw'] as List
    ..threadVoteSwitch = json['threadVoteSwitch'] as String
    ..picCards = json['picCards'] as List
    ..topiclist_news = json['topiclist_news'] as List
    ..book = json['book'] as List
    ..link = json['link'] as List
    ..shareLink = json['shareLink'] as String
    ..source = json['source'] as String
    ..threadVote = json['threadVote'] as num
    ..title = json['title'] as String
    ..body = json['body'] as String
    ..tid = json['tid'] as String
    ..picnews = json['picnews'] as bool
    ..advertiseType = json['advertiseType'] as String
    ..sectionTitle = json['sectionTitle'] as List
    ..articleType = json['articleType'] as String
    ..digest = json['digest'] as String
    ..statement = json['statement'] as String
    ..liveRoom = json['liveRoom'] as List
    ..boboList = json['boboList'] as List
    ..ptime = json['ptime'] as String
    ..shareDigest = json['shareDigest'] as String
    ..ec = json['ec'] as String
    ..docid = json['docid'] as String
    ..threadAgainst = json['threadAgainst'] as num
    ..hasNext = json['hasNext'] as bool
    ..recImgsrc = json['recImgsrc'] as String
    ..articleTags = json['articleTags'] as String
    ..dkeys = json['dkeys'] as String
    ..ydbaike = json['ydbaike'] as List
    ..hidePlane = json['hidePlane'] as bool
    ..replyCount = json['replyCount'] as num
    ..voicecomment = json['voicecomment'] as String
    ..replyBoard = json['replyBoard'] as String
    ..foldBodyFlag = json['foldBodyFlag'] as String
    ..votes = json['votes'] as List
    ..topiclist = json['topiclist'] as List
    ..category = json['category'] as String;
}

Map<String, dynamic> _$NewsDetailModelToJson(NewsDetailModel instance) =>
    <String, dynamic>{
      'template': instance.template,
      'img': instance.img,
      'sourceinfo': instance.sourceinfo,
      'searchKw': instance.searchKw,
      'threadVoteSwitch': instance.threadVoteSwitch,
      'picCards': instance.picCards,
      'topiclist_news': instance.topiclist_news,
      'book': instance.book,
      'link': instance.link,
      'shareLink': instance.shareLink,
      'source': instance.source,
      'threadVote': instance.threadVote,
      'title': instance.title,
      'body': instance.body,
      'tid': instance.tid,
      'picnews': instance.picnews,
      'advertiseType': instance.advertiseType,
      'sectionTitle': instance.sectionTitle,
      'articleType': instance.articleType,
      'digest': instance.digest,
      'statement': instance.statement,
      'liveRoom': instance.liveRoom,
      'boboList': instance.boboList,
      'ptime': instance.ptime,
      'shareDigest': instance.shareDigest,
      'ec': instance.ec,
      'docid': instance.docid,
      'threadAgainst': instance.threadAgainst,
      'hasNext': instance.hasNext,
      'recImgsrc': instance.recImgsrc,
      'articleTags': instance.articleTags,
      'dkeys': instance.dkeys,
      'ydbaike': instance.ydbaike,
      'hidePlane': instance.hidePlane,
      'replyCount': instance.replyCount,
      'voicecomment': instance.voicecomment,
      'replyBoard': instance.replyBoard,
      'foldBodyFlag': instance.foldBodyFlag,
      'votes': instance.votes,
      'topiclist': instance.topiclist,
      'category': instance.category
    };

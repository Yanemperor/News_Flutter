// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'NewsListModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewsListModel _$NewsListModelFromJson(Map<String, dynamic> json) {
  return NewsListModel()
    ..sourceId = json['sourceId'] as String
    ..template = json['template'] as String
    ..lmodify = json['lmodify'] as String
    ..source = json['source'] as String
    ..postid = json['postid'] as String
    ..title = json['title'] as String
    ..mtime = json['mtime'] as String
    ..hasImg = json['hasImg'] as num
    ..topicid = json['topicid'] as String
    ..topic_background = json['topic_background'] as String
    ..digest = json['digest'] as String
    ..boardid = json['boardid'] as String
    ..alias = json['alias'] as String
    ..hasAD = json['hasAD'] as num
    ..imgsrc = json['imgsrc'] as String
    ..ptime = json['ptime'] as String
    ..daynum = json['daynum'] as String
    ..extraShowFields = json['extraShowFields'] as String
    ..hasHead = json['hasHead'] as num
    ..order = json['order'] as num
    ..votecount = json['votecount'] as num
    ..hasCover = json['hasCover'] as bool
    ..docid = json['docid'] as String
    ..tname = json['tname'] as String
    ..url_3w = json['url_3w'] as String
    ..priority = json['priority'] as num
    ..url = json['url'] as String
    ..quality = json['quality'] as num
    ..commentStatus = json['commentStatus'] as num
    ..ads = json['ads'] as List
    ..ename = json['ename'] as String
    ..replyCount = json['replyCount'] as num
    ..ltitle = json['ltitle'] as String
    ..hasIcon = json['hasIcon'] as bool
    ..subtitle = json['subtitle'] as String
    ..cid = json['cid'] as String;
}

Map<String, dynamic> _$NewsListModelToJson(NewsListModel instance) =>
    <String, dynamic>{
      'sourceId': instance.sourceId,
      'template': instance.template,
      'lmodify': instance.lmodify,
      'source': instance.source,
      'postid': instance.postid,
      'title': instance.title,
      'mtime': instance.mtime,
      'hasImg': instance.hasImg,
      'topicid': instance.topicid,
      'topic_background': instance.topic_background,
      'digest': instance.digest,
      'boardid': instance.boardid,
      'alias': instance.alias,
      'hasAD': instance.hasAD,
      'imgsrc': instance.imgsrc,
      'ptime': instance.ptime,
      'daynum': instance.daynum,
      'extraShowFields': instance.extraShowFields,
      'hasHead': instance.hasHead,
      'order': instance.order,
      'votecount': instance.votecount,
      'hasCover': instance.hasCover,
      'docid': instance.docid,
      'tname': instance.tname,
      'url_3w': instance.url_3w,
      'priority': instance.priority,
      'url': instance.url,
      'quality': instance.quality,
      'commentStatus': instance.commentStatus,
      'ads': instance.ads,
      'ename': instance.ename,
      'replyCount': instance.replyCount,
      'ltitle': instance.ltitle,
      'hasIcon': instance.hasIcon,
      'subtitle': instance.subtitle,
      'cid': instance.cid
    };

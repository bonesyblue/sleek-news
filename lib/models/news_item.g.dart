// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewsItem _$NewsItemFromJson(Map<String, dynamic> json) {
  return NewsItem(
    id: json['id'] as String,
    type: json['type'] as String,
    sectionId: json['sectionId'] as String,
    sectionName: json['sectionName'] as String,
    publicationDate: json['webPublicationDate'] as String,
    title: json['webTitle'] as String,
  );
}

Map<String, dynamic> _$NewsItemToJson(NewsItem instance) => <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'sectionId': instance.sectionId,
      'sectionName': instance.sectionName,
      'webPublicationDate': instance.publicationDate,
      'webTitle': instance.title,
    };
